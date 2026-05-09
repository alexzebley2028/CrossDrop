// This is a generated file - do not edit.
//
// Generated from device_to_device_messages.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'device_to_device_messages.pbenum.dart';
import 'securemessage.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'device_to_device_messages.pbenum.dart';

/// Used by protocols between devices
class DeviceToDeviceMessage extends $pb.GeneratedMessage {
  factory DeviceToDeviceMessage({
    $core.List<$core.int>? message,
    $core.int? sequenceNumber,
  }) {
    final result = create();
    if (message != null) result.message = message;
    if (sequenceNumber != null) result.sequenceNumber = sequenceNumber;
    return result;
  }

  DeviceToDeviceMessage._();

  factory DeviceToDeviceMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceToDeviceMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceToDeviceMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'securegcm'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'message', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'sequenceNumber')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceToDeviceMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceToDeviceMessage copyWith(
          void Function(DeviceToDeviceMessage) updates) =>
      super.copyWith((message) => updates(message as DeviceToDeviceMessage))
          as DeviceToDeviceMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceToDeviceMessage create() => DeviceToDeviceMessage._();
  @$core.override
  DeviceToDeviceMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceToDeviceMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceToDeviceMessage>(create);
  static DeviceToDeviceMessage? _defaultInstance;

  /// the payload of the message
  @$pb.TagNumber(1)
  $core.List<$core.int> get message => $_getN(0);
  @$pb.TagNumber(1)
  set message($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);

  /// the sequence number of the message - must be increasing.
  @$pb.TagNumber(2)
  $core.int get sequenceNumber => $_getIZ(1);
  @$pb.TagNumber(2)
  set sequenceNumber($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSequenceNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearSequenceNumber() => $_clearField(2);
}

/// sent as the first message from initiator to responder
/// in an unauthenticated Diffie-Hellman Key Exchange
class InitiatorHello extends $pb.GeneratedMessage {
  factory InitiatorHello({
    $0.GenericPublicKey? publicDhKey,
    $core.int? protocolVersion,
  }) {
    final result = create();
    if (publicDhKey != null) result.publicDhKey = publicDhKey;
    if (protocolVersion != null) result.protocolVersion = protocolVersion;
    return result;
  }

  InitiatorHello._();

