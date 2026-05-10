import 'dart:convert';
import 'dart:typed_data';

import 'package:crossdrop/nearby_share/api/models.dart';
import 'package:crossdrop/nearby_share/crypto/crypto_utils.dart';
import 'package:crossdrop/nearby_share/crypto/quick_share_qr.dart';
import 'package:crossdrop/nearby_share/protobuf/wire_format.pb.dart' as wire;
import 'package:crossdrop/nearby_share/utils/data_extension.dart';
import 'package:cryptography/cryptography.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('generateEndpointId returns four alphanumeric ASCII characters', () {
    final endpointIdPattern = RegExp(r'^[0-9A-Za-z]{4}$');

    for (var i = 0; i < 100; i++) {
      final endpointId = generateEndpointId();

      expect(endpointId, hasLength(4));
      expect(endpointIdPattern.hasMatch(endpointId), isTrue);
    }
  });

  test('generateRandomInt64 returns signed 64-bit non-zero values', () {
    for (var i = 0; i < 100; i++) {
      final value = generateRandomInt64();

      expect(value, isNot(0));
      expect(value >= -9223372036854775808, isTrue);
      expect(value <= 9223372036854775807, isTrue);
    }
  });

  test('generatePositivePayloadId returns positive 31-bit payload ids', () {
    for (var i = 0; i < 100; i++) {
      final value = generatePositivePayloadId();

      expect(value, greaterThan(0));
      expect(value, lessThanOrEqualTo(0x7fffffff));
    }
  });

  test('EndpointInfo serializes a visible computer endpoint', () {
    final info = EndpointInfo(
      name: 'CrossDrop Test',
      deviceType: DeviceType.computer,
    );

    final data = info.serialize();
    final parsed = EndpointInfo.deserialize(data);

    expect(parsed.name, 'CrossDrop Test');
    expect(parsed.deviceType, DeviceType.computer);
    expect(data[0] & 0x10, 0);
    expect((data[0] >> 1) & 0x07, DeviceType.computer.rawValue);
  });

  test('EndpointInfo parses hidden QR-backed records', () {
    final data = Uint8List.fromList([
      0x10 | (DeviceType.phone.rawValue << 1),
      ...List<int>.filled(16, 0),
      1,
      3,
      0xaa,
      0xbb,
      0xcc,
    ]);

    final parsed = EndpointInfo.deserialize(data);

    expect(parsed.visible, isFalse);
    expect(parsed.deviceType, DeviceType.phone);
    expect(parsed.name, isEmpty);
    expect(parsed.records[1], [0xaa, 0xbb, 0xcc]);
  });

  test('FileMetadata supports modern document attachment type', () {
    final metadata = wire.FileMetadata(
      name: 'document.pdf',
      type: wire.FileMetadata_Type.DOCUMENT,
    );

    final parsed = wire.FileMetadata.fromBuffer(metadata.writeToBuffer());

    expect(wire.FileMetadata_Type.DOCUMENT.value, 5);
    expect(parsed.type, wire.FileMetadata_Type.DOCUMENT);
  });

  test('UKEY2 uses SHA-256 of the raw ECDH output as HKDF input', () async {
    final rawSecret = Uint8List.fromList(List<int>.generate(32, (i) => i));

    final sharedSecret = await ukey2SharedSecretFromEcdh(rawSecret);
    final expectedDigest = await Sha256().hash(rawSecret);

    expect(await sharedSecret.extractBytes(), expectedDigest.bytes);
  });

  test('P-256 public keys use positive signed big-endian coordinates', () {
    for (var i = 0; i < 100; i++) {
      final (_, publicKey) = generateP256KeyPairPointyCastle();
      final protoKey = genericPublicKeyFromPointyCastle(publicKey);

      for (final coordinate in [
        protoKey.ecP256PublicKey.x,
        protoKey.ecP256PublicKey.y,
      ]) {
        expect(coordinate, isNotEmpty);
        expect(coordinate.length <= 33, isTrue);
        if (coordinate.length == 33) {
          expect(coordinate.first, 0);
          expect((coordinate[1] & 0x80) != 0, isTrue);
        } else {
          expect((coordinate.first & 0x80) == 0, isTrue);
        }
      }
    }
  });

  test('Quick Share QR codes use expected payload and raw signature shape', () {
    final qrCode = QuickShareQrCode.generate();
    final uri = Uri.parse(qrCode.url);
    final keyParameter = Uri.splitQueryString(uri.fragment)['key'];

    expect(uri.origin, 'https://quickshare.google');
    expect(uri.path, '/qrcode');
    expect(keyParameter, isNotNull);

    final payload = keyParameter!.fromUrlSafeBase64();
    expect(payload, qrCode.key);
    expect(payload, hasLength(35));
    expect(payload!.sublist(0, 3), [0, 0, 2]);

    final signature = qrCode.qrCodeHandshakeData(List<int>.filled(32, 7));
    expect(signature, hasLength(64));
  });

  test('Quick Share QR hidden keychain decrypts name records', () async {
    final qrCode = QuickShareQrCode.generate();
    final keychain = await qrCode.deriveHiddenKeychain();
    final nonce = List<int>.generate(12, (i) => i);
    final secretBox = await AesGcm.with128bits().encrypt(
      utf8.encode('Pixel'),
      secretKey: SecretKey(keychain.nameEncryptionToken),
      nonce: nonce,
      aad: keychain.advertisingToken,
    );
    final record = [
      ...secretBox.nonce,
      ...secretBox.cipherText,
      ...secretBox.mac.bytes,
    ];

    final decrypted = await keychain.decryptQrCodeRecord(record);

    expect(utf8.decode(decrypted), 'Pixel');
  });
}
