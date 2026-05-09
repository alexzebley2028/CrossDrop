// This is a generated file - do not edit.
//
// Generated from securemessage.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'securemessage.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'securemessage.pbenum.dart';

class SecureMessage extends $pb.GeneratedMessage {
  factory SecureMessage({
    $core.List<$core.int>? headerAndBody,
    $core.List<$core.int>? signature,
  }) {
    final result = create();
    if (headerAndBody != null) result.headerAndBody = headerAndBody;
    if (signature != null) result.signature = signature;
    return result;
  }

  SecureMessage._();

  factory SecureMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SecureMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SecureMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'securemessage'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'headerAndBody', $pb.PbFieldType.QY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.QY);

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecureMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecureMessage copyWith(void Function(SecureMessage) updates) =>
      super.copyWith((message) => updates(message as SecureMessage))
          as SecureMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecureMessage create() => SecureMessage._();
  @$core.override
  SecureMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SecureMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SecureMessage>(create);
  static SecureMessage? _defaultInstance;

  /// Must contain a HeaderAndBody message
  @$pb.TagNumber(1)
  $core.List<$core.int> get headerAndBody => $_getN(0);
  @$pb.TagNumber(1)
  set headerAndBody($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHeaderAndBody() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeaderAndBody() => $_clearField(1);

  /// Signature of header_and_body
  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);
}

class Header extends $pb.GeneratedMessage {
  factory Header({
    SigScheme? signatureScheme,
    EncScheme? encryptionScheme,
    $core.List<$core.int>? verificationKeyId,
    $core.List<$core.int>? decryptionKeyId,
    $core.List<$core.int>? iv,
    $core.List<$core.int>? publicMetadata,
    $core.int? associatedDataLength,
  }) {
    final result = create();
    if (signatureScheme != null) result.signatureScheme = signatureScheme;
    if (encryptionScheme != null) result.encryptionScheme = encryptionScheme;
    if (verificationKeyId != null) result.verificationKeyId = verificationKeyId;
    if (decryptionKeyId != null) result.decryptionKeyId = decryptionKeyId;
    if (iv != null) result.iv = iv;
    if (publicMetadata != null) result.publicMetadata = publicMetadata;
    if (associatedDataLength != null)
      result.associatedDataLength = associatedDataLength;
    return result;
  }

  Header._();

