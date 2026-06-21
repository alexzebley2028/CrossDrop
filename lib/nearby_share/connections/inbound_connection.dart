import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crossdrop/nearby_share/api/models.dart';
import 'package:crossdrop/nearby_share/connections/nearby_connection.dart';
import 'package:crossdrop/nearby_share/protobuf/offline_wire_formats.pb.dart'
    as offline;
import 'package:crossdrop/nearby_share/protobuf/securemessage.pb.dart' as sm;
import 'package:crossdrop/nearby_share/protobuf/ukey.pb.dart' as ukey;
import 'package:crossdrop/nearby_share/protobuf/wire_format.pb.dart' as wire;
import 'package:crossdrop/nearby_share/utils/data_extension.dart';
import 'package:crossdrop/nearby_share/crypto/crypto_utils.dart';
import 'package:crossdrop/settings/download_location.dart';
import 'package:cryptography/cryptography.dart';
import 'package:path/path.dart' as p;
import 'package:logging/logging.dart';

final Logger _log = Logger('inbound_connection');

enum InboundState {
  initial,
  receivedConnectionRequest,
  sentUkeyServerInit,
  receivedUkeyClientFinish,
  sentConnectionResponse, // After sending offline ConnectionResponse
  sentPairedKeyResult, // After sending wire PairedKeyResult
  receivedPairedKeyResult, // After receiving wire PairedKeyResult (awaits Introduction)
  waitingForUserConsent,
  receivingFiles,
  disconnected,
}

// Delegate definition for UI interaction
abstract class InboundNearbyConnectionDelegate {
  void obtainUserConsent(
    TransferMetadata transfer,
    RemoteDeviceInfo device,
    InboundNearbyConnection connection,
  );
  void connectionTerminated(
    InboundNearbyConnection connection,
    Exception? error,
  );
  void inboundTransferProgress(
    InboundNearbyConnection connection,
    double progress,
  );

  /// Called when a non-file payload (text, URL, or Wi-Fi credentials) has been
  /// fully received, so the UI can surface it instead of auto-opening it.
  void inboundPayloadReceived(
    InboundNearbyConnection connection,
    ReceivedPayload payload,
  );
}

class InboundNearbyConnection extends NearbyConnection {
  InboundState _currentState = InboundState.initial;
  InboundNearbyConnectionDelegate? delegate;
  Uint8List? _cipherCommitment;
  int _textPayloadID = 0;
  wire.TextMetadata_Type? _textPayloadType;
  String? _textPayloadTitle;
  int _wifiPayloadID = 0;
  String? _wifiSsid;
  wire.WifiCredentialsMetadata_SecurityType? _wifiSecurityType;
  // Non-file (text/URL/Wi-Fi) payloads still expected. The transfer only
  // completes once both these and all file payloads have arrived, so a mixed
  // file+text introduction is not torn down by whichever payload lands first.
  int _pendingBytesPayloads = 0;
  int _totalBytesToReceive = 0;
  int _totalBytesReceived = 0;
  bool _receivedClientConnectionResponse = false;

  // Store socket details
  final String _remoteIpAddress;
  final int _remotePort;

  InboundNearbyConnection(super.socket, super.id)
    : _remoteIpAddress = socket.remoteAddress.address, // Store IP
      _remotePort = socket.remotePort;

  @override
  bool isServer() => true;

  @override
  void handleConnectionClosure() {
    super.handleConnectionClosure(); // Call base class cleanup
    if (_currentState != InboundState.disconnected) {
      _currentState = InboundState.disconnected;
      _deletePartiallyReceivedFiles().catchError((e, s) {
        _log.severe("Error deleting partially received files for $id: $e\n$s");
      });
      // Use WidgetsBinding.instance.addPostFrameCallback or ensure delegate call is safe
      Future.microtask(() => delegate?.connectionTerminated(this, lastError));
    }
  }

