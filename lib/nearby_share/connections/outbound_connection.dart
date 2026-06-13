import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crossdrop/device.dart';
import 'package:crossdrop/nearby_share/api/models.dart';
import 'package:crossdrop/nearby_share/connections/nearby_connection.dart';
import 'package:crossdrop/nearby_share/protobuf/offline_wire_formats.pb.dart'
    as offline;
import 'package:crossdrop/nearby_share/protobuf/securemessage.pb.dart' as sm;
import 'package:crossdrop/nearby_share/protobuf/ukey.pb.dart' as ukey;
import 'package:crossdrop/nearby_share/protobuf/wire_format.pb.dart' as wire;
import 'package:crossdrop/nearby_share/utils/data_extension.dart';
import 'package:crossdrop/nearby_share/crypto/crypto_utils.dart';
import 'package:crossdrop/nearby_share/crypto/quick_share_qr.dart';
import 'package:cryptography/cryptography.dart';
import 'package:fixnum/fixnum.dart';
import 'package:mime/mime.dart'; // For MIME type lookup
import 'package:path/path.dart' as p; // For path operations
import 'package:logging/logging.dart';

final Logger _log = Logger('outbound_connection');

// To request storage permission if needed

enum OutboundState {
  initial,
  sentUkeyClientInit,
  sentUkeyClientFinish, // After sending ClientFinish + plaintext ConnectionResponse
  sentPairedKeyEncryption, // After sending encrypted PairedKeyEncryption
  sentPairedKeyResult, // After sending encrypted PairedKeyResult
  sentIntroduction, // After sending Introduction (waits for ACCEPT/REJECT)
  sendingFiles,
  disconnected,
}

// Delegate definition
abstract class OutboundNearbyConnectionDelegate {
  void outboundConnectionEstablished(OutboundNearbyConnection connection);
  void outboundConnectionFailed(
    OutboundNearbyConnection connection,
    Exception error,
  );
  void outboundTransferAccepted(OutboundNearbyConnection connection);
  void outboundTransferProgress(
    OutboundNearbyConnection connection,
    double progress,
  );
  void outboundTransferFinished(OutboundNearbyConnection connection);
}

class OutboundNearbyConnection extends NearbyConnection {
  OutboundState _currentState = OutboundState.initial;
  final List<String> _urlsToSend; // List of file paths or a single non-file URL
  final String _endpointId;
  final QuickShareQrCode? _quickShareQrCode;
  Uint8List? _ukeyClientFinishMsgData;
  List<OutgoingFileTransfer> _transferQueue = [];
  OutgoingFileTransfer? _currentTransfer;
  OutboundNearbyConnectionDelegate? delegate;
  int _totalBytesToSend = 0;
  int _totalBytesSent = 0;
  bool _cancelled = false;
  bool _awaitingRemoteCompletion = false;
  bool _completionReported = false;
  int _textPayloadID = 0; // Use int

  OutboundNearbyConnection(
    super.socket,
    super.id,
    List<String> urlsToSend, {
    required String endpointId,
    QuickShareQrCode? quickShareQrCode,
  }) : _urlsToSend = urlsToSend,
       _endpointId = endpointId,
       _quickShareQrCode = quickShareQrCode {
    if (urlsToSend.length == 1 && !File(urlsToSend[0]).existsSync()) {
      // Heuristic for non-file URL
      _textPayloadID = generatePositivePayloadId();
    }
  }

  @override
  void start() {
    // Request necessary permissions before starting connection logic if needed
    // e.g., _requestPermissions().then((granted) { if (granted) super.start(); });
    // For now, assume permissions are handled elsewhere.
    super.start();
  }

  // Example permission request (adapt as needed for your target platforms/files)
  // Future<bool> _requestPermissions() async {
  //   if (Platform.isAndroid || Platform.isIOS) {
  //     var status = await Permission.storage.status;
  //     if (!status.isGranted) {
  //       status = await Permission.storage.request();
  //     }
  //     return status.isGranted;
  //   }
  //   return true; // Assume granted on desktop for now
  // }