  factory InitiatorHello.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InitiatorHello.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InitiatorHello',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'securegcm'),
      createEmptyInstance: create)
    ..aOM<$0.GenericPublicKey>(1, _omitFieldNames ? '' : 'publicDhKey',
        subBuilder: $0.GenericPublicKey.create)
    ..aI(2, _omitFieldNames ? '' : 'protocolVersion');

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiatorHello clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InitiatorHello copyWith(void Function(InitiatorHello) updates) =>
      super.copyWith((message) => updates(message as InitiatorHello))
          as InitiatorHello;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InitiatorHello create() => InitiatorHello._();
  @$core.override
  InitiatorHello createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InitiatorHello getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InitiatorHello>(create);
  static InitiatorHello? _defaultInstance;

  /// The session public key to send to the responder
  @$pb.TagNumber(1)
  $0.GenericPublicKey get publicDhKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicDhKey($0.GenericPublicKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicDhKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicDhKey() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.GenericPublicKey ensurePublicDhKey() => $_ensure(0);

  /// The protocol version
  @$pb.TagNumber(2)
  $core.int get protocolVersion => $_getIZ(1);
  @$pb.TagNumber(2)
  set protocolVersion($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProtocolVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearProtocolVersion() => $_clearField(2);
}

/// sent inside the header of the first message from the responder to the
/// initiator in an unauthenticated Diffie-Hellman Key Exchange
class ResponderHello extends $pb.GeneratedMessage {
  factory ResponderHello({
    $0.GenericPublicKey? publicDhKey,
    $core.int? protocolVersion,
  }) {
    final result = create();
    if (publicDhKey != null) result.publicDhKey = publicDhKey;
    if (protocolVersion != null) result.protocolVersion = protocolVersion;
    return result;
  }

  ResponderHello._();

  factory ResponderHello.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResponderHello.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResponderHello',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'securegcm'),
      createEmptyInstance: create)
    ..aOM<$0.GenericPublicKey>(1, _omitFieldNames ? '' : 'publicDhKey',
        subBuilder: $0.GenericPublicKey.create)
    ..aI(2, _omitFieldNames ? '' : 'protocolVersion');

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResponderHello clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResponderHello copyWith(void Function(ResponderHello) updates) =>
      super.copyWith((message) => updates(message as ResponderHello))
          as ResponderHello;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResponderHello create() => ResponderHello._();
  @$core.override
  ResponderHello createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResponderHello getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResponderHello>(create);
  static ResponderHello? _defaultInstance;

  /// The session public key to send to the initiator
  @$pb.TagNumber(1)
  $0.GenericPublicKey get publicDhKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicDhKey($0.GenericPublicKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicDhKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicDhKey() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.GenericPublicKey ensurePublicDhKey() => $_ensure(0);

  /// The protocol version
  @$pb.TagNumber(2)
  $core.int get protocolVersion => $_getIZ(1);
  @$pb.TagNumber(2)
  set protocolVersion($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProtocolVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearProtocolVersion() => $_clearField(2);
}

/// A convenience proto for encoding curve points in affine representation
class EcPoint extends $pb.GeneratedMessage {
  factory EcPoint({
    Curve? curve,
    $core.List<$core.int>? x,
    $core.List<$core.int>? y,
  }) {
    final result = create();
    if (curve != null) result.curve = curve;
    if (x != null) result.x = x;
    if (y != null) result.y = y;
    return result;
  }

  EcPoint._();

  factory EcPoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EcPoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EcPoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'securegcm'),
      createEmptyInstance: create)
    ..aE<Curve>(1, _omitFieldNames ? '' : 'curve',
        fieldType: $pb.PbFieldType.QE, enumValues: Curve.values)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'x', $pb.PbFieldType.QY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'y', $pb.PbFieldType.QY);

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EcPoint clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EcPoint copyWith(void Function(EcPoint) updates) =>
      super.copyWith((message) => updates(message as EcPoint)) as EcPoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EcPoint create() => EcPoint._();
  @$core.override
  EcPoint createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EcPoint getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EcPoint>(create);
  static EcPoint? _defaultInstance;

  @$pb.TagNumber(1)
  Curve get curve => $_getN(0);
  @$pb.TagNumber(1)
  set curve(Curve value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCurve() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurve() => $_clearField(1);

  /// x and y are encoded in big-endian two's complement
  /// client MUST verify (x,y) is a valid point on the specified curve
  @$pb.TagNumber(2)
  $core.List<$core.int> get x => $_getN(1);
  @$pb.TagNumber(2)
  set x($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasX() => $_has(1);
  @$pb.TagNumber(2)
  void clearX() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get y => $_getN(2);
  @$pb.TagNumber(3)
  set y($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasY() => $_has(2);
  @$pb.TagNumber(3)
  void clearY() => $_clearField(3);
}

class SpakeHandshakeMessage extends $pb.GeneratedMessage {
  factory SpakeHandshakeMessage({
    $core.int? flowNumber,
    EcPoint? ecPoint,
    $core.List<$core.int>? hashValue,
    $core.List<$core.int>? payload,
  }) {
    final result = create();
    if (flowNumber != null) result.flowNumber = flowNumber;
    if (ecPoint != null) result.ecPoint = ecPoint;
    if (hashValue != null) result.hashValue = hashValue;
    if (payload != null) result.payload = payload;
    return result;
  }

  SpakeHandshakeMessage._();

  factory SpakeHandshakeMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpakeHandshakeMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpakeHandshakeMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'securegcm'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'flowNumber')
    ..aOM<EcPoint>(2, _omitFieldNames ? '' : 'ecPoint',
        subBuilder: EcPoint.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'hashValue', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'payload', $pb.PbFieldType.OY);

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpakeHandshakeMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpakeHandshakeMessage copyWith(
          void Function(SpakeHandshakeMessage) updates) =>
      super.copyWith((message) => updates(message as SpakeHandshakeMessage))
          as SpakeHandshakeMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpakeHandshakeMessage create() => SpakeHandshakeMessage._();
  @$core.override
  SpakeHandshakeMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SpakeHandshakeMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpakeHandshakeMessage>(create);
  static SpakeHandshakeMessage? _defaultInstance;

  /// Each flow in the protocol bumps this counter
  @$pb.TagNumber(1)
  $core.int get flowNumber => $_getIZ(0);
  @$pb.TagNumber(1)
  set flowNumber($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFlowNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearFlowNumber() => $_clearField(1);

  /// Some (but not all) SPAKE flows send a point on an elliptic curve
  @$pb.TagNumber(2)
  EcPoint get ecPoint => $_getN(1);
  @$pb.TagNumber(2)
  set ecPoint(EcPoint value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEcPoint() => $_has(1);
  @$pb.TagNumber(2)
  void clearEcPoint() => $_clearField(2);
  @$pb.TagNumber(2)
  EcPoint ensureEcPoint() => $_ensure(1);

  /// Some (but not all) SPAKE flows send a hash value
  @$pb.TagNumber(3)
  $core.List<$core.int> get hashValue => $_getN(2);
  @$pb.TagNumber(3)
  set hashValue($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHashValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearHashValue() => $_clearField(3);

  /// The last flow of a SPAKE protocol can send an optional payload,
  /// since the key exchange is already complete on the sender's side.
  @$pb.TagNumber(4)
  $core.List<$core.int> get payload => $_getN(3);
  @$pb.TagNumber(4)
  set payload($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPayload() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayload() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