  @override
  Future<void> processReceivedFrame(Uint8List frameData) async {
    _log.info("Inbound $id: Processing frame in state $_currentState");
    try {
      switch (_currentState) {
        case InboundState.initial:
          final frame = offline.OfflineFrame.fromBuffer(frameData);
          _processConnectionRequestFrame(frame);
          break;
        case InboundState.receivedConnectionRequest:
          final msg = ukey.Ukey2Message.fromBuffer(frameData);
          ukeyClientInitMsgData = frameData; // Store raw bytes for HKDF later
          await _processUkey2ClientInit(msg);
          break;
        case InboundState.sentUkeyServerInit:
          final msg = ukey.Ukey2Message.fromBuffer(frameData);
          if (msg.messageType != ukey.Ukey2Message_Type.CLIENT_FINISH &&
              _tryProcessClientConnectionResponse(frameData)) {
            break;
          }
          await _processUkey2ClientFinish(msg, frameData);
          break;
        case InboundState.receivedUkeyClientFinish:
          final frame = offline.OfflineFrame.fromBuffer(frameData);
          await _processConnectionResponseFrame(frame);
          break;
        case InboundState.sentConnectionResponse:
        case InboundState.sentPairedKeyResult:
        case InboundState.receivedPairedKeyResult:
        case InboundState.waitingForUserConsent:
        case InboundState.receivingFiles:
          // All subsequent frames should be encrypted SecureMessages
          final smsg = sm.SecureMessage.fromBuffer(frameData);
          await decryptAndProcessReceivedSecureMessage(smsg);
          break;
        case InboundState.disconnected:
          _log.info("Inbound $id: Received frame while disconnected.");
          break;
      }
    } catch (e, s) {
      _log.info(
        "Inbound $id: Deserialization error in state $_currentState: $e\n$s",
      );
      lastError = (e is Exception) ? e : Exception(e.toString());
      if (e is NearbyUkey2Exception) {
        return;
      } else if (e is NearbyUkey2PeerAlertException) {
        if (!connectionClosed) protocolError();
      } else if (_currentState == InboundState.receivedConnectionRequest ||
          _currentState == InboundState.sentUkeyServerInit) {
        sendUkey2Alert(
          ukey.Ukey2Alert_AlertType.BAD_MESSAGE,
        ); // Sends alert and disconnects
      } else {
        protocolError(); // Generic disconnect
      }
    }
  }

  @override
  Future<void> processTransferSetupFrame(wire.Frame frame) async {
    // These frames arrive *after* decryption
    if (frame.hasV1() && frame.v1.type == wire.V1Frame_FrameType.CANCEL) {
      _log.info("Inbound $id: Transfer cancelled by sender.");
      lastError = NearbyCancellationException(CancellationReason.userCanceled);
      await sendDisconnectionAndDisconnect();
      return;
    }

    switch (_currentState) {
      case InboundState.sentConnectionResponse:
        // Expecting PAIRED_KEY_ENCRYPTION
        if (!frame.hasV1() || !frame.v1.hasPairedKeyEncryption()) {
          throw NearbyProtocolException(
            "Expected PairedKeyEncryption, got ${frame.v1.type}",
          );
        }
        await _processPairedKeyEncryptionFrame(frame);
        break;
      case InboundState.sentPairedKeyResult:
        // Expecting PAIRED_KEY_RESULT
        if (!frame.hasV1() || !frame.v1.hasPairedKeyResult()) {
          throw NearbyProtocolException(
            "Expected PairedKeyResult, got ${frame.v1.type}",
          );
        }
        await _processPairedKeyResultFrame(frame);
        break;
      case InboundState.receivedPairedKeyResult:
        // Expecting INTRODUCTION
        if (!frame.hasV1() || !frame.v1.hasIntroduction()) {
          throw NearbyProtocolException(
            "Expected Introduction, got ${frame.v1.type}",
          );
        }
        await _processIntroductionFrame(frame);
        break;
      default:
        _log.info(
          "Inbound $id: Ignoring unexpected transfer setup frame in state "
          "$_currentState: ${frame.toProto3Json()}",
        );
    }
  }

  @override
  Future<void> processFileChunk(offline.PayloadTransferFrame frame) async {
    final header = frame.payloadHeader;
    final chunk = frame.payloadChunk;
    final payloadId = header.id.toInt();

    final fileInfo = transferredFiles[payloadId];
    if (fileInfo == null) {
      throw NearbyProtocolException("File payload ID $payloadId is not known");
    }

    final currentOffset = fileInfo.bytesTransferred;
    if (chunk.offset.toInt() != currentOffset) {
      throw NearbyProtocolException(
        "Invalid offset into file ${chunk.offset}, expected $currentOffset",
      );
    }
    if (currentOffset + chunk.body.length > fileInfo.meta.size) {
      throw NearbyProtocolException(
        "Transferred file size exceeds previously specified value",
      );
    }

    if (chunk.body.isNotEmpty) {
      if (fileInfo.fileHandle == null) {
        // This should ideally not happen if acceptTransfer worked
        _log.info(
          "Warning: File handle for payload $payloadId is null, attempting to reopen.",
        );
        try {
          fileInfo.fileHandle = await File(
            fileInfo.destinationPath,
          ).open(mode: FileMode.append);
          // If reopening, seek to the correct position just in case
          await fileInfo.fileHandle!.setPosition(currentOffset);
        } catch (e) {
          throw NearbyIOException();
        }
      }
      try {
        await fileInfo.fileHandle!.writeFrom(chunk.body);
        fileInfo.bytesTransferred += chunk.body.length;
        _totalBytesReceived += chunk.body.length;
        _publishTransferProgress();
      } catch (e) {
        throw NearbyIOException();
      }
    }

    // Check for LAST_CHUNK flag
    if ((chunk.flags & 1) == 1) {
      _log.info("Inbound $id: Received last chunk for payload $payloadId");
      await fileInfo.fileHandle?.close();
      fileInfo.fileHandle = null; // Mark as closed
      transferredFiles.remove(payloadId); // Remove completed transfer
      await _maybeFinishTransfer();
    }
  }

