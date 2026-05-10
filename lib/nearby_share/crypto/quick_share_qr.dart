import 'dart:typed_data';

import 'package:crossdrop/nearby_share/crypto/crypto_utils.dart';
import 'package:crossdrop/nearby_share/utils/data_extension.dart';
import 'package:cryptography/cryptography.dart';
import 'package:pointycastle/export.dart' as pc;

class QuickShareQrCode {
  final String url;
  final Uint8List key;
  final pc.ECPrivateKey _privateKey;

  QuickShareQrCode._({
    required this.url,
    required this.key,
    required pc.ECPrivateKey privateKey,
  }) : _privateKey = privateKey;

  factory QuickShareQrCode.generate() {
    final (privateKey, publicKey) = generateP256KeyPairPointyCastle();
    final q = publicKey.Q;
    final x = q?.x?.toBigInteger();
    if (x == null) {
      throw StateError('Failed to read Quick Share QR public key X coordinate');
    }

    final payload = Uint8List.fromList([
      0x00,
      0x00,
      0x02,
      ...bigIntToFixedUnsignedBytes(x, 32),
    ]);

    return QuickShareQrCode._(
      url: 'https://quickshare.google/qrcode#key=${payload.toUrlSafeBase64()}',
      key: payload,
      privateKey: privateKey,
    );
  }

  Future<QuickShareHiddenKeychain> deriveHiddenKeychain() async {
    final nullSalt = List<int>.filled(32, 0);
    final advertisingToken = await hkdfSha256(
      sharedSecret: SecretKey(key),
      salt: nullSalt,
      info: 'advertisingContext'.codeUnits,
      outputLength: 16,
    );
    final nameEncryptionToken = await hkdfSha256(
      sharedSecret: SecretKey(key),
      salt: nullSalt,
      info: 'encryptionKey'.codeUnits,
      outputLength: 16,
    );

    return QuickShareHiddenKeychain(
      advertisingToken: Uint8List.fromList(
        await advertisingToken.extractBytes(),
      ),
      nameEncryptionToken: Uint8List.fromList(
        await nameEncryptionToken.extractBytes(),
      ),
    );
  }

  Uint8List qrCodeHandshakeData(List<int> authString) {
    return signP256Sha256Raw(_privateKey, authString);
  }
}

class QuickShareHiddenKeychain {
  final Uint8List advertisingToken;
  final Uint8List nameEncryptionToken;

  QuickShareHiddenKeychain({
    required this.advertisingToken,
    required this.nameEncryptionToken,
  });

  Future<Uint8List> decryptQrCodeRecord(List<int> buffer) async {
    if (buffer.length < 28) {
      throw ArgumentError('QR code record is too short');
    }

    final iv = buffer.sublist(0, 12);
    final ciphertext = buffer.sublist(12, buffer.length - 16);
    final tag = buffer.sublist(buffer.length - 16);
    final clearText = await AesGcm.with128bits().decrypt(
      SecretBox(ciphertext, nonce: iv, mac: Mac(tag)),
      secretKey: SecretKey(nameEncryptionToken),
      aad: advertisingToken,
    );
    return Uint8List.fromList(clearText);
  }
}