  void cancel() {
    if (_currentState == OutboundState.disconnected) return;
    _log.info("Outbound $id: Cancelling transfer.");
    _cancelled = true;

    // Try to send CANCEL frame if handshake is complete enough
    if (encryptionDone) {
      final cancelFrame = wire.V1Frame(type: wire.V1Frame_FrameType.CANCEL);
      final wireFrame = wire.Frame(
        version: wire.Frame_Version.V1,
        v1: cancelFrame,
      );
      sendTransferSetupFrame(wireFrame)
          .catchError((e, s) {
            _log.severe("Outbound $id: Error sending CANCEL frame: $e\n$s");
          })
          .whenComplete(() {
            // Proceed with disconnection regardless of CANCEL success
            sendDisconnectionAndDisconnect().catchError((e, s) {
              _log.info(
                "Outbound $id: Error during disconnect after cancel: $e\n$s",
              );
              protocolError(); // Force close if disconnect fails
            });
          });
    } else {
      // If handshake not done, just disconnect
      sendDisconnectionAndDisconnect().catchError((e, s) {
        _log.severe(
          "Outbound $id: Error during disconnect on early cancel: $e\n$s",
        );
        protocolError();
      });
    }
  }

  @override
  bool isServer() => false;

  @override
  void connectionReady() {
    super.connectionReady();
    _sendConnectionRequest()
        .then((_) {
          return _sendUkey2ClientInit();
        })
        .catchError(_handleAsyncError);
  }

  @override
  void handleConnectionClosure() {
    super.handleConnectionClosure(); // Call base class cleanup
    if (_currentState != OutboundState.disconnected) {
      _currentState = OutboundState.disconnected;
      _cleanupFileHandles();
      if (_awaitingRemoteCompletion && lastError == null) {
        _reportTransferFinished();
      } else if (!_cancelled || lastError != null) {
        // Report failure unless cancelled gracefully *after* finishing normally
        Future.microtask(
          () => delegate?.outboundConnectionFailed(
            this,
            lastError ?? NearbyApiException("Connection closed unexpectedly"),
          ),
        );
      }
    }
  }

  void _reportTransferFinished() {
    if (_completionReported) return;
    _completionReported = true;
    Future.microtask(() => delegate?.outboundTransferFinished(this));
  }

  @override
  Future<void> processReceivedFrame(Uint8List frameData) async {
    _log.info("Outbound $id: Processing frame in state $_currentState");
    if (_cancelled) {
      _log.info("Outbound $id: Ignoring frame because transfer is cancelled.");
      return;
    }
    try {
      switch (_currentState) {
        case OutboundState.initial:
          // Should not receive anything before sending ClientInit
          throw NearbyProtocolException("Received frame in initial state");
        case OutboundState.sentUkeyClientInit:
          final msg = ukey.Ukey2Message.fromBuffer(frameData);
          await _processUkey2ServerInit(msg, frameData);
          break;
        case OutboundState.sentUkeyClientFinish:
          // Expecting unencrypted ConnectionResponse ACK before encrypted setup.
          final frame = offline.OfflineFrame.fromBuffer(frameData);
          await _processConnectionResponseAck(frame);
          break;
        case OutboundState.sentPairedKeyEncryption:
        case OutboundState.sentPairedKeyResult:
        case OutboundState.sentIntroduction:
        case OutboundState.sendingFiles:
          // All subsequent frames should be encrypted SecureMessages
          final smsg = sm.SecureMessage.fromBuffer(frameData);
          await decryptAndProcessReceivedSecureMessage(smsg);
          break;
        case OutboundState.disconnected:
          _log.info("Outbound $id: Received frame while disconnected.");
          break;
      }
    } catch (e, s) {
      _log.info(
        "Outbound $id: Deserialization error in state $_currentState: $e\n$s",
      );
      lastError = (e is Exception) ? e : Exception(e.toString());
      if (e is NearbyUkey2Exception) {
        return;
      } else if (e is NearbyUkey2PeerAlertException) {
        if (!connectionClosed) protocolError();
      } else if (_currentState == OutboundState.sentUkeyClientInit) {
        sendUkey2Alert(
          ukey.Ukey2Alert_AlertType.BAD_MESSAGE,
        ); // Sends alert and disconnects
      } else {
        protocolError(); // Generic disconnect
      }
    }
  }

  Null _handleAsyncError(Object error, StackTrace stackTrace) {
    if (connectionClosed || _cancelled) return null;
    _log.severe("Outbound $id: Async error: $error\n$stackTrace");
    lastError = (error is Exception) ? error : Exception(error.toString());
    protocolError();
    return null;
  }

