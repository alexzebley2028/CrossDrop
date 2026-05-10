import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

const String _endpointIdAlphabet =
    '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

/// Generates cryptographically secure random bytes.
Uint8List generateRandomBytes(int length) {
  final random = Random.secure();
  final values = List<int>.generate(length, (i) => random.nextInt(256));
  return Uint8List.fromList(values);
}

/// Generates a protocol-compatible random signed 64-bit integer.
int generateRandomInt64() {
  int value;
  do {
    final bytes = generateRandomBytes(8);
    value = ByteData.sublistView(bytes).getInt64(0);
  } while (value == 0);
  return value;
}

/// Generates a small positive payload id for file/text payloads.
///
/// NearDrop and rquickshare use signed int64 payload ids, but Android receivers
/// also accept the smaller positive ids this implementation used before the
/// full-int64 setup payload work. Keep attachment payload ids in this range
/// while setup BYTES payloads can continue to use full int64 ids.
int generatePositivePayloadId() {
  return Random.secure().nextInt(0x7fffffff) + 1;
}

/// Generates a protocol-compatible 4-character Nearby endpoint ID.
String generateEndpointId() {
  final random = Random.secure();
  return String.fromCharCodes(
    List<int>.generate(
      4,
      (_) => _endpointIdAlphabet.codeUnitAt(
        random.nextInt(_endpointIdAlphabet.length),
      ),
    ),
  );
}

/// Encodes bytes to a URL-safe Base64 string without padding.
String urlSafeBase64Encode(Uint8List bytes) {
  return base64UrlEncode(bytes).replaceAll('=', '');
}

/// Decodes a URL-safe Base64 string (potentially without padding) to bytes.
Uint8List? urlSafeBase64Decode(String str) {
  try {
    String regularB64 = str.replaceAll('_', '/').replaceAll('-', '+');
    // Add padding if necessary
    while (regularB64.length % 4 != 0) {
      regularB64 += '=';
    }
    return base64Decode(regularB64);
  } catch (e) {
    print('Error decoding base64 string: $e');
    return null;
  }
}

extension Uint8ListUrlSafeBase64 on Uint8List {
  /// Encodes this byte list to a URL-safe Base64 string without padding.
  String toUrlSafeBase64() => urlSafeBase64Encode(this);
}

extension StringUrlSafeBase64 on String {
  /// Decodes this URL-safe Base64 string (potentially without padding) to bytes.
  Uint8List? fromUrlSafeBase64() => urlSafeBase64Decode(this);
}
