import 'dart:typed_data';

import 'package:crossdrop/nearby_share/api/models.dart';
import 'package:crossdrop/nearby_share/crypto/crypto_utils.dart';
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
}