  @override
  Future<void> processTransferSetupFrame(wire.Frame frame) async {
    // Handle decrypted setup frames received from the server
    if (_cancelled) return;
    if (frame.hasV1() && frame.v1.type == wire.V1Frame_FrameType.CANCEL) {
      _log.info("Outbound $id: Transfer canceled by receiver.");
      lastError = NearbyCancellationException(CancellationReason.userCanceled);
      await sendDisconnectionAndDisconnect();
      return;
    }

    _log.info(
      "Outbound $id: Processing setup frame in state $_currentState: ${frame.toProto3Json()}",
    );

    switch (_currentState) {
      case OutboundState.sentPairedKeyEncryption:
        // Expecting PAIRED_KEY_ENCRYPTION from receiver
        if (!frame.hasV1() || !frame.v1.hasPairedKeyEncryption()) {
          throw NearbyProtocolException(
            "Expected PairedKeyEncryption, got ${frame.v1.type}",
          );
        }
        await _processPairedKeyEncryption(frame);
        break;
      case OutboundState.sentPairedKeyResult:
        if (!frame.hasV1() || !frame.v1.hasPairedKeyResult()) {
          throw NearbyProtocolException(
            "Expected PairedKeyResult, got ${frame.v1.type}",
          );
        }
        await _processPairedKeyResult(frame);
        break;
      case OutboundState.sentIntroduction:
        // Expecting RESPONSE (ACCEPT/REJECT) from server
        if (!frame.hasV1() || !frame.v1.hasConnectionResponse()) {
          throw NearbyProtocolException(
            "Expected ConnectionResponse, got ${frame.v1.type}",
          );
        }
        await _processConsentResponse(frame);
        break;
      case OutboundState.sendingFiles:
        // Shouldn't receive setup frames while sending files, maybe keep-alive?
        _log.info(
          "Outbound $id: Received unexpected setup frame while sending files: ${frame.toProto3Json()}",
        );
        // Ignore for now, or handle specific cases if needed.
        break;
      default:
        throw NearbyProtocolException(
          "Received unexpected setup frame in state $_currentState",
        );
    }
  }

  // --- Private Sending Methods ---

  Future<void> _sendConnectionRequest() async {
    final endpointName = await getDeviceName(); // Use helper from device.dart
    final endpointInfo = EndpointInfo(
      name: endpointName,
      deviceType: DeviceType.computer,
    ); // Assuming desktop

    final connReq = offline.ConnectionRequestFrame(
      endpointId: _endpointId,
      endpointName: endpointName,
      endpointInfo: endpointInfo.serialize(),
      mediums: [offline.ConnectionRequestFrame_Medium.WIFI_LAN],
      // Nonce, KeepAlive might be needed depending on server requirements
    );
    final v1Frame = offline.V1Frame(
      type: offline.V1Frame_FrameType.CONNECTION_REQUEST,
      connectionRequest: connReq,
    );
    final offlineFrame = offline.OfflineFrame(
      version: offline.OfflineFrame_Version.V1,
      v1: v1Frame,
    );
    await sendFrame(offlineFrame.writeToBuffer());
    _log.info("Outbound $id: Sent ConnectionRequest");
  }

  Future<void> _sendUkey2ClientInit() async {
    // Generate our keys (PointyCastle)
    final (privKey, pubKey) = generateP256KeyPairPointyCastle();
    ukeyPrivateKey = privKey;
    ukeyPublicKey = pubKey;

    // Prepare ClientFinish message (but don't send yet)
    final finish = ukey.Ukey2ClientFinished(
      publicKey: genericPublicKeyFromPointyCastle(pubKey).writeToBuffer(),
    );
    final finishMsg = ukey.Ukey2Message(
      messageType: ukey.Ukey2Message_Type.CLIENT_FINISH,
      messageData: finish.writeToBuffer(),
    );
    _ukeyClientFinishMsgData = finishMsg
        .writeToBuffer(); // Store raw bytes for later

    // Calculate commitment for ClientInit
    final digest = await Sha512().hash(_ukeyClientFinishMsgData!);
    final commitment = ukey.Ukey2ClientInit_CipherCommitment(
      handshakeCipher: ukey.Ukey2HandshakeCipher.P256_SHA512,
      commitment: digest.bytes,
    );

    // Create ClientInit message
    final clientInit = ukey.Ukey2ClientInit(
      version: 1,
      random: generateRandomBytes(32),
      cipherCommitments: [commitment],
      nextProtocol: "AES_256_CBC-HMAC_SHA256",
    );
    final clientInitMsg = ukey.Ukey2Message(
      messageType: ukey.Ukey2Message_Type.CLIENT_INIT,
      messageData: clientInit.writeToBuffer(),
    );

    ukeyClientInitMsgData = clientInitMsg
        .writeToBuffer(); // Store raw bytes for HKDF
    await sendFrame(ukeyClientInitMsgData!);
    _currentState = OutboundState.sentUkeyClientInit;
    _log.info("Outbound $id: Sent UKEY2 ClientInit");
  }