  /// Disconnects once every expected payload — files and non-file (text / URL /
  /// Wi-Fi) — has been received.
  Future<void> _maybeFinishTransfer() async {
    if (transferredFiles.isEmpty && _pendingBytesPayloads <= 0) {
      _log.info("Inbound $id: All payloads received, disconnecting.");
      await sendDisconnectionAndDisconnect();
    }
  }

  @override
  Future<bool> processBytesPayload(Uint8List payload, int payloadId) async {
    if (payloadId == _textPayloadID && _textPayloadID != 0) {
      final content = utf8.decode(payload);
      final isUrl = _textPayloadType == wire.TextMetadata_Type.URL;
      _log.info(
        "Inbound $id: Received ${isUrl ? 'URL' : 'text'} payload "
        "($payloadId)",
      );
      _reportReceivedPayload(
        ReceivedPayload(
          kind: isUrl ? ReceivedPayloadKind.url : ReceivedPayloadKind.text,
          title: _textPayloadTitle,
          text: content,
        ),
      );
      _pendingBytesPayloads--;
      await _maybeFinishTransfer();
      return true; // Handled
    } else if (payloadId == _wifiPayloadID && _wifiPayloadID != 0) {
      String? password;
      try {
        password = wire.WifiCredentials.fromBuffer(payload).password;
      } catch (e) {
        _log.info("Inbound $id: Failed to parse Wi-Fi credentials: $e");
      }
      _log.info("Inbound $id: Received Wi-Fi credentials for $_wifiSsid");
      _reportReceivedPayload(
        ReceivedPayload(
          kind: ReceivedPayloadKind.wifi,
          title: _wifiSsid,
          wifiSsid: _wifiSsid,
          wifiPassword: (password != null && password.isNotEmpty)
              ? password
              : null,
          wifiSecurityType: _wifiSecurityLabel(_wifiSecurityType),
        ),
      );
      _pendingBytesPayloads--;
      await _maybeFinishTransfer();
      return true; // Handled
    } else {
      // Check if it's a text payload that we decided to save as a file
      final fileInfo = transferredFiles[payloadId];
      if (fileInfo != null && fileInfo.meta.mimeType == "text/plain") {
        if (fileInfo.fileHandle == null) {
          _log.info(
            "Warning: File handle for text payload $payloadId is null, attempting to reopen.",
          );
          try {
            fileInfo.fileHandle = await File(
              fileInfo.destinationPath,
            ).open(mode: FileMode.append);
          } catch (e) {
            throw NearbyIOException();
          }
        }
        try {
          await fileInfo.fileHandle!.writeFrom(payload);
          fileInfo.bytesTransferred += payload.length;
          _totalBytesReceived += payload.length;
          _publishTransferProgress();
          await fileInfo.fileHandle!.close();
          fileInfo.fileHandle = null;
          transferredFiles.remove(payloadId);
          _log.info(
            "Inbound $id: Finished writing text payload $payloadId to file.",
          );
          await _maybeFinishTransfer();
          return true; // Handled
        } catch (e) {
          throw NearbyIOException();
        }
      }
    }
    return false; // Not handled as a direct bytes payload here
  }

  // --- Private Processing Methods ---

  void _processConnectionRequestFrame(offline.OfflineFrame frame) {
    if (!frame.hasV1() ||
        !frame.v1.hasConnectionRequest() ||
        !frame.v1.connectionRequest.hasEndpointInfo()) {
      throw NearbyRequiredFieldMissingException(
        "connectionRequest | endpointInfo",
      );
    }
    if (frame.v1.type != offline.V1Frame_FrameType.CONNECTION_REQUEST) {
      throw NearbyProtocolException(
        "Expected CONNECTION_REQUEST, got ${frame.v1.type}",
      );
    }

    final endpointInfoBytes = frame.v1.connectionRequest.endpointInfo;
    try {
      final endpointInfo = EndpointInfo.deserialize(
        Uint8List.fromList(endpointInfoBytes),
      );

      // Create RemoteDeviceInfo initially without IP/Port from EndpointInfo payload
      final deviceInfo = RemoteDeviceInfo.fromEndpointInfo(
        endpointInfo,
        id,
        null, // IP not in EndpointInfo payload
        null, // Port not in EndpointInfo payload
      );

      // Now update it with the actual IP and Port from the socket
      remoteDeviceInfo = deviceInfo.copyWith(
        ipAddress: _remoteIpAddress,
        port: _remotePort,
      );

      _log.info(
        "Inbound $id: Received connection request from ${remoteDeviceInfo!.name} (${remoteDeviceInfo!.type}) at $_remoteIpAddress:$_remotePort",
      );
      _currentState = InboundState.receivedConnectionRequest;
    } catch (e) {
      throw NearbyProtocolException("Failed to parse endpoint info: $e");
    }
  }