  factory Header.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Header.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Header',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'securemessage'),
      createEmptyInstance: create)
    ..aE<SigScheme>(1, _omitFieldNames ? '' : 'signatureScheme',
        fieldType: $pb.PbFieldType.QE, enumValues: SigScheme.values)
    ..aE<EncScheme>(2, _omitFieldNames ? '' : 'encryptionScheme',
        fieldType: $pb.PbFieldType.QE, enumValues: EncScheme.values)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'verificationKeyId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'decryptionKeyId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'iv', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'publicMetadata', $pb.PbFieldType.OY)
    ..aI(7, _omitFieldNames ? '' : 'associatedDataLength',
        fieldType: $pb.PbFieldType.OU3);

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Header clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Header copyWith(void Function(Header) updates) =>
      super.copyWith((message) => updates(message as Header)) as Header;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Header create() => Header._();
  @$core.override
  Header createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Header getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Header>(create);
  static Header? _defaultInstance;

  @$pb.TagNumber(1)
  SigScheme get signatureScheme => $_getN(0);
  @$pb.TagNumber(1)
  set signatureScheme(SigScheme value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSignatureScheme() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignatureScheme() => $_clearField(1);

  @$pb.TagNumber(2)
  EncScheme get encryptionScheme => $_getN(1);
  @$pb.TagNumber(2)
  set encryptionScheme(EncScheme value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEncryptionScheme() => $_has(1);
  @$pb.TagNumber(2)
  void clearEncryptionScheme() => $_clearField(2);

  /// Identifies the verification key
  @$pb.TagNumber(3)
  $core.List<$core.int> get verificationKeyId => $_getN(2);
  @$pb.TagNumber(3)
  set verificationKeyId($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVerificationKeyId() => $_has(2);
  @$pb.TagNumber(3)
  void clearVerificationKeyId() => $_clearField(3);

  /// Identifies the decryption key
  @$pb.TagNumber(4)
  $core.List<$core.int> get decryptionKeyId => $_getN(3);
  @$pb.TagNumber(4)
  set decryptionKeyId($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDecryptionKeyId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDecryptionKeyId() => $_clearField(4);

  /// Encryption may use an IV
  @$pb.TagNumber(5)
  $core.List<$core.int> get iv => $_getN(4);
  @$pb.TagNumber(5)
  set iv($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIv() => $_has(4);
  @$pb.TagNumber(5)
  void clearIv() => $_clearField(5);

  /// Arbitrary per-protocol public data, to be sent with the plain-text header
  @$pb.TagNumber(6)
  $core.List<$core.int> get publicMetadata => $_getN(5);
  @$pb.TagNumber(6)
  set publicMetadata($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPublicMetadata() => $_has(5);
  @$pb.TagNumber(6)
  void clearPublicMetadata() => $_clearField(6);

  /// The length of some associated data this is not sent in this SecureMessage,
  /// but which will be bound to the signature.
  @$pb.TagNumber(7)
  $core.int get associatedDataLength => $_getIZ(6);
  @$pb.TagNumber(7)
  set associatedDataLength($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAssociatedDataLength() => $_has(6);
  @$pb.TagNumber(7)
  void clearAssociatedDataLength() => $_clearField(7);
}

class HeaderAndBody extends $pb.GeneratedMessage {
  factory HeaderAndBody({
    Header? header,
    $core.List<$core.int>? body,
  }) {
    final result = create();
    if (header != null) result.header = header;
    if (body != null) result.body = body;
    return result;
  }

  HeaderAndBody._();

  factory HeaderAndBody.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeaderAndBody.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeaderAndBody',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'securemessage'),
      createEmptyInstance: create)
    ..aQM<Header>(1, _omitFieldNames ? '' : 'header', subBuilder: Header.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'body', $pb.PbFieldType.QY);

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeaderAndBody clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeaderAndBody copyWith(void Function(HeaderAndBody) updates) =>
      super.copyWith((message) => updates(message as HeaderAndBody))
          as HeaderAndBody;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeaderAndBody create() => HeaderAndBody._();
  @$core.override
  HeaderAndBody createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeaderAndBody getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeaderAndBody>(create);
  static HeaderAndBody? _defaultInstance;

  /// Public data about this message (to be bound in the signature)
  @$pb.TagNumber(1)
  Header get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(Header value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => $_clearField(1);
  @$pb.TagNumber(1)
  Header ensureHeader() => $_ensure(0);

  /// Payload data
  @$pb.TagNumber(2)
  $core.List<$core.int> get body => $_getN(1);
  @$pb.TagNumber(2)
  set body($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => $_clearField(2);
}

/// Must be kept wire-format compatible with HeaderAndBody. Provides the
/// SecureMessage code with a consistent wire-format representation that
/// remains stable irrespective of protobuf implementation choices. This
/// low-level representation of a HeaderAndBody should not be used by
/// any code outside of the SecureMessage library implementation/tests.
class HeaderAndBodyInternal extends $pb.GeneratedMessage {
  factory HeaderAndBodyInternal({
    $core.List<$core.int>? header,
    $core.List<$core.int>? body,
  }) {
    final result = create();
    if (header != null) result.header = header;
    if (body != null) result.body = body;
    return result;
  }

  HeaderAndBodyInternal._();

  factory HeaderAndBodyInternal.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeaderAndBodyInternal.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeaderAndBodyInternal',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'securemessage'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'header', $pb.PbFieldType.QY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'body', $pb.PbFieldType.QY);

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeaderAndBodyInternal clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeaderAndBodyInternal copyWith(
          void Function(HeaderAndBodyInternal) updates) =>
      super.copyWith((message) => updates(message as HeaderAndBodyInternal))
          as HeaderAndBodyInternal;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeaderAndBodyInternal create() => HeaderAndBodyInternal._();
  @$core.override
  HeaderAndBodyInternal createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeaderAndBodyInternal getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeaderAndBodyInternal>(create);
  static HeaderAndBodyInternal? _defaultInstance;

  /// A raw (wire-format) byte encoding of a Header, suitable for hashing
  @$pb.TagNumber(1)
  $core.List<$core.int> get header => $_getN(0);
  @$pb.TagNumber(1)
  set header($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => $_clearField(1);

  /// Payload data
  @$pb.TagNumber(2)
  $core.List<$core.int> get body => $_getN(1);
  @$pb.TagNumber(2)
  set body($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => $_clearField(2);
}

/// A convenience proto for encoding NIST P-256 elliptic curve public keys
class EcP256PublicKey extends $pb.GeneratedMessage {
  factory EcP256PublicKey({
    $core.List<$core.int>? x,
    $core.List<$core.int>? y,
  }) {
    final result = create();
    if (x != null) result.x = x;
    if (y != null) result.y = y;
    return result;
  }

  EcP256PublicKey._();

  factory EcP256PublicKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EcP256PublicKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EcP256PublicKey',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'securemessage'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'x', $pb.PbFieldType.QY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'y', $pb.PbFieldType.QY);

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EcP256PublicKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EcP256PublicKey copyWith(void Function(EcP256PublicKey) updates) =>
      super.copyWith((message) => updates(message as EcP256PublicKey))
          as EcP256PublicKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EcP256PublicKey create() => EcP256PublicKey._();
  @$core.override
  EcP256PublicKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EcP256PublicKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EcP256PublicKey>(create);
  static EcP256PublicKey? _defaultInstance;

  /// x and y are encoded in big-endian two's complement (slightly wasteful)
  /// Client MUST verify (x,y) is a valid point on NIST P256
  @$pb.TagNumber(1)
  $core.List<$core.int> get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => $_clearField(2);
}

/// A convenience proto for encoding RSA public keys with small exponents
class SimpleRsaPublicKey extends $pb.GeneratedMessage {
  factory SimpleRsaPublicKey({
    $core.List<$core.int>? n,
    $core.int? e,
  }) {
    final result = create();
    if (n != null) result.n = n;
    if (e != null) result.e = e;
    return result;
  }

  SimpleRsaPublicKey._();

  factory SimpleRsaPublicKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SimpleRsaPublicKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SimpleRsaPublicKey',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'securemessage'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'n', $pb.PbFieldType.QY)
    ..aI(2, _omitFieldNames ? '' : 'e', defaultOrMaker: 65537);

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleRsaPublicKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleRsaPublicKey copyWith(void Function(SimpleRsaPublicKey) updates) =>
      super.copyWith((message) => updates(message as SimpleRsaPublicKey))
          as SimpleRsaPublicKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SimpleRsaPublicKey create() => SimpleRsaPublicKey._();
  @$core.override
  SimpleRsaPublicKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SimpleRsaPublicKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SimpleRsaPublicKey>(create);
  static SimpleRsaPublicKey? _defaultInstance;

  /// Encoded in big-endian two's complement
  @$pb.TagNumber(1)
  $core.List<$core.int> get n => $_getN(0);
  @$pb.TagNumber(1)
  set n($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasN() => $_has(0);
  @$pb.TagNumber(1)
  void clearN() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get e => $_getI(1, 65537);
  @$pb.TagNumber(2)
  set e($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasE() => $_has(1);
  @$pb.TagNumber(2)
  void clearE() => $_clearField(2);
}

/// A convenience proto for encoding Diffie-Hellman public keys,
/// for use only when Elliptic Curve based key exchanges are not possible.
/// (Note that the group parameters must be specified separately)
class DhPublicKey extends $pb.GeneratedMessage {
  factory DhPublicKey({
    $core.List<$core.int>? y,
  }) {
    final result = create();
    if (y != null) result.y = y;
    return result;
  }

  DhPublicKey._();

  factory DhPublicKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DhPublicKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DhPublicKey',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'securemessage'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'y', $pb.PbFieldType.QY);

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DhPublicKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DhPublicKey copyWith(void Function(DhPublicKey) updates) =>
      super.copyWith((message) => updates(message as DhPublicKey))
          as DhPublicKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DhPublicKey create() => DhPublicKey._();
  @$core.override
  DhPublicKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DhPublicKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DhPublicKey>(create);
  static DhPublicKey? _defaultInstance;

  /// Big-endian two's complement encoded group element
  @$pb.TagNumber(1)
  $core.List<$core.int> get y => $_getN(0);
  @$pb.TagNumber(1)
  set y($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasY() => $_has(0);
  @$pb.TagNumber(1)
  void clearY() => $_clearField(1);
}

class GenericPublicKey extends $pb.GeneratedMessage {
  factory GenericPublicKey({
    PublicKeyType? type,
    EcP256PublicKey? ecP256PublicKey,
    SimpleRsaPublicKey? rsa2048PublicKey,
    DhPublicKey? dh2048PublicKey,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (ecP256PublicKey != null) result.ecP256PublicKey = ecP256PublicKey;
    if (rsa2048PublicKey != null) result.rsa2048PublicKey = rsa2048PublicKey;
    if (dh2048PublicKey != null) result.dh2048PublicKey = dh2048PublicKey;
    return result;
  }

  GenericPublicKey._();

  factory GenericPublicKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenericPublicKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenericPublicKey',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'securemessage'),
      createEmptyInstance: create)
    ..aE<PublicKeyType>(1, _omitFieldNames ? '' : 'type',
        fieldType: $pb.PbFieldType.QE, enumValues: PublicKeyType.values)
    ..aOM<EcP256PublicKey>(2, _omitFieldNames ? '' : 'ecP256PublicKey',
        subBuilder: EcP256PublicKey.create)
    ..aOM<SimpleRsaPublicKey>(3, _omitFieldNames ? '' : 'rsa2048PublicKey',
        subBuilder: SimpleRsaPublicKey.create)
    ..aOM<DhPublicKey>(4, _omitFieldNames ? '' : 'dh2048PublicKey',
        subBuilder: DhPublicKey.create);

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenericPublicKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenericPublicKey copyWith(void Function(GenericPublicKey) updates) =>
      super.copyWith((message) => updates(message as GenericPublicKey))
          as GenericPublicKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenericPublicKey create() => GenericPublicKey._();
  @$core.override
  GenericPublicKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenericPublicKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenericPublicKey>(create);
  static GenericPublicKey? _defaultInstance;

  @$pb.TagNumber(1)
  PublicKeyType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(PublicKeyType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  EcP256PublicKey get ecP256PublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set ecP256PublicKey(EcP256PublicKey value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEcP256PublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearEcP256PublicKey() => $_clearField(2);
  @$pb.TagNumber(2)
  EcP256PublicKey ensureEcP256PublicKey() => $_ensure(1);

  @$pb.TagNumber(3)
  SimpleRsaPublicKey get rsa2048PublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set rsa2048PublicKey(SimpleRsaPublicKey value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRsa2048PublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearRsa2048PublicKey() => $_clearField(3);
  @$pb.TagNumber(3)
  SimpleRsaPublicKey ensureRsa2048PublicKey() => $_ensure(2);

  /// Use only as a last resort
  @$pb.TagNumber(4)
  DhPublicKey get dh2048PublicKey => $_getN(3);
  @$pb.TagNumber(4)
  set dh2048PublicKey(DhPublicKey value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasDh2048PublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearDh2048PublicKey() => $_clearField(4);
  @$pb.TagNumber(4)
  DhPublicKey ensureDh2048PublicKey() => $_ensure(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