  // --- Private Processing Methods ---

  Future<void> _processUkey2ServerInit(
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
    if (msg.messageType != ukey.Ukey2Message_Type.SERVER_INIT) {
      _log.info(
        "Outbound $id: Expected UKEY2 ServerInit, got ${msg.messageType}",
      );
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_MESSAGE_TYPE);
      throw NearbyUkey2Exception();
    }
    if (!msg.hasMessageData()) {
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_MESSAGE_DATA);
      throw NearbyRequiredFieldMissingException("serverInit ukey2message.data");
    }
    ukeyServerInitMsgData = rawMsgData; // Store raw bytes for HKDF

    ukey.Ukey2ServerInit serverInit;
    try {
      serverInit = ukey.Ukey2ServerInit.fromBuffer(msg.messageData);
    } catch (e) {
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_MESSAGE_DATA);
      throw NearbyUkey2Exception();
    }

    if (serverInit.version != 1) {
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_VERSION);
      throw NearbyUkey2Exception();
    }
    if (serverInit.random.length != 32) {
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_RANDOM);
      throw NearbyUkey2Exception();
    }
    if (serverInit.handshakeCipher != ukey.Ukey2HandshakeCipher.P256_SHA512) {
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_HANDSHAKE_CIPHER);
      throw NearbyUkey2Exception();
    }
    if (!serverInit.hasPublicKey()) {
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_PUBLIC_KEY);
      throw NearbyRequiredFieldMissingException("serverInit.publicKey");
    }

    try {
      final serverKeyProto = sm.GenericPublicKey.fromBuffer(
        serverInit.publicKey,
      );
      await finalizeKeyExchange(serverKeyProto);
      _log.info("Outbound $id: UKEY2 Handshake Complete. PIN: $pinCode");
      // Send ClientFinish
      if (_ukeyClientFinishMsgData == null) {
        throw StateError("ClientFinish message data is null");
      }
      await sendFrame(_ukeyClientFinishMsgData!);
      _log.info("Outbound $id: Sent UKEY2 ClientFinish");
      await _sendPlaintextConnectionResponse();
      _currentState = OutboundState.sentUkeyClientFinish;
      encryptionDone = true;
      _log.info("Outbound $id: Sent plaintext ConnectionResponse");

      // Notify delegate that connection is established (PIN available)
      Future.microtask(() => delegate?.outboundConnectionEstablished(this));
    } catch (e, s) {
      _log.severe("Error processing ServerInit payload: $e\n$s");
      sendUkey2Alert(ukey.Ukey2Alert_AlertType.BAD_PUBLIC_KEY);
      throw NearbyUkey2Exception();
    }
  }

  Future<void> _sendPlaintextConnectionResponse() async {
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
  }

  offline.OsInfo_OsType _platformOsType() {
    if (Platform.isLinux) return offline.OsInfo_OsType.LINUX;
    if (Platform.isMacOS || Platform.isIOS) return offline.OsInfo_OsType.APPLE;
    if (Platform.isWindows) return offline.OsInfo_OsType.WINDOWS;
    if (Platform.isAndroid) return offline.OsInfo_OsType.ANDROID;
    return offline.OsInfo_OsType.UNKNOWN_OS_TYPE;
  }

  // Process the unencrypted ConnectionResponse ACK from the server.
  Future<void> _processConnectionResponseAck(offline.OfflineFrame frame) async {
    if (!frame.hasV1() ||
        frame.v1.type != offline.V1Frame_FrameType.CONNECTION_RESPONSE) {
      throw NearbyProtocolException(
        "Expected ConnectionResponse ACK, got ${frame.v1.type}",
      );
    }
    _log.info("Outbound $id: Processing ConnectionResponse ACK");
    if (!frame.v1.hasConnectionResponse()) {
      throw NearbyRequiredFieldMissingException("frame.v1.connectionResponse");
    }
    final response = frame.v1.connectionResponse;
    if (response.response !=
        offline.ConnectionResponseFrame_ResponseStatus.ACCEPT) {
      throw NearbyProtocolException(
        "Server rejected connection after UKEY2: ${response.response}",
      );
    }

    // Connection is accepted. Subsequent setup frames are encrypted.
    _log.info("Outbound $id: Connection accepted by server.");
    encryptionDone = true;
    await _sendPairedKeyEncryption();
  }

  Future<void> _sendPairedKeyEncryption() async {
    final authString = authStringBytes;
    final qrCodeHandshakeData = _quickShareQrCode != null && authString != null
        ? _quickShareQrCode.qrCodeHandshakeData(authString)
        : null;
    final pairedEncFrame = wire.PairedKeyEncryptionFrame(
      secretIdHash: generateRandomBytes(6),
      signedData: generateRandomBytes(72), // Matching Swift size
      qrCodeHandshakeData: qrCodeHandshakeData,
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
    _currentState = OutboundState.sentPairedKeyEncryption;
    _log.info("Outbound $id: Sent PairedKeyEncryption");
  }

  Future<void> _processPairedKeyEncryption(wire.Frame frame) async {
    _log.info("Outbound $id: Processing PairedKeyEncryption from receiver");
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
    _currentState = OutboundState.sentPairedKeyResult;
    _log.info("Outbound $id: Sent our PairedKeyResult (UNABLE)");
  }

  // Process the server's PairedKeyResult frame
  Future<void> _processPairedKeyResult(wire.Frame frame) async {
    // We don't care about the result (UNABLE usually), just proceed
    _log.info("Outbound $id: Processing PairedKeyResult from receiver");
    await _prepareAndSendIntroduction();
  }

  Future<void> _prepareAndSendIntroduction() async {
    _log.info("Outbound $id: Preparing Introduction frame");
    final introduction = wire.IntroductionFrame();
    _totalBytesToSend = 0;
    _transferQueue = [];

    if (_textPayloadID != 0) {
      // Single non-file URL case
      final urlString = _urlsToSend[0];
      final uri = Uri.tryParse(urlString);
      final textMeta = wire.TextMetadata(
        type: wire.TextMetadata_Type.URL,
        textTitle: uri?.host ?? "URL",
        size: Int64(urlString.length),
        payloadId: Int64(_textPayloadID),
      );
      introduction.textMetadata.add(textMeta);
      _totalBytesToSend = urlString.length; // Only the text bytes
    } else {
      // File transfer case
      for (final url in _urlsToSend) {
        try {
          final file = File(url);
          if (!await file.exists()) {
            _log.info("Warning: File not found: $url");
            continue;
          }
          final fileStat = await file.stat();
          final fileSize = await file.length();
          final fileName = p.basename(url);
          final mimeType = lookupMimeType(url) ?? 'application/octet-stream';
          final fileType = _guessFileType(mimeType, url);

          final fileMeta = wire.FileMetadata(
            name: _sanitizeFileName(fileName),
            size: Int64(fileSize),
            mimeType: mimeType,
            type: fileType,
            payloadId: Int64(generatePositivePayloadId()),
          );
          _log.info(
            "Outbound $id: Queued file ${fileMeta.name} ($mimeType, ${fileType.name}) payload ${fileMeta.payloadId} size $fileSize",
          );

          introduction.fileMetadata.add(fileMeta);
          _transferQueue.add(
            OutgoingFileTransfer(
              sourcePath: url,
              payloadID: fileMeta.payloadId.toInt(),
              totalBytes: fileSize,
              lastModifiedMillis: fileStat.modified.millisecondsSinceEpoch,
              // Handle will be opened later
            ),
          );
          _totalBytesToSend += fileSize;
        } catch (e, s) {
          _log.severe("Error processing file $url: $e\n$s");
          // Should we abort the whole transfer? Or just skip this file?
          // For now, just skip.
        }
      }
      if (_transferQueue.isEmpty) {
        throw NearbyApiException("No valid files found to send.");
      }
    }

    final v1WireFrame = wire.V1Frame(
      type: wire.V1Frame_FrameType.INTRODUCTION,
      introduction: introduction,
    );
    final wireFrame = wire.Frame(
      version: wire.Frame_Version.V1,
      v1: v1WireFrame,
    );

    await sendTransferSetupFrame(wireFrame);
    _currentState = OutboundState.sentIntroduction;
    _log.info(
      "Outbound $id: Sent Introduction frame. Total bytes: $_totalBytesToSend",
    );
  }

  // Process the ACCEPT/REJECT response from the receiver
  Future<void> _processConsentResponse(wire.Frame frame) async {
    _log.info("Outbound $id: Processing ConnectionResponse (Consent)");
    final status = frame.v1.connectionResponse.status;

    if (status == wire.ConnectionResponseFrame_Status.ACCEPT) {
      _log.info("Outbound $id: Transfer accepted by receiver.");
      _currentState = OutboundState.sendingFiles;
      Future.microtask(() => delegate?.outboundTransferAccepted(this));

      if (_textPayloadID != 0) {
        await _sendUrlPayload();
      } else {
        await _sendNextFileChunk();
      }
    } else {
      final reason =
          wireStatusToCancellationReason(status) ??
          CancellationReason.userRejected;
      _log.info(
        "Outbound $id: Transfer rejected by receiver with status $status.",
      );
      lastError = NearbyCancellationException(reason);
      await sendDisconnectionAndDisconnect();
      // Delegate notified via handleConnectionClosure
    }
  }

  Future<void> _sendUrlPayload() async {
    if (_cancelled) return;
    _log.info("Outbound $id: Sending URL payload.");
    await sendBytesPayload(
      data: utf8.encode(_urlsToSend[0]),
      payloadId: _textPayloadID,
    );
    _log.info("Outbound $id: URL payload sent.");
    _awaitingRemoteCompletion = true;
    await sendDisconnectionAndDisconnect(
      waitForRemoteClose: true,
      remoteCloseTimeout: const Duration(seconds: 10),
    );
  }

  Future<void> _sendNextFileChunk() async {
    if (_cancelled || _currentState != OutboundState.sendingFiles) return;

    // Check if current transfer is done or needs initialization
    if (_currentTransfer == null ||
        _currentTransfer!.currentOffset == _currentTransfer!.totalBytes) {
      await _currentTransfer?.handle?.close(); // Close previous handle
      _currentTransfer?.handle = null;

      if (_transferQueue.isEmpty) {
        _log.info("Outbound $id: All files transferred.");
        _awaitingRemoteCompletion = true;
        await sendDisconnectionAndDisconnect(
          waitForRemoteClose: true,
          remoteCloseTimeout: const Duration(seconds: 10),
        );
        return;
      }

      // Get next file and open handle
      _currentTransfer = _transferQueue.removeAt(0);
      try {
        _currentTransfer!.handle = await File(
          _currentTransfer!.sourcePath,
        ).open(mode: FileMode.read);
        _log.info(
          "Outbound $id: Started sending file: ${_currentTransfer!.sourcePath}",
        );
      } catch (e, s) {
        _log.info(
          "Outbound $id: Failed to open file ${_currentTransfer!.sourcePath}: $e\n$s",
        );
        lastError = NearbyIOException();
        protocolError(); // Abort transfer
        return;
      }
    }

    // Read next chunk
    const chunkSize = 512 * 1024; // 512 KiB
    Uint8List fileBuffer;
    try {
      fileBuffer = await _currentTransfer!.handle!.read(chunkSize);
    } catch (e, s) {
      _log.info(
        "Outbound $id: Error reading from file ${_currentTransfer!.sourcePath}: $e\n$s",
      );
      lastError = NearbyIOException();
      protocolError();
      return;
    }

    if (fileBuffer.isEmpty &&
        _currentTransfer!.currentOffset != _currentTransfer!.totalBytes) {
      // This indicates an unexpected EOF or read error
      _log.info(
        "Outbound $id: Read empty buffer before expected EOF for ${_currentTransfer!.sourcePath}",
      );
      lastError = NearbyIOException();
      protocolError();
      return;
    }

    // Prepare and send payload chunk frame
    final payloadFileName = _sanitizeFileName(
      p.basename(_currentTransfer!.sourcePath),
    );
    final header = offline.PayloadTransferFrame_PayloadHeader(
      id: Int64(_currentTransfer!.payloadID),
      type: offline.PayloadTransferFrame_PayloadHeader_PayloadType.FILE,
      totalSize: Int64(_currentTransfer!.totalBytes),
      isSensitive: false,
      fileName: payloadFileName,
      lastModifiedTimestampMillis: Int64(_currentTransfer!.lastModifiedMillis),
    );
    final chunk = offline.PayloadTransferFrame_PayloadChunk(
      offset: Int64(_currentTransfer!.currentOffset),
      flags: 0, // Not the last chunk (yet)
      body: fileBuffer,
    );
    final transferFrame = offline.PayloadTransferFrame(
      packetType: offline.PayloadTransferFrame_PacketType.DATA,
      payloadHeader: header,
      payloadChunk: chunk,
    );
    final v1Frame = offline.V1Frame(
      type: offline.V1Frame_FrameType.PAYLOAD_TRANSFER,
      payloadTransfer: transferFrame,
    );
    final offlineFrame = offline.OfflineFrame(
      version: offline.OfflineFrame_Version.V1,
      v1: v1Frame,
    );

    // Update state *before* async send
    _currentTransfer!.currentOffset += fileBuffer.length;
    _totalBytesSent += fileBuffer.length;
    final bool isLastChunkOfFile =
        _currentTransfer!.currentOffset == _currentTransfer!.totalBytes;

    // Send the data chunk
    await encryptAndSendOfflineFrame(offlineFrame);
    _log.info(
      "Outbound $id: Sent chunk ${_currentTransfer!.currentOffset}/${_currentTransfer!.totalBytes} for payload ${_currentTransfer!.payloadID}",
    );

    // Update progress
    if (_totalBytesToSend > 0) {
      Future.microtask(
        () => delegate?.outboundTransferProgress(
          this,
          _totalBytesSent / _totalBytesToSend,
        ),
      );
    }

    // Send EOF frame if this was the last chunk of the file
    if (isLastChunkOfFile) {
      _log.info(
        "Outbound $id: Sending EOF for payload ${_currentTransfer!.payloadID}",
      );
      final isFinalFileOfTransfer = _transferQueue.isEmpty;
      final eofChunk = offline.PayloadTransferFrame_PayloadChunk(
        offset: Int64(_currentTransfer!.currentOffset),
        flags: 1, // LAST_CHUNK
        body: Uint8List(0),
      );
      final eofTransfer = offline.PayloadTransferFrame(
        packetType: offline.PayloadTransferFrame_PacketType.DATA,
        payloadHeader: header, // Repeat header
        payloadChunk: eofChunk,
      );
      final eofV1Frame = offline.V1Frame(
        type: offline.V1Frame_FrameType.PAYLOAD_TRANSFER,
        payloadTransfer: eofTransfer,
      );
      final eofOfflineFrame = offline.OfflineFrame(
        version: offline.OfflineFrame_Version.V1,
        v1: eofV1Frame,
      );
      await encryptAndSendOfflineFrame(eofOfflineFrame);
      if (isFinalFileOfTransfer) {
        _awaitingRemoteCompletion = true;
      }
    }

    // Schedule next chunk send (using microtask to avoid deep recursion)
    Future.microtask(() => _sendNextFileChunk().catchError(_handleAsyncError));
  }

  void _cleanupFileHandles() {
    _currentTransfer?.handle?.close().catchError(
      (_) {},
    ); // Ignore errors on close
    for (var transfer in _transferQueue) {
      transfer.handle?.close().catchError((_) {});
    }
  }

  String _sanitizeFileName(String name) {
    return name.replaceAll(RegExp(r'[\\/:\*\?"<>\|]'), '_');
  }

  wire.FileMetadata_Type _guessFileType(String mimeType, String filePath) {
    final normalizedMimeType = mimeType.toLowerCase();
    final extension = p.extension(filePath).toLowerCase();

    if (normalizedMimeType.startsWith('image/')) {
      return wire.FileMetadata_Type.IMAGE;
    }
    if (normalizedMimeType.startsWith('video/')) {
      return wire.FileMetadata_Type.VIDEO;
    }
    if (normalizedMimeType.startsWith('audio/')) {
      return wire.FileMetadata_Type.AUDIO;
    }
    if (normalizedMimeType == 'application/vnd.android.package-archive' ||
        extension == '.apk') {
      return wire.FileMetadata_Type.ANDROID_APP;
    }
    return wire.FileMetadata_Type.UNKNOWN;
  }
}