  Future<void> _processUkey2ClientInit(ukey.Ukey2Message msg) async {
    if (msg.messageType != ukey.Ukey2Message_Type.CLIENT_INIT) {
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_MESSAGE_TYPE);
      throw NearbyUkey2Exception();
    }
    if (!msg.hasMessageData()) {
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_MESSAGE_DATA);
      throw NearbyRequiredFieldMissingException("clientInit ukey2message.data");
    }

    ukey.Ukey2ClientInit clientInit;
    try {
      clientInit = ukey.Ukey2ClientInit.fromBuffer(msg.messageData);
    } catch (e) {
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_MESSAGE_DATA);
      throw NearbyUkey2Exception();
    }

    if (clientInit.version != 1) {
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_VERSION);
      throw NearbyUkey2Exception();
    }
    if (clientInit.random.length != 32) {
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_RANDOM);
      throw NearbyUkey2Exception();
    }

    bool foundP256 = false;
    for (final commitment in clientInit.cipherCommitments) {
      if (commitment.handshakeCipher == ukey.Ukey2HandshakeCipher.P256_SHA512) {
        foundP256 = true;
        _cipherCommitment = Uint8List.fromList(commitment.commitment);
        break;
      }
    }
    if (!foundP256) {
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_HANDSHAKE_CIPHER);
      throw NearbyUkey2Exception();
    }

    final nextProto = clientInit.hasNextProtocol()
        ? clientInit.nextProtocol
        : null;
    if (nextProto != "AES_256_CBC-HMAC_SHA256") {
      // Note: Swift code checks exact match. Let's be strict too.
      _log.info(
        "Warning: Client proposed next protocol '$nextProto', expected 'AES_256_CBC-HMAC_SHA256'",
      );
      // Allowing for now, but might require alert in stricter implementations.
      // sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_NEXT_PROTOCOL);
      // throw NearbyUkey2Exception();
    }

    // Generate our keys (using PointyCastle)
    final (privKey, pubKey) = generateP256KeyPairPointyCastle();
    ukeyPrivateKey = privKey;
    ukeyPublicKey = pubKey;

    final serverInit = ukey.Ukey2ServerInit(
      version: 1,
      random: generateRandomBytes(32),
      handshakeCipher: ukey.Ukey2HandshakeCipher.P256_SHA512,
      publicKey: genericPublicKeyFromPointyCastle(pubKey).writeToBuffer(),
    );

    final serverInitMsg = ukey.Ukey2Message(
      messageType: ukey.Ukey2Message_Type.SERVER_INIT,
      messageData: serverInit.writeToBuffer(),
    );

    final serverInitData = serverInitMsg.writeToBuffer();
    ukeyServerInitMsgData = serverInitData; // Store raw bytes for HKDF
    await sendFrame(serverInitData);
    _currentState = InboundState.sentUkeyServerInit;
  }

  Future<void> _processUkey2ClientFinish(
    ukey.Ukey2Message msg,
    Uint8List rawMsgData,
  ) async {
    if (msg.messageType == ukey.Ukey2Message_Type.ALERT) {
      final alert = msg.hasMessageData()
          ? ukey.Ukey2Alert.fromBuffer(msg.messageData)
          : null;
      throw NearbyUkey2PeerAlertException(
        alert?.type.name ?? 'missing alert data',
      );
    }
    if (msg.messageType != ukey.Ukey2Message_Type.CLIENT_FINISH) {
      _log.info(
        "Inbound $id: Expected UKEY2 ClientFinish, got ${msg.messageType}",
      );
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_MESSAGE_TYPE);
      throw NearbyUkey2Exception();
    }
    if (!msg.hasMessageData()) {
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_MESSAGE_DATA);
      throw NearbyRequiredFieldMissingException(
        "clientFinish ukey2message.data",
      );
    }

    if (_cipherCommitment == null) {
      // Should not happen if ClientInit processing was correct
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_MESSAGE_DATA);
      throw NearbyUkey2Exception();
    }

    final digest = await Sha512().hash(rawMsgData);
    if (!listsEqual(digest.bytes, _cipherCommitment!)) {
      _log.info("Cipher commitment mismatch!");
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_MESSAGE_DATA);
      throw NearbyUkey2Exception();
    }
    _log.info("Cipher commitment verified.");

    try {
      final clientFinish = ukey.Ukey2ClientFinished.fromBuffer(msg.messageData);
      if (!clientFinish.hasPublicKey()) {
        throw NearbyRequiredFieldMissingException(
          "ukey2clientFinish.publicKey",
        );
      }
      final clientKeyProto = sm.GenericPublicKey.fromBuffer(
        clientFinish.publicKey,
      );

      await finalizeKeyExchange(clientKeyProto);
      _log.info("Inbound $id: UKEY2 Handshake Complete. PIN: $pinCode");
      _currentState = InboundState.receivedUkeyClientFinish;
      if (_receivedClientConnectionResponse) {
        await _sendConnectionResponseAndPairedEncryption();
      }
    } catch (e, s) {
      _log.severe("Error processing ClientFinish payload: $e\n$s");
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_MESSAGE_DATA);
      throw NearbyUkey2Exception();
    }
  }

  bool _tryProcessClientConnectionResponse(Uint8List frameData) {
    try {
      final frame = offline.OfflineFrame.fromBuffer(frameData);
      if (!frame.hasV1() ||
          frame.v1.type != offline.V1Frame_FrameType.CONNECTION_RESPONSE ||
          !frame.v1.hasConnectionResponse()) {
        return false;
      }
      _validateClientConnectionResponse(frame);
      _receivedClientConnectionResponse = true;
      _log.info("Inbound $id: Received early plaintext ConnectionResponse");
      return true;
    } catch (_) {
      return false;
    }
  }

  void _validateClientConnectionResponse(offline.OfflineFrame frame) {
    if (!frame.hasV1() ||
        frame.v1.type != offline.V1Frame_FrameType.CONNECTION_RESPONSE) {
      throw NearbyProtocolException(
        "Expected plaintext ConnectionResponse, got ${frame.v1.type}",
      );
    }
    if (!frame.v1.hasConnectionResponse()) {
      throw NearbyRequiredFieldMissingException("frame.v1.connectionResponse");
    }
    if (frame.v1.connectionResponse.response !=
        offline.ConnectionResponseFrame_ResponseStatus.ACCEPT) {
      throw NearbyProtocolException(
        "Client rejected connection after UKEY2: ${frame.v1.connectionResponse.response}",
      );
    }
  }

  Future<void> _processConnectionResponseFrame(
    offline.OfflineFrame frame,
  ) async {
    _validateClientConnectionResponse(frame);
    _receivedClientConnectionResponse = true;
    await _sendConnectionResponseAndPairedEncryption();
  }

  Future<void> _sendConnectionResponseAndPairedEncryption() async {
    final connResp = offline.ConnectionResponseFrame(
      response: offline.ConnectionResponseFrame_ResponseStatus.ACCEPT,
      status: 0,
      osInfo: offline.OsInfo(type: _platformOsType()),
    );
    final v1Frame = offline.V1Frame(
      type: offline.V1Frame_FrameType.CONNECTION_RESPONSE,
      connectionResponse: connResp,
    );
    final offlineFrame = offline.OfflineFrame(
      version: offline.OfflineFrame_Version.V1,
      v1: v1Frame,
    );
    await sendFrame(offlineFrame.writeToBuffer());
    _log.info("Inbound $id: Sent plaintext ConnectionResponse");

    encryptionDone = true;

    final pairedEncFrame = wire.PairedKeyEncryptionFrame(
      secretIdHash: generateRandomBytes(6),
      signedData: generateRandomBytes(72),
    );
    final v1WireFrame = wire.V1Frame(
      type: wire.V1Frame_FrameType.PAIRED_KEY_ENCRYPTION,
      pairedKeyEncryption: pairedEncFrame,
    );
    final wireFrame = wire.Frame(
      version: wire.Frame_Version.V1,
      v1: v1WireFrame,
    );

    await sendTransferSetupFrame(wireFrame);
    _log.info("Inbound $id: Sent encrypted PairedKeyEncryption");
    _currentState = InboundState.sentConnectionResponse;
  }

  offline.OsInfo_OsType _platformOsType() {
    if (Platform.isLinux) return offline.OsInfo_OsType.LINUX;
    if (Platform.isMacOS || Platform.isIOS) return offline.OsInfo_OsType.APPLE;
    if (Platform.isWindows) return offline.OsInfo_OsType.WINDOWS;
    if (Platform.isAndroid) return offline.OsInfo_OsType.ANDROID;
    return offline.OsInfo_OsType.UNKNOWN_OS_TYPE;
  }

  // Handles the encrypted PAIRED_KEY_ENCRYPTION frame from the client
  Future<void> _processPairedKeyEncryptionFrame(wire.Frame frame) async {
    _log.info("Inbound $id: Processing PairedKeyEncryption");
    // We don't actually *use* the data, just send back UNABLE result like Swift
    final pairedResultFrame = wire.PairedKeyResultFrame(
      status: wire.PairedKeyResultFrame_Status.UNABLE,
    );
    final v1WireFrame = wire.V1Frame(
      type: wire.V1Frame_FrameType.PAIRED_KEY_RESULT,
      pairedKeyResult: pairedResultFrame,
    );
    final wireFrame = wire.Frame(
      version: wire.Frame_Version.V1,
      v1: v1WireFrame,
    );

    await sendTransferSetupFrame(wireFrame);
    _log.info("Inbound $id: Sent PairedKeyResult (UNABLE)");
    _currentState = InboundState.sentPairedKeyResult;
  }

  // Handles the encrypted PAIRED_KEY_RESULT frame from the client
  Future<void> _processPairedKeyResultFrame(wire.Frame frame) async {
    _log.info("Inbound $id: Processing PairedKeyResult");
    // We don't care about the result, just move to the next state
    // where we expect the Introduction frame.
    _currentState = InboundState.receivedPairedKeyResult;
    _log.info("Inbound $id: Ready to receive Introduction frame");
  }

  // Handles the Introduction frame (list of files/text)
  Future<void> _processIntroductionFrame(wire.Frame frame) async {
    _log.info("Inbound $id: Processing Introduction");
    if (!frame.hasV1() || !frame.v1.hasIntroduction()) {
      throw NearbyRequiredFieldMissingException("frame.v1.introduction");
    }
    _currentState = InboundState.waitingForUserConsent;
    final introduction = frame.v1.introduction;

    List<ShareFileMetadata> filesMeta = [];
    String? textDesc;

    // Prepare file info if files are present
    if (introduction.fileMetadata.isNotEmpty) {
      final destinationDir = await _transferDestinationDirectory();
      if (destinationDir == null) {
        // Handle error: Unable to get downloads directory
        await rejectTransfer(
          reason: wire.ConnectionResponseFrame_Status.NOT_ENOUGH_SPACE,
        ); // Or a different error?
        return;
      }
      final downloadsPath = destinationDir.path;

      for (final file in introduction.fileMetadata) {
        // Ensure payloadId is treated as int
        final payloadIdInt = file.payloadId.toInt();
        if (payloadIdInt == 0) {
          // Should not happen with random IDs
          _log.info(
            "Warning: Received file metadata with payload ID 0 for ${file.name}",
          );
          continue; // Skip this file potentially
        }
        final safeName = _sanitizeFileName(file.name);
        final destPath = await _makeUniqueFilePath(
          p.join(downloadsPath, safeName),
        );
        final fileMeta = ShareFileMetadata(
          name: p.basename(destPath),
          size: file.size.toInt(),
          mimeType: file.mimeType.isNotEmpty
              ? file.mimeType
              : 'application/octet-stream',
          localPath: destPath,
        );
        filesMeta.add(fileMeta);
        _totalBytesToReceive += fileMeta.size;
        transferredFiles[payloadIdInt] = InternalFileInfo(
          meta: fileMeta,
          payloadID: payloadIdInt,
          destinationPath: destPath,
        );
      }
    }

    // Handle text / URL metadata. Unlike files, the content is surfaced to the
    // UI when it arrives (after the user accepts) rather than written to disk,
    // so the receiver can copy it or choose to open it.
    if (introduction.textMetadata.isNotEmpty) {
      if (introduction.textMetadata.length == 1) {
        final textMeta = introduction.textMetadata.first;
        final payloadIdInt = textMeta.payloadId.toInt();
        if (payloadIdInt == 0) {
          _log.info(
            "Warning: Received text metadata with payload ID 0 for ${textMeta.textTitle}",
          );
          await rejectTransfer(
            reason: wire.ConnectionResponseFrame_Status.REJECT,
          );
          return;
        }
        _textPayloadID = payloadIdInt;
        _pendingBytesPayloads++;
        _textPayloadType = textMeta.type;
        _textPayloadTitle = textMeta.textTitle.isNotEmpty
            ? textMeta.textTitle
            : null;
        textDesc =
            _textPayloadTitle ??
            (textMeta.type == wire.TextMetadata_Type.URL ? "Link" : "Text");
      } else {
        await rejectTransfer(
          reason:
              wire.ConnectionResponseFrame_Status.UNSUPPORTED_ATTACHMENT_TYPE,
        );
        return;
      }
    }

    // Handle Wi-Fi credentials metadata. The SSID is known up front; the
    // password arrives as a bytes payload after the user accepts.
    if (introduction.wifiCredentialsMetadata.isNotEmpty) {
      if (introduction.wifiCredentialsMetadata.length == 1 &&
          introduction.textMetadata.isEmpty) {
        final wifiMeta = introduction.wifiCredentialsMetadata.first;
        final payloadIdInt = wifiMeta.payloadId.toInt();
        if (payloadIdInt == 0) {
          await rejectTransfer(
            reason: wire.ConnectionResponseFrame_Status.REJECT,
          );
          return;
        }
        _wifiPayloadID = payloadIdInt;
        _pendingBytesPayloads++;
        _wifiSsid = wifiMeta.ssid;
        _wifiSecurityType = wifiMeta.securityType;
        textDesc = wifiMeta.ssid.isNotEmpty
            ? 'Wi-Fi: ${wifiMeta.ssid}'
            : 'Wi-Fi network';
      } else {
        await rejectTransfer(
          reason:
              wire.ConnectionResponseFrame_Status.UNSUPPORTED_ATTACHMENT_TYPE,
        );
        return;
      }
    }

    if (filesMeta.isEmpty && textDesc == null) {
      _log.info("Inbound $id: Introduction frame has no actionable content.");
      await rejectTransfer(reason: wire.ConnectionResponseFrame_Status.REJECT);
      return;
    }

    final transferMeta = TransferMetadata(
      files: filesMeta,
      id: id, // Use connection ID for transfer tracking
      pinCode: pinCode, // Get pinCode from NearbyConnection base class
      textDescription: textDesc,
    );

    // Ensure remoteDeviceInfo is not null before accessing it
    if (remoteDeviceInfo == null) {
      // This shouldn't happen if ConnectionRequest was processed correctly
      throw StateError(
        "RemoteDeviceInfo is null when trying to obtain user consent",
      );
    }
    Future.microtask(
      () => delegate?.obtainUserConsent(transferMeta, remoteDeviceInfo!, this),
    );
  }

  // Called by the UI/Manager to accept or reject the transfer
  Future<void> submitUserConsent(bool accepted) async {
    if (_currentState != InboundState.waitingForUserConsent) {
      _log.info(
        "Inbound $id: submitUserConsent called in unexpected state: $_currentState",
      );
      return;
    }

    if (accepted) {
      await acceptTransfer();
    } else {
      await rejectTransfer();
    }
  }

  // --- Private Helper Methods ---

  Future<void> acceptTransfer() async {
    _log.info("Inbound $id: Transfer accepted by user.");
    try {
      // Create files and open handles *before* sending ACCEPT
      for (final entry in transferredFiles.entries) {
        final payloadId = entry.key;
        final fileInfo = entry.value;
        try {
          final file = File(fileInfo.destinationPath);
          // Ensure directory exists
          await file.parent.create(recursive: true);
          // The destination path has already been uniqued; start with a clean file.
          fileInfo.fileHandle = await file.open(mode: FileMode.write);
          fileInfo.created = true;
          _log.info(
            "Inbound $id: Opened file handle for payload $payloadId at "
            "${fileInfo.destinationPath}",
          );
          // TODO: Initialize and publish progress if needed
        } catch (e, s) {
          lastError = NearbyIOException(
            "Failed to create received file ${fileInfo.destinationPath}: $e",
          );
          _log.info(
            "Inbound $id: Failed to create/open file for payload $payloadId "
            "at ${fileInfo.destinationPath}: $e\n$s",
          );
          // Clean up already opened files before rejecting
          await _cleanupFailedAccept();
          await rejectTransfer(
            reason: wire.ConnectionResponseFrame_Status.NOT_ENOUGH_SPACE,
          ); // Or a generic failure?
          return;
        }
      }

      // Send ACCEPT response
      final responseFrame = wire.ConnectionResponseFrame(
        status: wire.ConnectionResponseFrame_Status.ACCEPT,
      );
      final v1WireFrame = wire.V1Frame(
        type: wire.V1Frame_FrameType.RESPONSE,
        connectionResponse: responseFrame,
      );
      final wireFrame = wire.Frame(
        version: wire.Frame_Version.V1,
        v1: v1WireFrame,
      );

      await sendTransferSetupFrame(wireFrame);
      _currentState = InboundState.receivingFiles;
      _log.info(
        "Inbound $id: Sent ACCEPT response, entering receivingFiles state.",
      );
    } catch (e, s) {
      _log.severe("Inbound $id: Error during acceptTransfer: $e\n$s");
      lastError = (e is Exception) ? e : Exception(e.toString());
      // Attempt to clean up and disconnect
      await _cleanupFailedAccept();
      protocolError();
    }
  }

  Future<void> _cleanupFailedAccept() async {
    for (final fileInfo in transferredFiles.values) {
      await fileInfo.fileHandle?.close();
      if (fileInfo.created) {
        try {
          await File(fileInfo.destinationPath).delete();
        } catch (e) {
          _log.info(
            "Failed to delete partially created file ${fileInfo.destinationPath}: $e",
          );
        }
      }
    }
    transferredFiles.clear(); // Clear the map
  }

  void _publishTransferProgress() {
    if (_totalBytesToReceive <= 0) return;
    delegate?.inboundTransferProgress(
      this,
      (_totalBytesReceived / _totalBytesToReceive).clamp(0, 1).toDouble(),
    );
  }

  Future<void> rejectTransfer({
    wire.ConnectionResponseFrame_Status reason =
        wire.ConnectionResponseFrame_Status.REJECT,
  }) async {
    lastError ??= NearbyCancellationException(
      wireStatusToCancellationReason(reason) ?? CancellationReason.userRejected,
    );
    _log.info("Inbound $id: Rejecting transfer with reason: $reason");
    final responseFrame = wire.ConnectionResponseFrame(status: reason);
    final v1WireFrame = wire.V1Frame(
      type: wire.V1Frame_FrameType.RESPONSE,
      connectionResponse: responseFrame,
    );
    final wireFrame = wire.Frame(
      version: wire.Frame_Version.V1,
      v1: v1WireFrame,
    );

    try {
      await sendTransferSetupFrame(wireFrame);
      await sendDisconnectionAndDisconnect(); // Disconnect after sending rejection
    } catch (e, s) {
      _log.severe("Inbound $id: Error sending rejection/disconnection: $e\n$s");
      protocolError(); // Force disconnect on error
    }
    // No need to change state here, sendDisconnection handles it
  }

  Future<void> _deletePartiallyReceivedFiles() async {
    _log.info("Inbound $id: Cleaning up partially received files...");
    for (final fileInfo in transferredFiles.values) {
      await fileInfo.fileHandle?.close(); // Close handle if open
      if (fileInfo.created) {
        // Only delete if we actually created it
        try {
          final file = File(fileInfo.destinationPath);
          if (await file.exists()) {
            await file.delete();
            _log.info("Deleted partial file: ${fileInfo.destinationPath}");
          }
        } catch (e) {
          _log.info(
            "Error deleting partially received file ${fileInfo.destinationPath}: $e",
          );
        }
      }
    }
    transferredFiles.clear(); // Clear the tracking map
  }

  String _sanitizeFileName(String name) {
    // Basic sanitization: replace reserved characters with underscore
    // More robust sanitization might be needed depending on target platforms
    return name.replaceAll(RegExp(r'[\\/:\*\?"<>\|]'), '_');
  }

  Future<Directory?> _transferDestinationDirectory() async {
    try {
      return await DownloadLocation.instance.resolve();
    } catch (e, s) {
      _log.severe("Inbound $id: Failed to resolve download directory: $e\n$s");
      return null;
    }
  }

  void _reportReceivedPayload(ReceivedPayload payload) {
    final delegate = this.delegate;
    if (delegate == null) return;
    Future.microtask(() => delegate.inboundPayloadReceived(this, payload));
  }

  String? _wifiSecurityLabel(wire.WifiCredentialsMetadata_SecurityType? type) {
    switch (type) {
      case wire.WifiCredentialsMetadata_SecurityType.OPEN:
        return 'Open';
      case wire.WifiCredentialsMetadata_SecurityType.WPA_PSK:
        return 'WPA';
      case wire.WifiCredentialsMetadata_SecurityType.WEP:
        return 'WEP';
      case wire.WifiCredentialsMetadata_SecurityType.SAE:
        return 'WPA3';
      default:
        return null;
    }
  }

  Future<String> _makeUniqueFilePath(String initialPath) async {
    String dir = p.dirname(initialPath);
    String filename = p.basenameWithoutExtension(initialPath);
    String ext = p.extension(initialPath);
    String finalPath = initialPath;
    int counter = 1;

    while (await File(finalPath).exists() ||
        await Directory(finalPath).exists()) {
      finalPath = p.join(dir, '$filename ($counter)$ext');
      counter++;
    }
    return finalPath;
  }
}
