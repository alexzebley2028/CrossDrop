// This is a generated file - do not edit.
//
// Generated from offline_wire_formats.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'offline_wire_formats.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'offline_wire_formats.pbenum.dart';

class OfflineFrame extends $pb.GeneratedMessage {
  factory OfflineFrame({
    OfflineFrame_Version? version,
    V1Frame? v1,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (v1 != null) result.v1 = v1;
    return result;
  }

  OfflineFrame._();

  factory OfflineFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OfflineFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OfflineFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aE<OfflineFrame_Version>(1, _omitFieldNames ? '' : 'version',
        enumValues: OfflineFrame_Version.values)
    ..aOM<V1Frame>(2, _omitFieldNames ? '' : 'v1', subBuilder: V1Frame.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OfflineFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OfflineFrame copyWith(void Function(OfflineFrame) updates) =>
      super.copyWith((message) => updates(message as OfflineFrame))
          as OfflineFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OfflineFrame create() => OfflineFrame._();
  @$core.override
  OfflineFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OfflineFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OfflineFrame>(create);
  static OfflineFrame? _defaultInstance;

  @$pb.TagNumber(1)
  OfflineFrame_Version get version => $_getN(0);
  @$pb.TagNumber(1)
  set version(OfflineFrame_Version value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  /// Right now there's only 1 version, but if there are more, exactly one of
  /// the following fields will be set.
  @$pb.TagNumber(2)
  V1Frame get v1 => $_getN(1);
  @$pb.TagNumber(2)
  set v1(V1Frame value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasV1() => $_has(1);
  @$pb.TagNumber(2)
  void clearV1() => $_clearField(2);
  @$pb.TagNumber(2)
  V1Frame ensureV1() => $_ensure(1);
}

class V1Frame extends $pb.GeneratedMessage {
  factory V1Frame({
    V1Frame_FrameType? type,
    ConnectionRequestFrame? connectionRequest,
    ConnectionResponseFrame? connectionResponse,
    PayloadTransferFrame? payloadTransfer,
    BandwidthUpgradeNegotiationFrame? bandwidthUpgradeNegotiation,
    KeepAliveFrame? keepAlive,
    DisconnectionFrame? disconnection,
    PairedKeyEncryptionFrame? pairedKeyEncryption,
    AuthenticationMessageFrame? authenticationMessage,
    AuthenticationResultFrame? authenticationResult,
    AutoResumeFrame? autoResume,
    AutoReconnectFrame? autoReconnect,
    BandwidthUpgradeRetryFrame? bandwidthUpgradeRetry,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (connectionRequest != null) result.connectionRequest = connectionRequest;
    if (connectionResponse != null)
      result.connectionResponse = connectionResponse;
    if (payloadTransfer != null) result.payloadTransfer = payloadTransfer;
    if (bandwidthUpgradeNegotiation != null)
      result.bandwidthUpgradeNegotiation = bandwidthUpgradeNegotiation;
    if (keepAlive != null) result.keepAlive = keepAlive;
    if (disconnection != null) result.disconnection = disconnection;
    if (pairedKeyEncryption != null)
      result.pairedKeyEncryption = pairedKeyEncryption;
    if (authenticationMessage != null)
      result.authenticationMessage = authenticationMessage;
    if (authenticationResult != null)
      result.authenticationResult = authenticationResult;
    if (autoResume != null) result.autoResume = autoResume;
    if (autoReconnect != null) result.autoReconnect = autoReconnect;
    if (bandwidthUpgradeRetry != null)
      result.bandwidthUpgradeRetry = bandwidthUpgradeRetry;
    return result;
  }

  V1Frame._();

  factory V1Frame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory V1Frame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'V1Frame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aE<V1Frame_FrameType>(1, _omitFieldNames ? '' : 'type',
        enumValues: V1Frame_FrameType.values)
    ..aOM<ConnectionRequestFrame>(2, _omitFieldNames ? '' : 'connectionRequest',
        subBuilder: ConnectionRequestFrame.create)
    ..aOM<ConnectionResponseFrame>(
        3, _omitFieldNames ? '' : 'connectionResponse',
        subBuilder: ConnectionResponseFrame.create)
    ..aOM<PayloadTransferFrame>(4, _omitFieldNames ? '' : 'payloadTransfer',
        subBuilder: PayloadTransferFrame.create)
    ..aOM<BandwidthUpgradeNegotiationFrame>(
        5, _omitFieldNames ? '' : 'bandwidthUpgradeNegotiation',
        subBuilder: BandwidthUpgradeNegotiationFrame.create)
    ..aOM<KeepAliveFrame>(6, _omitFieldNames ? '' : 'keepAlive',
        subBuilder: KeepAliveFrame.create)
    ..aOM<DisconnectionFrame>(7, _omitFieldNames ? '' : 'disconnection',
        subBuilder: DisconnectionFrame.create)
    ..aOM<PairedKeyEncryptionFrame>(
        8, _omitFieldNames ? '' : 'pairedKeyEncryption',
        subBuilder: PairedKeyEncryptionFrame.create)
    ..aOM<AuthenticationMessageFrame>(
        9, _omitFieldNames ? '' : 'authenticationMessage',
        subBuilder: AuthenticationMessageFrame.create)
    ..aOM<AuthenticationResultFrame>(
        10, _omitFieldNames ? '' : 'authenticationResult',
        subBuilder: AuthenticationResultFrame.create)
    ..aOM<AutoResumeFrame>(11, _omitFieldNames ? '' : 'autoResume',
        subBuilder: AutoResumeFrame.create)
    ..aOM<AutoReconnectFrame>(12, _omitFieldNames ? '' : 'autoReconnect',
        subBuilder: AutoReconnectFrame.create)
    ..aOM<BandwidthUpgradeRetryFrame>(
        13, _omitFieldNames ? '' : 'bandwidthUpgradeRetry',
        subBuilder: BandwidthUpgradeRetryFrame.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  V1Frame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  V1Frame copyWith(void Function(V1Frame) updates) =>
      super.copyWith((message) => updates(message as V1Frame)) as V1Frame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static V1Frame create() => V1Frame._();
  @$core.override
  V1Frame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static V1Frame getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<V1Frame>(create);
  static V1Frame? _defaultInstance;

  @$pb.TagNumber(1)
  V1Frame_FrameType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(V1Frame_FrameType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  /// Exactly one of the following fields will be set.
  @$pb.TagNumber(2)
  ConnectionRequestFrame get connectionRequest => $_getN(1);
  @$pb.TagNumber(2)
  set connectionRequest(ConnectionRequestFrame value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasConnectionRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearConnectionRequest() => $_clearField(2);
  @$pb.TagNumber(2)
  ConnectionRequestFrame ensureConnectionRequest() => $_ensure(1);

  @$pb.TagNumber(3)
  ConnectionResponseFrame get connectionResponse => $_getN(2);
  @$pb.TagNumber(3)
  set connectionResponse(ConnectionResponseFrame value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasConnectionResponse() => $_has(2);
  @$pb.TagNumber(3)
  void clearConnectionResponse() => $_clearField(3);
  @$pb.TagNumber(3)
  ConnectionResponseFrame ensureConnectionResponse() => $_ensure(2);

  @$pb.TagNumber(4)
  PayloadTransferFrame get payloadTransfer => $_getN(3);
  @$pb.TagNumber(4)
  set payloadTransfer(PayloadTransferFrame value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPayloadTransfer() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayloadTransfer() => $_clearField(4);
  @$pb.TagNumber(4)
  PayloadTransferFrame ensurePayloadTransfer() => $_ensure(3);

  @$pb.TagNumber(5)
  BandwidthUpgradeNegotiationFrame get bandwidthUpgradeNegotiation => $_getN(4);
  @$pb.TagNumber(5)
  set bandwidthUpgradeNegotiation(BandwidthUpgradeNegotiationFrame value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasBandwidthUpgradeNegotiation() => $_has(4);
  @$pb.TagNumber(5)
  void clearBandwidthUpgradeNegotiation() => $_clearField(5);
  @$pb.TagNumber(5)
  BandwidthUpgradeNegotiationFrame ensureBandwidthUpgradeNegotiation() =>
      $_ensure(4);

  @$pb.TagNumber(6)
  KeepAliveFrame get keepAlive => $_getN(5);
  @$pb.TagNumber(6)
  set keepAlive(KeepAliveFrame value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasKeepAlive() => $_has(5);
  @$pb.TagNumber(6)
  void clearKeepAlive() => $_clearField(6);
  @$pb.TagNumber(6)
  KeepAliveFrame ensureKeepAlive() => $_ensure(5);

  @$pb.TagNumber(7)
  DisconnectionFrame get disconnection => $_getN(6);
  @$pb.TagNumber(7)
  set disconnection(DisconnectionFrame value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasDisconnection() => $_has(6);
  @$pb.TagNumber(7)
  void clearDisconnection() => $_clearField(7);
  @$pb.TagNumber(7)
  DisconnectionFrame ensureDisconnection() => $_ensure(6);

  @$pb.TagNumber(8)
  PairedKeyEncryptionFrame get pairedKeyEncryption => $_getN(7);
  @$pb.TagNumber(8)
  set pairedKeyEncryption(PairedKeyEncryptionFrame value) =>
      $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasPairedKeyEncryption() => $_has(7);
  @$pb.TagNumber(8)
  void clearPairedKeyEncryption() => $_clearField(8);
  @$pb.TagNumber(8)
  PairedKeyEncryptionFrame ensurePairedKeyEncryption() => $_ensure(7);

  @$pb.TagNumber(9)
  AuthenticationMessageFrame get authenticationMessage => $_getN(8);
  @$pb.TagNumber(9)
  set authenticationMessage(AuthenticationMessageFrame value) =>
      $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasAuthenticationMessage() => $_has(8);
  @$pb.TagNumber(9)
  void clearAuthenticationMessage() => $_clearField(9);
  @$pb.TagNumber(9)
  AuthenticationMessageFrame ensureAuthenticationMessage() => $_ensure(8);

  @$pb.TagNumber(10)
  AuthenticationResultFrame get authenticationResult => $_getN(9);
  @$pb.TagNumber(10)
  set authenticationResult(AuthenticationResultFrame value) =>
      $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasAuthenticationResult() => $_has(9);
  @$pb.TagNumber(10)
  void clearAuthenticationResult() => $_clearField(10);
  @$pb.TagNumber(10)
  AuthenticationResultFrame ensureAuthenticationResult() => $_ensure(9);

  @$pb.TagNumber(11)
  AutoResumeFrame get autoResume => $_getN(10);
  @$pb.TagNumber(11)
  set autoResume(AutoResumeFrame value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasAutoResume() => $_has(10);
  @$pb.TagNumber(11)
  void clearAutoResume() => $_clearField(11);
  @$pb.TagNumber(11)
  AutoResumeFrame ensureAutoResume() => $_ensure(10);

  @$pb.TagNumber(12)
  AutoReconnectFrame get autoReconnect => $_getN(11);
  @$pb.TagNumber(12)
  set autoReconnect(AutoReconnectFrame value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasAutoReconnect() => $_has(11);
  @$pb.TagNumber(12)
  void clearAutoReconnect() => $_clearField(12);
  @$pb.TagNumber(12)
  AutoReconnectFrame ensureAutoReconnect() => $_ensure(11);

  @$pb.TagNumber(13)
  BandwidthUpgradeRetryFrame get bandwidthUpgradeRetry => $_getN(12);
  @$pb.TagNumber(13)
  set bandwidthUpgradeRetry(BandwidthUpgradeRetryFrame value) =>
      $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasBandwidthUpgradeRetry() => $_has(12);
  @$pb.TagNumber(13)
  void clearBandwidthUpgradeRetry() => $_clearField(13);
  @$pb.TagNumber(13)
  BandwidthUpgradeRetryFrame ensureBandwidthUpgradeRetry() => $_ensure(12);
}

enum ConnectionRequestFrame_Device { connectionsDevice, presenceDevice, notSet }

class ConnectionRequestFrame extends $pb.GeneratedMessage {
  factory ConnectionRequestFrame({
    $core.String? endpointId,
    $core.String? endpointName,
    $core.List<$core.int>? handshakeData,
    $core.int? nonce,
    $core.Iterable<ConnectionRequestFrame_Medium>? mediums,
    $core.List<$core.int>? endpointInfo,
    MediumMetadata? mediumMetadata,
    $core.int? keepAliveIntervalMillis,
    $core.int? keepAliveTimeoutMillis,
    @$core.Deprecated('This field is deprecated.') $core.int? deviceType,
    @$core.Deprecated('This field is deprecated.')
    $core.List<$core.int>? deviceInfo,
    ConnectionsDevice? connectionsDevice,
    PresenceDevice? presenceDevice,
    ConnectionRequestFrame_ConnectionMode? connectionMode,
    LocationHint? locationHint,
  }) {
    final result = create();
    if (endpointId != null) result.endpointId = endpointId;
    if (endpointName != null) result.endpointName = endpointName;
    if (handshakeData != null) result.handshakeData = handshakeData;
    if (nonce != null) result.nonce = nonce;
    if (mediums != null) result.mediums.addAll(mediums);
    if (endpointInfo != null) result.endpointInfo = endpointInfo;
    if (mediumMetadata != null) result.mediumMetadata = mediumMetadata;
    if (keepAliveIntervalMillis != null)
      result.keepAliveIntervalMillis = keepAliveIntervalMillis;
    if (keepAliveTimeoutMillis != null)
      result.keepAliveTimeoutMillis = keepAliveTimeoutMillis;
    if (deviceType != null) result.deviceType = deviceType;
    if (deviceInfo != null) result.deviceInfo = deviceInfo;
    if (connectionsDevice != null) result.connectionsDevice = connectionsDevice;
    if (presenceDevice != null) result.presenceDevice = presenceDevice;
    if (connectionMode != null) result.connectionMode = connectionMode;
    if (locationHint != null) result.locationHint = locationHint;
    return result;
  }

  ConnectionRequestFrame._();

  factory ConnectionRequestFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConnectionRequestFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ConnectionRequestFrame_Device>
      _ConnectionRequestFrame_DeviceByTag = {
    12: ConnectionRequestFrame_Device.connectionsDevice,
    13: ConnectionRequestFrame_Device.presenceDevice,
    0: ConnectionRequestFrame_Device.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConnectionRequestFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..oo(0, [12, 13])
    ..aOS(1, _omitFieldNames ? '' : 'endpointId')
    ..aOS(2, _omitFieldNames ? '' : 'endpointName')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'handshakeData', $pb.PbFieldType.OY)
    ..aI(4, _omitFieldNames ? '' : 'nonce')
    ..pPE<ConnectionRequestFrame_Medium>(5, _omitFieldNames ? '' : 'mediums',
        enumValues: ConnectionRequestFrame_Medium.values)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'endpointInfo', $pb.PbFieldType.OY)
    ..aOM<MediumMetadata>(7, _omitFieldNames ? '' : 'mediumMetadata',
        subBuilder: MediumMetadata.create)
    ..aI(8, _omitFieldNames ? '' : 'keepAliveIntervalMillis')
    ..aI(9, _omitFieldNames ? '' : 'keepAliveTimeoutMillis')
    ..aI(10, _omitFieldNames ? '' : 'deviceType')
    ..a<$core.List<$core.int>>(
        11, _omitFieldNames ? '' : 'deviceInfo', $pb.PbFieldType.OY)
    ..aOM<ConnectionsDevice>(12, _omitFieldNames ? '' : 'connectionsDevice',
        subBuilder: ConnectionsDevice.create)
    ..aOM<PresenceDevice>(13, _omitFieldNames ? '' : 'presenceDevice',
        subBuilder: PresenceDevice.create)
    ..aE<ConnectionRequestFrame_ConnectionMode>(
        14, _omitFieldNames ? '' : 'connectionMode',
        enumValues: ConnectionRequestFrame_ConnectionMode.values)
    ..aOM<LocationHint>(15, _omitFieldNames ? '' : 'locationHint',
        subBuilder: LocationHint.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectionRequestFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectionRequestFrame copyWith(
          void Function(ConnectionRequestFrame) updates) =>
      super.copyWith((message) => updates(message as ConnectionRequestFrame))
          as ConnectionRequestFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectionRequestFrame create() => ConnectionRequestFrame._();
  @$core.override
  ConnectionRequestFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConnectionRequestFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConnectionRequestFrame>(create);
  static ConnectionRequestFrame? _defaultInstance;

  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  ConnectionRequestFrame_Device whichDevice() =>
      _ConnectionRequestFrame_DeviceByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  void clearDevice() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get endpointId => $_getSZ(0);
  @$pb.TagNumber(1)
  set endpointId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEndpointId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEndpointId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get endpointName => $_getSZ(1);
  @$pb.TagNumber(2)
  set endpointName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEndpointName() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndpointName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get handshakeData => $_getN(2);
  @$pb.TagNumber(3)
  set handshakeData($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHandshakeData() => $_has(2);
  @$pb.TagNumber(3)
  void clearHandshakeData() => $_clearField(3);

  /// A random number generated for each outgoing connection that is presently
  /// used to act as a tiebreaker when 2 devices connect to each other
  /// simultaneously; this can also be used for other initialization-scoped
  /// things in the future.
  @$pb.TagNumber(4)
  $core.int get nonce => $_getIZ(3);
  @$pb.TagNumber(4)
  set nonce($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNonce() => $_has(3);
  @$pb.TagNumber(4)
  void clearNonce() => $_clearField(4);

  /// The mediums this device supports upgrading to. This list should be filtered
  /// by both the strategy and this device's individual limitations.
  @$pb.TagNumber(5)
  $pb.PbList<ConnectionRequestFrame_Medium> get mediums => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.int> get endpointInfo => $_getN(5);
  @$pb.TagNumber(6)
  set endpointInfo($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEndpointInfo() => $_has(5);
  @$pb.TagNumber(6)
  void clearEndpointInfo() => $_clearField(6);

  @$pb.TagNumber(7)
  MediumMetadata get mediumMetadata => $_getN(6);
  @$pb.TagNumber(7)
  set mediumMetadata(MediumMetadata value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasMediumMetadata() => $_has(6);
  @$pb.TagNumber(7)
  void clearMediumMetadata() => $_clearField(7);
  @$pb.TagNumber(7)
  MediumMetadata ensureMediumMetadata() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get keepAliveIntervalMillis => $_getIZ(7);
  @$pb.TagNumber(8)
  set keepAliveIntervalMillis($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasKeepAliveIntervalMillis() => $_has(7);
  @$pb.TagNumber(8)
  void clearKeepAliveIntervalMillis() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get keepAliveTimeoutMillis => $_getIZ(8);
  @$pb.TagNumber(9)
  set keepAliveTimeoutMillis($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasKeepAliveTimeoutMillis() => $_has(8);
  @$pb.TagNumber(9)
  void clearKeepAliveTimeoutMillis() => $_clearField(9);

  /// The type of {@link Device} object.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  $core.int get deviceType => $_getIZ(9);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  set deviceType($core.int value) => $_setSignedInt32(9, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  $core.bool hasDeviceType() => $_has(9);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  void clearDeviceType() => $_clearField(10);

  /// The bytes of serialized {@link Device} object.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  $core.List<$core.int> get deviceInfo => $_getN(10);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  set deviceInfo($core.List<$core.int> value) => $_setBytes(10, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  $core.bool hasDeviceInfo() => $_has(10);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(11)
  void clearDeviceInfo() => $_clearField(11);

  @$pb.TagNumber(12)
  ConnectionsDevice get connectionsDevice => $_getN(11);
  @$pb.TagNumber(12)
  set connectionsDevice(ConnectionsDevice value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasConnectionsDevice() => $_has(11);
  @$pb.TagNumber(12)
  void clearConnectionsDevice() => $_clearField(12);
  @$pb.TagNumber(12)
  ConnectionsDevice ensureConnectionsDevice() => $_ensure(11);

  @$pb.TagNumber(13)
  PresenceDevice get presenceDevice => $_getN(12);
  @$pb.TagNumber(13)
  set presenceDevice(PresenceDevice value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasPresenceDevice() => $_has(12);
  @$pb.TagNumber(13)
  void clearPresenceDevice() => $_clearField(13);
  @$pb.TagNumber(13)
  PresenceDevice ensurePresenceDevice() => $_ensure(12);

  @$pb.TagNumber(14)
  ConnectionRequestFrame_ConnectionMode get connectionMode => $_getN(13);
  @$pb.TagNumber(14)
  set connectionMode(ConnectionRequestFrame_ConnectionMode value) =>
      $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasConnectionMode() => $_has(13);
  @$pb.TagNumber(14)
  void clearConnectionMode() => $_clearField(14);

  @$pb.TagNumber(15)
  LocationHint get locationHint => $_getN(14);
  @$pb.TagNumber(15)
  set locationHint(LocationHint value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasLocationHint() => $_has(14);
  @$pb.TagNumber(15)
  void clearLocationHint() => $_clearField(15);
  @$pb.TagNumber(15)
  LocationHint ensureLocationHint() => $_ensure(14);
}

class ConnectionResponseFrame extends $pb.GeneratedMessage {
  factory ConnectionResponseFrame({
    @$core.Deprecated('This field is deprecated.') $core.int? status,
    $core.List<$core.int>? handshakeData,
    ConnectionResponseFrame_ResponseStatus? response,
    OsInfo? osInfo,
    $core.int? multiplexSocketBitmask,
    @$core.Deprecated('This field is deprecated.')
    $core.int? nearbyConnectionsVersion,
    $core.int? safeToDisconnectVersion,
    LocationHint? locationHint,
    $core.int? keepAliveTimeoutMillis,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (handshakeData != null) result.handshakeData = handshakeData;
    if (response != null) result.response = response;
    if (osInfo != null) result.osInfo = osInfo;
    if (multiplexSocketBitmask != null)
      result.multiplexSocketBitmask = multiplexSocketBitmask;
    if (nearbyConnectionsVersion != null)
      result.nearbyConnectionsVersion = nearbyConnectionsVersion;
    if (safeToDisconnectVersion != null)
      result.safeToDisconnectVersion = safeToDisconnectVersion;
    if (locationHint != null) result.locationHint = locationHint;
    if (keepAliveTimeoutMillis != null)
      result.keepAliveTimeoutMillis = keepAliveTimeoutMillis;
    return result;
  }

  ConnectionResponseFrame._();

  factory ConnectionResponseFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConnectionResponseFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConnectionResponseFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'status')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'handshakeData', $pb.PbFieldType.OY)
    ..aE<ConnectionResponseFrame_ResponseStatus>(
        3, _omitFieldNames ? '' : 'response',
        enumValues: ConnectionResponseFrame_ResponseStatus.values)
    ..aOM<OsInfo>(4, _omitFieldNames ? '' : 'osInfo', subBuilder: OsInfo.create)
    ..aI(5, _omitFieldNames ? '' : 'multiplexSocketBitmask')
    ..aI(6, _omitFieldNames ? '' : 'nearbyConnectionsVersion')
    ..aI(7, _omitFieldNames ? '' : 'safeToDisconnectVersion')
    ..aOM<LocationHint>(8, _omitFieldNames ? '' : 'locationHint',
        subBuilder: LocationHint.create)
    ..aI(9, _omitFieldNames ? '' : 'keepAliveTimeoutMillis')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectionResponseFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectionResponseFrame copyWith(
          void Function(ConnectionResponseFrame) updates) =>
      super.copyWith((message) => updates(message as ConnectionResponseFrame))
          as ConnectionResponseFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectionResponseFrame create() => ConnectionResponseFrame._();
  @$core.override
  ConnectionResponseFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConnectionResponseFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConnectionResponseFrame>(create);
  static ConnectionResponseFrame? _defaultInstance;

  /// One of:
  ///
  /// - ConnectionsStatusCodes.STATUS_OK
  /// - ConnectionsStatusCodes.STATUS_CONNECTION_REJECTED.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set status($core.int value) => $_setSignedInt32(0, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get handshakeData => $_getN(1);
  @$pb.TagNumber(2)
  set handshakeData($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHandshakeData() => $_has(1);
  @$pb.TagNumber(2)
  void clearHandshakeData() => $_clearField(2);

  @$pb.TagNumber(3)
  ConnectionResponseFrame_ResponseStatus get response => $_getN(2);
  @$pb.TagNumber(3)
  set response(ConnectionResponseFrame_ResponseStatus value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasResponse() => $_has(2);
  @$pb.TagNumber(3)
  void clearResponse() => $_clearField(3);

  @$pb.TagNumber(4)
  OsInfo get osInfo => $_getN(3);
  @$pb.TagNumber(4)
  set osInfo(OsInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasOsInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearOsInfo() => $_clearField(4);
  @$pb.TagNumber(4)
  OsInfo ensureOsInfo() => $_ensure(3);

  /// A bitmask value to indicate which medium supports Multiplex transmission
  /// feature. Each supporting medium could utilize one bit starting from the
  /// least significant bit in this field. eq. BT utilizes the LSB bit which 0x01
  /// means bt supports multiplex while 0x00 means not. Refer to ClientProxy.java
  /// for the bit usages.
  @$pb.TagNumber(5)
  $core.int get multiplexSocketBitmask => $_getIZ(4);
  @$pb.TagNumber(5)
  set multiplexSocketBitmask($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMultiplexSocketBitmask() => $_has(4);
  @$pb.TagNumber(5)
  void clearMultiplexSocketBitmask() => $_clearField(5);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.int get nearbyConnectionsVersion => $_getIZ(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set nearbyConnectionsVersion($core.int value) => $_setSignedInt32(5, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasNearbyConnectionsVersion() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearNearbyConnectionsVersion() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get safeToDisconnectVersion => $_getIZ(6);
  @$pb.TagNumber(7)
  set safeToDisconnectVersion($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSafeToDisconnectVersion() => $_has(6);
  @$pb.TagNumber(7)
  void clearSafeToDisconnectVersion() => $_clearField(7);

  @$pb.TagNumber(8)
  LocationHint get locationHint => $_getN(7);
  @$pb.TagNumber(8)
  set locationHint(LocationHint value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasLocationHint() => $_has(7);
  @$pb.TagNumber(8)
  void clearLocationHint() => $_clearField(8);
  @$pb.TagNumber(8)
  LocationHint ensureLocationHint() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.int get keepAliveTimeoutMillis => $_getIZ(8);
  @$pb.TagNumber(9)
  set keepAliveTimeoutMillis($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasKeepAliveTimeoutMillis() => $_has(8);
  @$pb.TagNumber(9)
  void clearKeepAliveTimeoutMillis() => $_clearField(9);
}

class PayloadTransferFrame_PayloadHeader extends $pb.GeneratedMessage {
  factory PayloadTransferFrame_PayloadHeader({
    $fixnum.Int64? id,
    PayloadTransferFrame_PayloadHeader_PayloadType? type,
    $fixnum.Int64? totalSize,
    $core.bool? isSensitive,
    $core.String? fileName,
    $core.String? parentFolder,
    $fixnum.Int64? lastModifiedTimestampMillis,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (totalSize != null) result.totalSize = totalSize;
    if (isSensitive != null) result.isSensitive = isSensitive;
    if (fileName != null) result.fileName = fileName;
    if (parentFolder != null) result.parentFolder = parentFolder;
    if (lastModifiedTimestampMillis != null)
      result.lastModifiedTimestampMillis = lastModifiedTimestampMillis;
    return result;
  }

  PayloadTransferFrame_PayloadHeader._();

  factory PayloadTransferFrame_PayloadHeader.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayloadTransferFrame_PayloadHeader.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayloadTransferFrame.PayloadHeader',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aE<PayloadTransferFrame_PayloadHeader_PayloadType>(
        2, _omitFieldNames ? '' : 'type',
        enumValues: PayloadTransferFrame_PayloadHeader_PayloadType.values)
    ..aInt64(3, _omitFieldNames ? '' : 'totalSize')
    ..aOB(4, _omitFieldNames ? '' : 'isSensitive')
    ..aOS(5, _omitFieldNames ? '' : 'fileName')
    ..aOS(6, _omitFieldNames ? '' : 'parentFolder')
    ..aInt64(7, _omitFieldNames ? '' : 'lastModifiedTimestampMillis')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayloadTransferFrame_PayloadHeader clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayloadTransferFrame_PayloadHeader copyWith(
          void Function(PayloadTransferFrame_PayloadHeader) updates) =>
      super.copyWith((message) =>
              updates(message as PayloadTransferFrame_PayloadHeader))
          as PayloadTransferFrame_PayloadHeader;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayloadTransferFrame_PayloadHeader create() =>
      PayloadTransferFrame_PayloadHeader._();
  @$core.override
  PayloadTransferFrame_PayloadHeader createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayloadTransferFrame_PayloadHeader getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayloadTransferFrame_PayloadHeader>(
          create);
  static PayloadTransferFrame_PayloadHeader? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  PayloadTransferFrame_PayloadHeader_PayloadType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(PayloadTransferFrame_PayloadHeader_PayloadType value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get totalSize => $_getI64(2);
  @$pb.TagNumber(3)
  set totalSize($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalSize() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isSensitive => $_getBF(3);
  @$pb.TagNumber(4)
  set isSensitive($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsSensitive() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsSensitive() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get fileName => $_getSZ(4);
  @$pb.TagNumber(5)
  set fileName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFileName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get parentFolder => $_getSZ(5);
  @$pb.TagNumber(6)
  set parentFolder($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasParentFolder() => $_has(5);
  @$pb.TagNumber(6)
  void clearParentFolder() => $_clearField(6);

  /// Time since the epoch in milliseconds.
  @$pb.TagNumber(7)
  $fixnum.Int64 get lastModifiedTimestampMillis => $_getI64(6);
  @$pb.TagNumber(7)
  set lastModifiedTimestampMillis($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLastModifiedTimestampMillis() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastModifiedTimestampMillis() => $_clearField(7);
}

/// Accompanies DATA packets.
class PayloadTransferFrame_PayloadChunk extends $pb.GeneratedMessage {
  factory PayloadTransferFrame_PayloadChunk({
    $core.int? flags,
    $fixnum.Int64? offset,
    $core.List<$core.int>? body,
    $core.int? index,
  }) {
    final result = create();
    if (flags != null) result.flags = flags;
    if (offset != null) result.offset = offset;
    if (body != null) result.body = body;
    if (index != null) result.index = index;
    return result;
  }

  PayloadTransferFrame_PayloadChunk._();

  factory PayloadTransferFrame_PayloadChunk.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayloadTransferFrame_PayloadChunk.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayloadTransferFrame.PayloadChunk',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'flags')
    ..aInt64(2, _omitFieldNames ? '' : 'offset')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'body', $pb.PbFieldType.OY)
    ..aI(4, _omitFieldNames ? '' : 'index')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayloadTransferFrame_PayloadChunk clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayloadTransferFrame_PayloadChunk copyWith(
          void Function(PayloadTransferFrame_PayloadChunk) updates) =>
      super.copyWith((message) =>
              updates(message as PayloadTransferFrame_PayloadChunk))
          as PayloadTransferFrame_PayloadChunk;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayloadTransferFrame_PayloadChunk create() =>
      PayloadTransferFrame_PayloadChunk._();
  @$core.override
  PayloadTransferFrame_PayloadChunk createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayloadTransferFrame_PayloadChunk getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayloadTransferFrame_PayloadChunk>(
          create);
  static PayloadTransferFrame_PayloadChunk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get flags => $_getIZ(0);
  @$pb.TagNumber(1)
  set flags($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFlags() => $_has(0);
  @$pb.TagNumber(1)
  void clearFlags() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get body => $_getN(2);
  @$pb.TagNumber(3)
  set body($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBody() => $_has(2);
  @$pb.TagNumber(3)
  void clearBody() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get index => $_getIZ(3);
  @$pb.TagNumber(4)
  set index($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearIndex() => $_clearField(4);
}

/// Accompanies CONTROL packets.
class PayloadTransferFrame_ControlMessage extends $pb.GeneratedMessage {
  factory PayloadTransferFrame_ControlMessage({
    PayloadTransferFrame_ControlMessage_EventType? event,
    $fixnum.Int64? offset,
  }) {
    final result = create();
    if (event != null) result.event = event;
    if (offset != null) result.offset = offset;
    return result;
  }

  PayloadTransferFrame_ControlMessage._();

  factory PayloadTransferFrame_ControlMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayloadTransferFrame_ControlMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayloadTransferFrame.ControlMessage',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aE<PayloadTransferFrame_ControlMessage_EventType>(
        1, _omitFieldNames ? '' : 'event',
        enumValues: PayloadTransferFrame_ControlMessage_EventType.values)
    ..aInt64(2, _omitFieldNames ? '' : 'offset')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayloadTransferFrame_ControlMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayloadTransferFrame_ControlMessage copyWith(
          void Function(PayloadTransferFrame_ControlMessage) updates) =>
      super.copyWith((message) =>
              updates(message as PayloadTransferFrame_ControlMessage))
          as PayloadTransferFrame_ControlMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayloadTransferFrame_ControlMessage create() =>
      PayloadTransferFrame_ControlMessage._();
  @$core.override
  PayloadTransferFrame_ControlMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayloadTransferFrame_ControlMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          PayloadTransferFrame_ControlMessage>(create);
  static PayloadTransferFrame_ControlMessage? _defaultInstance;

  @$pb.TagNumber(1)
  PayloadTransferFrame_ControlMessage_EventType get event => $_getN(0);
  @$pb.TagNumber(1)
  set event(PayloadTransferFrame_ControlMessage_EventType value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);
}

class PayloadTransferFrame extends $pb.GeneratedMessage {
  factory PayloadTransferFrame({
    PayloadTransferFrame_PacketType? packetType,
    PayloadTransferFrame_PayloadHeader? payloadHeader,
    PayloadTransferFrame_PayloadChunk? payloadChunk,
    PayloadTransferFrame_ControlMessage? controlMessage,
  }) {
    final result = create();
    if (packetType != null) result.packetType = packetType;
    if (payloadHeader != null) result.payloadHeader = payloadHeader;
    if (payloadChunk != null) result.payloadChunk = payloadChunk;
    if (controlMessage != null) result.controlMessage = controlMessage;
    return result;
  }

  PayloadTransferFrame._();

  factory PayloadTransferFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayloadTransferFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayloadTransferFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aE<PayloadTransferFrame_PacketType>(
        1, _omitFieldNames ? '' : 'packetType',
        enumValues: PayloadTransferFrame_PacketType.values)
    ..aOM<PayloadTransferFrame_PayloadHeader>(
        2, _omitFieldNames ? '' : 'payloadHeader',
        subBuilder: PayloadTransferFrame_PayloadHeader.create)
    ..aOM<PayloadTransferFrame_PayloadChunk>(
        3, _omitFieldNames ? '' : 'payloadChunk',
        subBuilder: PayloadTransferFrame_PayloadChunk.create)
    ..aOM<PayloadTransferFrame_ControlMessage>(
        4, _omitFieldNames ? '' : 'controlMessage',
        subBuilder: PayloadTransferFrame_ControlMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayloadTransferFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayloadTransferFrame copyWith(void Function(PayloadTransferFrame) updates) =>
      super.copyWith((message) => updates(message as PayloadTransferFrame))
          as PayloadTransferFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayloadTransferFrame create() => PayloadTransferFrame._();
  @$core.override
  PayloadTransferFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayloadTransferFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayloadTransferFrame>(create);
  static PayloadTransferFrame? _defaultInstance;

  @$pb.TagNumber(1)
  PayloadTransferFrame_PacketType get packetType => $_getN(0);
  @$pb.TagNumber(1)
  set packetType(PayloadTransferFrame_PacketType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPacketType() => $_has(0);
  @$pb.TagNumber(1)
  void clearPacketType() => $_clearField(1);

  @$pb.TagNumber(2)
  PayloadTransferFrame_PayloadHeader get payloadHeader => $_getN(1);
  @$pb.TagNumber(2)
  set payloadHeader(PayloadTransferFrame_PayloadHeader value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPayloadHeader() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayloadHeader() => $_clearField(2);
  @$pb.TagNumber(2)
  PayloadTransferFrame_PayloadHeader ensurePayloadHeader() => $_ensure(1);

  /// Exactly one of the following fields will be set, depending on the type.
  @$pb.TagNumber(3)
  PayloadTransferFrame_PayloadChunk get payloadChunk => $_getN(2);
  @$pb.TagNumber(3)
  set payloadChunk(PayloadTransferFrame_PayloadChunk value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPayloadChunk() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayloadChunk() => $_clearField(3);
  @$pb.TagNumber(3)
  PayloadTransferFrame_PayloadChunk ensurePayloadChunk() => $_ensure(2);

  @$pb.TagNumber(4)
  PayloadTransferFrame_ControlMessage get controlMessage => $_getN(3);
  @$pb.TagNumber(4)
  set controlMessage(PayloadTransferFrame_ControlMessage value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasControlMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearControlMessage() => $_clearField(4);
  @$pb.TagNumber(4)
  PayloadTransferFrame_ControlMessage ensureControlMessage() => $_ensure(3);
}

/// Represents the network tuple a service can be reached at.
class ServiceAddress extends $pb.GeneratedMessage {
  factory ServiceAddress({
    $core.List<$core.int>? ipAddress,
    $core.int? port,
  }) {
    final result = create();
    if (ipAddress != null) result.ipAddress = ipAddress;
    if (port != null) result.port = port;
    return result;
  }

  ServiceAddress._();

  factory ServiceAddress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ServiceAddress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ServiceAddress',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'ipAddress', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'port')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ServiceAddress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ServiceAddress copyWith(void Function(ServiceAddress) updates) =>
      super.copyWith((message) => updates(message as ServiceAddress))
          as ServiceAddress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServiceAddress create() => ServiceAddress._();
  @$core.override
  ServiceAddress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ServiceAddress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ServiceAddress>(create);
  static ServiceAddress? _defaultInstance;

  /// This can be either IPv4 or IPv6 address.
  /// IPv4 address are 4 bytes long, and IPv6 addresses are 16 bytes long.
  /// Field with anything other than 4 or 16 bytes is invalid.
  /// Addresses are represented in MSB-first order.
  @$pb.TagNumber(1)
  $core.List<$core.int> get ipAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ipAddress($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIpAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearIpAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get port => $_getIZ(1);
  @$pb.TagNumber(2)
  set port($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearPort() => $_clearField(2);
}

/// Accompanies Medium.WIFI_HOTSPOT.
class BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials
    extends $pb.GeneratedMessage {
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials({
    $core.String? ssid,
    $core.String? password,
    $core.int? port,
    $core.String? gateway,
    $core.int? frequency,
    $core.Iterable<ServiceAddress>? addressCandidates,
  }) {
    final result = create();
    if (ssid != null) result.ssid = ssid;
    if (password != null) result.password = password;
    if (port != null) result.port = port;
    if (gateway != null) result.gateway = gateway;
    if (frequency != null) result.frequency = frequency;
    if (addressCandidates != null)
      result.addressCandidates.addAll(addressCandidates);
    return result;
  }

  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials._();

  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'BandwidthUpgradeNegotiationFrame.UpgradePathInfo.WifiHotspotCredentials',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ssid')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aI(3, _omitFieldNames ? '' : 'port')
    ..a<$core.String>(4, _omitFieldNames ? '' : 'gateway', $pb.PbFieldType.OS,
        defaultOrMaker: '0.0.0.0')
    ..aI(5, _omitFieldNames ? '' : 'frequency', defaultOrMaker: -1)
    ..pPM<ServiceAddress>(6, _omitFieldNames ? '' : 'addressCandidates',
        subBuilder: ServiceAddress.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials
      clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials copyWith(
          void Function(
                  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials)
              updates) =>
      super.copyWith((message) => updates(message
              as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials))
          as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials
      create() =>
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials
              ._();
  @$core.override
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials
      createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials
      getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
              BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials>(
          create);
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials?
      _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ssid => $_getSZ(0);
  @$pb.TagNumber(1)
  set ssid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSsid() => $_has(0);
  @$pb.TagNumber(1)
  void clearSsid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get port => $_getIZ(2);
  @$pb.TagNumber(3)
  set port($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPort() => $_has(2);
  @$pb.TagNumber(3)
  void clearPort() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get gateway => $_getS(3, '0.0.0.0');
  @$pb.TagNumber(4)
  set gateway($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGateway() => $_has(3);
  @$pb.TagNumber(4)
  void clearGateway() => $_clearField(4);

  /// This field can be a band or frequency
  @$pb.TagNumber(5)
  $core.int get frequency => $_getI(4, -1);
  @$pb.TagNumber(5)
  set frequency($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFrequency() => $_has(4);
  @$pb.TagNumber(5)
  void clearFrequency() => $_clearField(5);

  /// This replaces gateway and port fields for new clients.
  /// The addresses list is ordered and should contain IPv6 addresses
  /// followed by IPv4 addresses.
  /// Link local addresses are acceptable here.  Receivers should scope these
  /// addresses to the network interface used to connect to the hotspot.
  /// Senders should continue to set gateway and port fields to the same
  /// value as the last item in the list.
  /// Receivers should ignore gateway and port fields if this field is set.
  /// Receivers should attempt to connect to each of the address candidates
  /// in order until a connection can be established.
  @$pb.TagNumber(6)
  $pb.PbList<ServiceAddress> get addressCandidates => $_getList(5);
}

/// Accompanies Medium.WIFI_LAN.
class BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket
    extends $pb.GeneratedMessage {
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket({
    $core.List<$core.int>? ipAddress,
    $core.int? wifiPort,
    $core.Iterable<ServiceAddress>? addressCandidates,
  }) {
    final result = create();
    if (ipAddress != null) result.ipAddress = ipAddress;
    if (wifiPort != null) result.wifiPort = wifiPort;
    if (addressCandidates != null)
      result.addressCandidates.addAll(addressCandidates);
    return result;
  }

  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket._();

  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'BandwidthUpgradeNegotiationFrame.UpgradePathInfo.WifiLanSocket',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'ipAddress', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'wifiPort')
    ..pPM<ServiceAddress>(3, _omitFieldNames ? '' : 'addressCandidates',
        subBuilder: ServiceAddress.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket clone() =>
      deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket copyWith(
          void Function(
                  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket)
              updates) =>
      super.copyWith((message) => updates(message
              as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket))
          as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket
      create() =>
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket._();
  @$core.override
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket
      createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket
      getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
              BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket>(
          create);
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket?
      _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ipAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ipAddress($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIpAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearIpAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get wifiPort => $_getIZ(1);
  @$pb.TagNumber(2)
  set wifiPort($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWifiPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearWifiPort() => $_clearField(2);

  /// This replaces ip_address and wifi_port fields for new clients.
  /// The addresses list is ordered and should contain IPv6 addresses
  /// followed by IPv4 addresses.
  /// Link local addresses cannot be used here.
  /// Senders should continue to set ip_address and wifi_port fields to the
  /// same value as the last item in the list.
  /// Receivers should ignore ip_address and wifi_port fields if this field
  /// is set.
  /// Receivers should attempt to connect to each of the address candidates
  /// in order until a connection can be established.
  @$pb.TagNumber(3)
  $pb.PbList<ServiceAddress> get addressCandidates => $_getList(2);
}

/// Accompanies Medium.BLUETOOTH.
class BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials
    extends $pb.GeneratedMessage {
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials({
    $core.String? serviceName,
    $core.String? macAddress,
  }) {
    final result = create();
    if (serviceName != null) result.serviceName = serviceName;
    if (macAddress != null) result.macAddress = macAddress;
    return result;
  }

  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials._();

  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'BandwidthUpgradeNegotiationFrame.UpgradePathInfo.BluetoothCredentials',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serviceName')
    ..aOS(2, _omitFieldNames ? '' : 'macAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials
      clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials copyWith(
          void Function(
                  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials)
              updates) =>
      super.copyWith((message) => updates(message
              as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials))
          as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials
      create() =>
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials
              ._();
  @$core.override
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials
      createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials
      getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
              BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials>(
          create);
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials?
      _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serviceName => $_getSZ(0);
  @$pb.TagNumber(1)
  set serviceName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasServiceName() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get macAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set macAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMacAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearMacAddress() => $_clearField(2);
}

/// Accompanies Medium.WIFI_AWARE.
class BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials
    extends $pb.GeneratedMessage {
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials({
    $core.String? serviceId,
    $core.List<$core.int>? serviceInfo,
    $core.String? password,
  }) {
    final result = create();
    if (serviceId != null) result.serviceId = serviceId;
    if (serviceInfo != null) result.serviceInfo = serviceInfo;
    if (password != null) result.password = password;
    return result;
  }

  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials._();

  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'BandwidthUpgradeNegotiationFrame.UpgradePathInfo.WifiAwareCredentials',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serviceId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'serviceInfo', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials
      clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials copyWith(
          void Function(
                  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials)
              updates) =>
      super.copyWith((message) => updates(message
              as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials))
          as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials
      create() =>
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials
              ._();
  @$core.override
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials
      createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials
      getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
              BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials>(
          create);
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials?
      _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set serviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasServiceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get serviceInfo => $_getN(1);
  @$pb.TagNumber(2)
  set serviceInfo($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasServiceInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearServiceInfo() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => $_clearField(3);
}

/// Accompanies Medium.WIFI_DIRECT.
class BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials
    extends $pb.GeneratedMessage {
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials({
    $core.String? ssid,
    $core.String? password,
    $core.int? port,
    $core.int? frequency,
    $core.String? gateway,
    $core.List<$core.int>? ipV6Address,
    $core.String? serviceName,
    $core.String? pin,
  }) {
    final result = create();
    if (ssid != null) result.ssid = ssid;
    if (password != null) result.password = password;
    if (port != null) result.port = port;
    if (frequency != null) result.frequency = frequency;
    if (gateway != null) result.gateway = gateway;
    if (ipV6Address != null) result.ipV6Address = ipV6Address;
    if (serviceName != null) result.serviceName = serviceName;
    if (pin != null) result.pin = pin;
    return result;
  }

  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials._();

  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'BandwidthUpgradeNegotiationFrame.UpgradePathInfo.WifiDirectCredentials',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ssid')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aI(3, _omitFieldNames ? '' : 'port')
    ..aI(4, _omitFieldNames ? '' : 'frequency')
    ..a<$core.String>(5, _omitFieldNames ? '' : 'gateway', $pb.PbFieldType.OS,
        defaultOrMaker: '0.0.0.0')
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'ipV6Address', $pb.PbFieldType.OY)
    ..aOS(7, _omitFieldNames ? '' : 'serviceName')
    ..aOS(8, _omitFieldNames ? '' : 'pin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials
      clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials copyWith(
          void Function(
                  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials)
              updates) =>
      super.copyWith((message) => updates(message
              as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials))
          as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials
      create() =>
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials
              ._();
  @$core.override
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials
      createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials
      getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
              BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials>(
          create);
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials?
      _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ssid => $_getSZ(0);
  @$pb.TagNumber(1)
  set ssid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSsid() => $_has(0);
  @$pb.TagNumber(1)
  void clearSsid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get port => $_getIZ(2);
  @$pb.TagNumber(3)
  set port($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPort() => $_has(2);
  @$pb.TagNumber(3)
  void clearPort() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get frequency => $_getIZ(3);
  @$pb.TagNumber(4)
  set frequency($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFrequency() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrequency() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get gateway => $_getS(4, '0.0.0.0');
  @$pb.TagNumber(5)
  set gateway($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGateway() => $_has(4);
  @$pb.TagNumber(5)
  void clearGateway() => $_clearField(5);

  /// IPv6 link-local address, network order (128bits).
  /// The GO should listen on both IPv4 and IPv6 addresses.
  /// https://en.wikipedia.org/wiki/Link-local_address#IPv6
  @$pb.TagNumber(6)
  $core.List<$core.int> get ipV6Address => $_getN(5);
  @$pb.TagNumber(6)
  set ipV6Address($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIpV6Address() => $_has(5);
  @$pb.TagNumber(6)
  void clearIpV6Address() => $_clearField(6);

  /// Windows only supports WifiDirect with Service Discovey. Its
  /// credentials is the service_name/pin.
  @$pb.TagNumber(7)
  $core.String get serviceName => $_getSZ(6);
  @$pb.TagNumber(7)
  set serviceName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasServiceName() => $_has(6);
  @$pb.TagNumber(7)
  void clearServiceName() => $_clearField(7);

  /// WifiDirect spec requires that pin is exactly 8 digits. The first 7
  /// digits are the PIN. The last 1 digit is a checksum calculated using a
  /// specific algorithm (CRC-8). However, the Windows WinRT
  /// WiFiDirectServiceAdvertiser::ConnectAsync() that we use does NOT
  /// enforce the CRC-8 checksum for a WPS PIN because: 1. The ConnectAsync
  /// PIN is NOT necessarily a WPS PIN. 2. WPS PIN validation is performed by
  /// the Wi-Fi driver/firmware. 3. WFDS connections often bypass or replace
  /// WPS PIN authentication
  /// pin is exchanged in the connection handshake stage, but we create and
  /// save it before starting GO, so we can send it to GC side for
  /// authentication.
  @$pb.TagNumber(8)
  $core.String get pin => $_getSZ(7);
  @$pb.TagNumber(8)
  set pin($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPin() => $_has(7);
  @$pb.TagNumber(8)
  void clearPin() => $_clearField(8);
}

/// Accompanies Medium.WEB_RTC
class BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials
    extends $pb.GeneratedMessage {
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials({
    $core.String? peerId,
    LocationHint? locationHint,
  }) {
    final result = create();
    if (peerId != null) result.peerId = peerId;
    if (locationHint != null) result.locationHint = locationHint;
    return result;
  }

  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials._();

  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'BandwidthUpgradeNegotiationFrame.UpgradePathInfo.WebRtcCredentials',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..aOM<LocationHint>(2, _omitFieldNames ? '' : 'locationHint',
        subBuilder: LocationHint.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials clone() =>
      deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials copyWith(
          void Function(
                  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials)
              updates) =>
      super.copyWith((message) => updates(message
              as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials))
          as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials
      create() =>
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials
              ._();
  @$core.override
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials
      createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials
      getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
              BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials>(
          create);
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials?
      _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => $_clearField(1);

  @$pb.TagNumber(2)
  LocationHint get locationHint => $_getN(1);
  @$pb.TagNumber(2)
  set locationHint(LocationHint value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLocationHint() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocationHint() => $_clearField(2);
  @$pb.TagNumber(2)
  LocationHint ensureLocationHint() => $_ensure(1);
}

/// Accompanies Medium.AWDL.
class BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials
    extends $pb.GeneratedMessage {
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials({
    $core.String? serviceName,
    $core.String? serviceType,
    $core.String? password,
  }) {
    final result = create();
    if (serviceName != null) result.serviceName = serviceName;
    if (serviceType != null) result.serviceType = serviceType;
    if (password != null) result.password = password;
    return result;
  }

  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials._();

  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'BandwidthUpgradeNegotiationFrame.UpgradePathInfo.AwdlCredentials',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serviceName')
    ..aOS(2, _omitFieldNames ? '' : 'serviceType')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials clone() =>
      deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials copyWith(
          void Function(
                  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials)
              updates) =>
      super.copyWith((message) => updates(message
              as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials))
          as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials
      create() =>
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials._();
  @$core.override
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials
      createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials
      getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
              BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials>(
          create);
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials?
      _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serviceName => $_getSZ(0);
  @$pb.TagNumber(1)
  set serviceName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasServiceName() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get serviceType => $_getSZ(1);
  @$pb.TagNumber(2)
  set serviceType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasServiceType() => $_has(1);
  @$pb.TagNumber(2)
  void clearServiceType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => $_clearField(3);
}

class BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest
    extends $pb.GeneratedMessage {
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest({
    $core.Iterable<BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium>?
        mediums,
    MediumMetadata? mediumMetaData,
  }) {
    final result = create();
    if (mediums != null) result.mediums.addAll(mediums);
    if (mediumMetaData != null) result.mediumMetaData = mediumMetaData;
    return result;
  }

  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest._();

  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'BandwidthUpgradeNegotiationFrame.UpgradePathInfo.UpgradePathRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..pc<BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium>(
        1, _omitFieldNames ? '' : 'mediums', $pb.PbFieldType.KE,
        valueOf:
            BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium.valueOf,
        enumValues:
            BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium.values,
        defaultEnumValue:
            BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium
                .UNKNOWN_MEDIUM)
    ..aOM<MediumMetadata>(2, _omitFieldNames ? '' : 'mediumMetaData',
        subBuilder: MediumMetadata.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest clone() =>
      deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest copyWith(
          void Function(
                  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest)
              updates) =>
      super.copyWith((message) => updates(message
              as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest))
          as BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest
      create() =>
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest
              ._();
  @$core.override
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest
      createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest
      getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
              BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest>(
          create);
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest?
      _defaultInstance;

  /// Supported mediums on the advertiser device.
  @$pb.TagNumber(1)
  $pb.PbList<BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium>
      get mediums => $_getList(0);

  @$pb.TagNumber(2)
  MediumMetadata get mediumMetaData => $_getN(1);
  @$pb.TagNumber(2)
  set mediumMetaData(MediumMetadata value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMediumMetaData() => $_has(1);
  @$pb.TagNumber(2)
  void clearMediumMetaData() => $_clearField(2);
  @$pb.TagNumber(2)
  MediumMetadata ensureMediumMetaData() => $_ensure(1);
}

/// Accompanies UPGRADE_PATH_AVAILABLE and UPGRADE_FAILURE events.
class BandwidthUpgradeNegotiationFrame_UpgradePathInfo
    extends $pb.GeneratedMessage {
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo({
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium? medium,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials?
        wifiHotspotCredentials,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket?
        wifiLanSocket,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials?
        bluetoothCredentials,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials?
        wifiAwareCredentials,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials?
        wifiDirectCredentials,
    $core.bool? supportsDisablingEncryption,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials?
        webRtcCredentials,
    $core.bool? supportsClientIntroductionAck,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest?
        upgradePathRequest,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials?
        awdlCredentials,
  }) {
    final result = create();
    if (medium != null) result.medium = medium;
    if (wifiHotspotCredentials != null)
      result.wifiHotspotCredentials = wifiHotspotCredentials;
    if (wifiLanSocket != null) result.wifiLanSocket = wifiLanSocket;
    if (bluetoothCredentials != null)
      result.bluetoothCredentials = bluetoothCredentials;
    if (wifiAwareCredentials != null)
      result.wifiAwareCredentials = wifiAwareCredentials;
    if (wifiDirectCredentials != null)
      result.wifiDirectCredentials = wifiDirectCredentials;
    if (supportsDisablingEncryption != null)
      result.supportsDisablingEncryption = supportsDisablingEncryption;
    if (webRtcCredentials != null) result.webRtcCredentials = webRtcCredentials;
    if (supportsClientIntroductionAck != null)
      result.supportsClientIntroductionAck = supportsClientIntroductionAck;
    if (upgradePathRequest != null)
      result.upgradePathRequest = upgradePathRequest;
    if (awdlCredentials != null) result.awdlCredentials = awdlCredentials;
    return result;
  }

  BandwidthUpgradeNegotiationFrame_UpgradePathInfo._();

  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthUpgradeNegotiationFrame_UpgradePathInfo.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'BandwidthUpgradeNegotiationFrame.UpgradePathInfo',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aE<BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium>(
        1, _omitFieldNames ? '' : 'medium',
        enumValues:
            BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium.values)
    ..aOM<BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials>(
        2, _omitFieldNames ? '' : 'wifiHotspotCredentials',
        subBuilder:
            BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials
                .create)
    ..aOM<BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket>(
        3, _omitFieldNames ? '' : 'wifiLanSocket',
        subBuilder:
            BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket
                .create)
    ..aOM<BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials>(
        4, _omitFieldNames ? '' : 'bluetoothCredentials',
        subBuilder:
            BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials
                .create)
    ..aOM<BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials>(
        5, _omitFieldNames ? '' : 'wifiAwareCredentials',
        subBuilder:
            BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials
                .create)
    ..aOM<BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials>(
        6, _omitFieldNames ? '' : 'wifiDirectCredentials',
        subBuilder:
            BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials
                .create)
    ..aOB(7, _omitFieldNames ? '' : 'supportsDisablingEncryption')
    ..aOM<BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials>(
        8, _omitFieldNames ? '' : 'webRtcCredentials',
        subBuilder:
            BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials
                .create)
    ..aOB(9, _omitFieldNames ? '' : 'supportsClientIntroductionAck')
    ..aOM<BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest>(
        10, _omitFieldNames ? '' : 'upgradePathRequest',
        subBuilder:
            BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest
                .create)
    ..aOM<BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials>(
        11, _omitFieldNames ? '' : 'awdlCredentials',
        subBuilder:
            BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials
                .create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo copyWith(
          void Function(BandwidthUpgradeNegotiationFrame_UpgradePathInfo)
              updates) =>
      super.copyWith((message) => updates(
              message as BandwidthUpgradeNegotiationFrame_UpgradePathInfo))
          as BandwidthUpgradeNegotiationFrame_UpgradePathInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo create() =>
      BandwidthUpgradeNegotiationFrame_UpgradePathInfo._();
  @$core.override
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo createEmptyInstance() =>
      create();
  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo>(create);
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo? _defaultInstance;

  @$pb.TagNumber(1)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium get medium =>
      $_getN(0);
  @$pb.TagNumber(1)
  set medium(BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMedium() => $_has(0);
  @$pb.TagNumber(1)
  void clearMedium() => $_clearField(1);

  /// Exactly one of the following fields will be set.
  @$pb.TagNumber(2)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials
      get wifiHotspotCredentials => $_getN(1);
  @$pb.TagNumber(2)
  set wifiHotspotCredentials(
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials
              value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasWifiHotspotCredentials() => $_has(1);
  @$pb.TagNumber(2)
  void clearWifiHotspotCredentials() => $_clearField(2);
  @$pb.TagNumber(2)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials
      ensureWifiHotspotCredentials() => $_ensure(1);

  @$pb.TagNumber(3)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket
      get wifiLanSocket => $_getN(2);
  @$pb.TagNumber(3)
  set wifiLanSocket(
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket
              value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasWifiLanSocket() => $_has(2);
  @$pb.TagNumber(3)
  void clearWifiLanSocket() => $_clearField(3);
  @$pb.TagNumber(3)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket
      ensureWifiLanSocket() => $_ensure(2);

  @$pb.TagNumber(4)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials
      get bluetoothCredentials => $_getN(3);
  @$pb.TagNumber(4)
  set bluetoothCredentials(
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials
              value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasBluetoothCredentials() => $_has(3);
  @$pb.TagNumber(4)
  void clearBluetoothCredentials() => $_clearField(4);
  @$pb.TagNumber(4)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials
      ensureBluetoothCredentials() => $_ensure(3);

  @$pb.TagNumber(5)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials
      get wifiAwareCredentials => $_getN(4);
  @$pb.TagNumber(5)
  set wifiAwareCredentials(
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials
              value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasWifiAwareCredentials() => $_has(4);
  @$pb.TagNumber(5)
  void clearWifiAwareCredentials() => $_clearField(5);
  @$pb.TagNumber(5)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials
      ensureWifiAwareCredentials() => $_ensure(4);

  @$pb.TagNumber(6)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials
      get wifiDirectCredentials => $_getN(5);
  @$pb.TagNumber(6)
  set wifiDirectCredentials(
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials
              value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasWifiDirectCredentials() => $_has(5);
  @$pb.TagNumber(6)
  void clearWifiDirectCredentials() => $_clearField(6);
  @$pb.TagNumber(6)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials
      ensureWifiDirectCredentials() => $_ensure(5);

  /// Disable Encryption for this upgrade medium to improve throughput.
  @$pb.TagNumber(7)
  $core.bool get supportsDisablingEncryption => $_getBF(6);
  @$pb.TagNumber(7)
  set supportsDisablingEncryption($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSupportsDisablingEncryption() => $_has(6);
  @$pb.TagNumber(7)
  void clearSupportsDisablingEncryption() => $_clearField(7);

  @$pb.TagNumber(8)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials
      get webRtcCredentials => $_getN(7);
  @$pb.TagNumber(8)
  set webRtcCredentials(
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials
              value) =>
      $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasWebRtcCredentials() => $_has(7);
  @$pb.TagNumber(8)
  void clearWebRtcCredentials() => $_clearField(8);
  @$pb.TagNumber(8)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials
      ensureWebRtcCredentials() => $_ensure(7);

  /// An ack will be sent after the CLIENT_INTRODUCTION frame.
  @$pb.TagNumber(9)
  $core.bool get supportsClientIntroductionAck => $_getBF(8);
  @$pb.TagNumber(9)
  set supportsClientIntroductionAck($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasSupportsClientIntroductionAck() => $_has(8);
  @$pb.TagNumber(9)
  void clearSupportsClientIntroductionAck() => $_clearField(9);

  @$pb.TagNumber(10)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest
      get upgradePathRequest => $_getN(9);
  @$pb.TagNumber(10)
  set upgradePathRequest(
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest
              value) =>
      $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasUpgradePathRequest() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpgradePathRequest() => $_clearField(10);
  @$pb.TagNumber(10)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest
      ensureUpgradePathRequest() => $_ensure(9);

  @$pb.TagNumber(11)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials
      get awdlCredentials => $_getN(10);
  @$pb.TagNumber(11)
  set awdlCredentials(
          BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials
              value) =>
      $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasAwdlCredentials() => $_has(10);
  @$pb.TagNumber(11)
  void clearAwdlCredentials() => $_clearField(11);
  @$pb.TagNumber(11)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials
      ensureAwdlCredentials() => $_ensure(10);
}

/// Accompanies SAFE_TO_CLOSE_PRIOR_CHANNEL events.
class BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel
    extends $pb.GeneratedMessage {
  factory BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel({
    $core.int? staFrequency,
  }) {
    final result = create();
    if (staFrequency != null) result.staFrequency = staFrequency;
    return result;
  }

  BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel._();

  factory BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'BandwidthUpgradeNegotiationFrame.SafeToClosePriorChannel',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'staFrequency')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel clone() =>
      deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel copyWith(
          void Function(
                  BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel)
              updates) =>
      super.copyWith((message) => updates(message
              as BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel))
          as BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel create() =>
      BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel._();
  @$core.override
  BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel
      createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel
      getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel>(create);
  static BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel?
      _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get staFrequency => $_getIZ(0);
  @$pb.TagNumber(1)
  set staFrequency($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStaFrequency() => $_has(0);
  @$pb.TagNumber(1)
  void clearStaFrequency() => $_clearField(1);
}

/// Accompanies CLIENT_INTRODUCTION events.
class BandwidthUpgradeNegotiationFrame_ClientIntroduction
    extends $pb.GeneratedMessage {
  factory BandwidthUpgradeNegotiationFrame_ClientIntroduction({
    $core.String? endpointId,
    $core.bool? supportsDisablingEncryption,
    $core.String? lastEndpointId,
  }) {
    final result = create();
    if (endpointId != null) result.endpointId = endpointId;
    if (supportsDisablingEncryption != null)
      result.supportsDisablingEncryption = supportsDisablingEncryption;
    if (lastEndpointId != null) result.lastEndpointId = lastEndpointId;
    return result;
  }

  BandwidthUpgradeNegotiationFrame_ClientIntroduction._();

  factory BandwidthUpgradeNegotiationFrame_ClientIntroduction.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthUpgradeNegotiationFrame_ClientIntroduction.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'BandwidthUpgradeNegotiationFrame.ClientIntroduction',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'endpointId')
    ..aOB(2, _omitFieldNames ? '' : 'supportsDisablingEncryption')
    ..aOS(3, _omitFieldNames ? '' : 'lastEndpointId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_ClientIntroduction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_ClientIntroduction copyWith(
          void Function(BandwidthUpgradeNegotiationFrame_ClientIntroduction)
              updates) =>
      super.copyWith((message) => updates(
              message as BandwidthUpgradeNegotiationFrame_ClientIntroduction))
          as BandwidthUpgradeNegotiationFrame_ClientIntroduction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_ClientIntroduction create() =>
      BandwidthUpgradeNegotiationFrame_ClientIntroduction._();
  @$core.override
  BandwidthUpgradeNegotiationFrame_ClientIntroduction createEmptyInstance() =>
      create();
  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_ClientIntroduction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          BandwidthUpgradeNegotiationFrame_ClientIntroduction>(create);
  static BandwidthUpgradeNegotiationFrame_ClientIntroduction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get endpointId => $_getSZ(0);
  @$pb.TagNumber(1)
  set endpointId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEndpointId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEndpointId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get supportsDisablingEncryption => $_getBF(1);
  @$pb.TagNumber(2)
  set supportsDisablingEncryption($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSupportsDisablingEncryption() => $_has(1);
  @$pb.TagNumber(2)
  void clearSupportsDisablingEncryption() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastEndpointId => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastEndpointId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLastEndpointId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastEndpointId() => $_clearField(3);
}

/// Accompanies CLIENT_INTRODUCTION_ACK events.
class BandwidthUpgradeNegotiationFrame_ClientIntroductionAck
    extends $pb.GeneratedMessage {
  factory BandwidthUpgradeNegotiationFrame_ClientIntroductionAck() => create();

  BandwidthUpgradeNegotiationFrame_ClientIntroductionAck._();

  factory BandwidthUpgradeNegotiationFrame_ClientIntroductionAck.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthUpgradeNegotiationFrame_ClientIntroductionAck.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames
          ? ''
          : 'BandwidthUpgradeNegotiationFrame.ClientIntroductionAck',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_ClientIntroductionAck clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame_ClientIntroductionAck copyWith(
          void Function(BandwidthUpgradeNegotiationFrame_ClientIntroductionAck)
              updates) =>
      super.copyWith((message) => updates(message
              as BandwidthUpgradeNegotiationFrame_ClientIntroductionAck))
          as BandwidthUpgradeNegotiationFrame_ClientIntroductionAck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_ClientIntroductionAck create() =>
      BandwidthUpgradeNegotiationFrame_ClientIntroductionAck._();
  @$core.override
  BandwidthUpgradeNegotiationFrame_ClientIntroductionAck
      createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame_ClientIntroductionAck getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          BandwidthUpgradeNegotiationFrame_ClientIntroductionAck>(create);
  static BandwidthUpgradeNegotiationFrame_ClientIntroductionAck?
      _defaultInstance;
}

class BandwidthUpgradeNegotiationFrame extends $pb.GeneratedMessage {
  factory BandwidthUpgradeNegotiationFrame({
    BandwidthUpgradeNegotiationFrame_EventType? eventType,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo? upgradePathInfo,
    BandwidthUpgradeNegotiationFrame_ClientIntroduction? clientIntroduction,
    BandwidthUpgradeNegotiationFrame_ClientIntroductionAck?
        clientIntroductionAck,
    BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel?
        safeToClosePriorChannel,
  }) {
    final result = create();
    if (eventType != null) result.eventType = eventType;
    if (upgradePathInfo != null) result.upgradePathInfo = upgradePathInfo;
    if (clientIntroduction != null)
      result.clientIntroduction = clientIntroduction;
    if (clientIntroductionAck != null)
      result.clientIntroductionAck = clientIntroductionAck;
    if (safeToClosePriorChannel != null)
      result.safeToClosePriorChannel = safeToClosePriorChannel;
    return result;
  }

  BandwidthUpgradeNegotiationFrame._();

  factory BandwidthUpgradeNegotiationFrame.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthUpgradeNegotiationFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BandwidthUpgradeNegotiationFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aE<BandwidthUpgradeNegotiationFrame_EventType>(
        1, _omitFieldNames ? '' : 'eventType',
        enumValues: BandwidthUpgradeNegotiationFrame_EventType.values)
    ..aOM<BandwidthUpgradeNegotiationFrame_UpgradePathInfo>(
        2, _omitFieldNames ? '' : 'upgradePathInfo',
        subBuilder: BandwidthUpgradeNegotiationFrame_UpgradePathInfo.create)
    ..aOM<BandwidthUpgradeNegotiationFrame_ClientIntroduction>(
        3, _omitFieldNames ? '' : 'clientIntroduction',
        subBuilder: BandwidthUpgradeNegotiationFrame_ClientIntroduction.create)
    ..aOM<BandwidthUpgradeNegotiationFrame_ClientIntroductionAck>(
        4, _omitFieldNames ? '' : 'clientIntroductionAck',
        subBuilder:
            BandwidthUpgradeNegotiationFrame_ClientIntroductionAck.create)
    ..aOM<BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel>(
        5, _omitFieldNames ? '' : 'safeToClosePriorChannel',
        subBuilder:
            BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeNegotiationFrame copyWith(
          void Function(BandwidthUpgradeNegotiationFrame) updates) =>
      super.copyWith(
              (message) => updates(message as BandwidthUpgradeNegotiationFrame))
          as BandwidthUpgradeNegotiationFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame create() =>
      BandwidthUpgradeNegotiationFrame._();
  @$core.override
  BandwidthUpgradeNegotiationFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeNegotiationFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BandwidthUpgradeNegotiationFrame>(
          create);
  static BandwidthUpgradeNegotiationFrame? _defaultInstance;

  @$pb.TagNumber(1)
  BandwidthUpgradeNegotiationFrame_EventType get eventType => $_getN(0);
  @$pb.TagNumber(1)
  set eventType(BandwidthUpgradeNegotiationFrame_EventType value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasEventType() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventType() => $_clearField(1);

  /// Exactly one of the following fields will be set.
  @$pb.TagNumber(2)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo get upgradePathInfo =>
      $_getN(1);
  @$pb.TagNumber(2)
  set upgradePathInfo(BandwidthUpgradeNegotiationFrame_UpgradePathInfo value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUpgradePathInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpgradePathInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  BandwidthUpgradeNegotiationFrame_UpgradePathInfo ensureUpgradePathInfo() =>
      $_ensure(1);

  @$pb.TagNumber(3)
  BandwidthUpgradeNegotiationFrame_ClientIntroduction get clientIntroduction =>
      $_getN(2);
  @$pb.TagNumber(3)
  set clientIntroduction(
          BandwidthUpgradeNegotiationFrame_ClientIntroduction value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasClientIntroduction() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientIntroduction() => $_clearField(3);
  @$pb.TagNumber(3)
  BandwidthUpgradeNegotiationFrame_ClientIntroduction
      ensureClientIntroduction() => $_ensure(2);

  @$pb.TagNumber(4)
  BandwidthUpgradeNegotiationFrame_ClientIntroductionAck
      get clientIntroductionAck => $_getN(3);
  @$pb.TagNumber(4)
  set clientIntroductionAck(
          BandwidthUpgradeNegotiationFrame_ClientIntroductionAck value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasClientIntroductionAck() => $_has(3);
  @$pb.TagNumber(4)
  void clearClientIntroductionAck() => $_clearField(4);
  @$pb.TagNumber(4)
  BandwidthUpgradeNegotiationFrame_ClientIntroductionAck
      ensureClientIntroductionAck() => $_ensure(3);

  @$pb.TagNumber(5)
  BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel
      get safeToClosePriorChannel => $_getN(4);
  @$pb.TagNumber(5)
  set safeToClosePriorChannel(
          BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasSafeToClosePriorChannel() => $_has(4);
  @$pb.TagNumber(5)
  void clearSafeToClosePriorChannel() => $_clearField(5);
  @$pb.TagNumber(5)
  BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel
      ensureSafeToClosePriorChannel() => $_ensure(4);
}

class BandwidthUpgradeRetryFrame extends $pb.GeneratedMessage {
  factory BandwidthUpgradeRetryFrame({
    $core.Iterable<BandwidthUpgradeRetryFrame_Medium>? supportedMedium,
    $core.bool? isRequest,
  }) {
    final result = create();
    if (supportedMedium != null) result.supportedMedium.addAll(supportedMedium);
    if (isRequest != null) result.isRequest = isRequest;
    return result;
  }

  BandwidthUpgradeRetryFrame._();

  factory BandwidthUpgradeRetryFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BandwidthUpgradeRetryFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BandwidthUpgradeRetryFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..pPE<BandwidthUpgradeRetryFrame_Medium>(
        1, _omitFieldNames ? '' : 'supportedMedium',
        enumValues: BandwidthUpgradeRetryFrame_Medium.values)
    ..aOB(2, _omitFieldNames ? '' : 'isRequest')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeRetryFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BandwidthUpgradeRetryFrame copyWith(
          void Function(BandwidthUpgradeRetryFrame) updates) =>
      super.copyWith(
              (message) => updates(message as BandwidthUpgradeRetryFrame))
          as BandwidthUpgradeRetryFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeRetryFrame create() => BandwidthUpgradeRetryFrame._();
  @$core.override
  BandwidthUpgradeRetryFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BandwidthUpgradeRetryFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BandwidthUpgradeRetryFrame>(create);
  static BandwidthUpgradeRetryFrame? _defaultInstance;

  /// The mediums this device supports upgrading to. This list should be filtered
  /// by both the strategy and this device's individual limitations.
  @$pb.TagNumber(1)
  $pb.PbList<BandwidthUpgradeRetryFrame_Medium> get supportedMedium =>
      $_getList(0);

  /// If true, expect the remote endpoint to send back the latest
  /// supported_medium.
  @$pb.TagNumber(2)
  $core.bool get isRequest => $_getBF(1);
  @$pb.TagNumber(2)
  set isRequest($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsRequest() => $_clearField(2);
}

class KeepAliveFrame extends $pb.GeneratedMessage {
  factory KeepAliveFrame({
    $core.bool? ack,
    $core.int? seqNum,
  }) {
    final result = create();
    if (ack != null) result.ack = ack;
    if (seqNum != null) result.seqNum = seqNum;
    return result;
  }

  KeepAliveFrame._();

  factory KeepAliveFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KeepAliveFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KeepAliveFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'ack')
    ..aI(2, _omitFieldNames ? '' : 'seqNum', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeepAliveFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeepAliveFrame copyWith(void Function(KeepAliveFrame) updates) =>
      super.copyWith((message) => updates(message as KeepAliveFrame))
          as KeepAliveFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeepAliveFrame create() => KeepAliveFrame._();
  @$core.override
  KeepAliveFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KeepAliveFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KeepAliveFrame>(create);
  static KeepAliveFrame? _defaultInstance;

  /// And ack will be sent after receiving KEEP_ALIVE frame.
  @$pb.TagNumber(1)
  $core.bool get ack => $_getBF(0);
  @$pb.TagNumber(1)
  set ack($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAck() => $_has(0);
  @$pb.TagNumber(1)
  void clearAck() => $_clearField(1);

  /// The sequence number
  @$pb.TagNumber(2)
  $core.int get seqNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set seqNum($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSeqNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeqNum() => $_clearField(2);
}

/// Informs the remote side to immediately severe the socket connection.
/// Used in bandwidth upgrades to get around a race condition, but may be used
/// in other situations to trigger a faster disconnection event than waiting for
/// socket closed on the remote side.
class DisconnectionFrame extends $pb.GeneratedMessage {
  factory DisconnectionFrame({
    $core.bool? requestSafeToDisconnect,
    $core.bool? ackSafeToDisconnect,
  }) {
    final result = create();
    if (requestSafeToDisconnect != null)
      result.requestSafeToDisconnect = requestSafeToDisconnect;
    if (ackSafeToDisconnect != null)
      result.ackSafeToDisconnect = ackSafeToDisconnect;
    return result;
  }

  DisconnectionFrame._();

  factory DisconnectionFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DisconnectionFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DisconnectionFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'requestSafeToDisconnect')
    ..aOB(2, _omitFieldNames ? '' : 'ackSafeToDisconnect')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DisconnectionFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DisconnectionFrame copyWith(void Function(DisconnectionFrame) updates) =>
      super.copyWith((message) => updates(message as DisconnectionFrame))
          as DisconnectionFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisconnectionFrame create() => DisconnectionFrame._();
  @$core.override
  DisconnectionFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DisconnectionFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DisconnectionFrame>(create);
  static DisconnectionFrame? _defaultInstance;

  /// Apply safe-to-disconnect protocol if true.
  @$pb.TagNumber(1)
  $core.bool get requestSafeToDisconnect => $_getBF(0);
  @$pb.TagNumber(1)
  set requestSafeToDisconnect($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestSafeToDisconnect() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestSafeToDisconnect() => $_clearField(1);

  /// Ack of receiving Disconnection frame will be sent to the sender
  /// frame.
  @$pb.TagNumber(2)
  $core.bool get ackSafeToDisconnect => $_getBF(1);
  @$pb.TagNumber(2)
  set ackSafeToDisconnect($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAckSafeToDisconnect() => $_has(1);
  @$pb.TagNumber(2)
  void clearAckSafeToDisconnect() => $_clearField(2);
}

/// A paired key encryption packet sent between devices, contains signed data.
class PairedKeyEncryptionFrame extends $pb.GeneratedMessage {
  factory PairedKeyEncryptionFrame({
    $core.List<$core.int>? signedData,
  }) {
    final result = create();
    if (signedData != null) result.signedData = signedData;
    return result;
  }

  PairedKeyEncryptionFrame._();

  factory PairedKeyEncryptionFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairedKeyEncryptionFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairedKeyEncryptionFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signedData', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairedKeyEncryptionFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairedKeyEncryptionFrame copyWith(
          void Function(PairedKeyEncryptionFrame) updates) =>
      super.copyWith((message) => updates(message as PairedKeyEncryptionFrame))
          as PairedKeyEncryptionFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairedKeyEncryptionFrame create() => PairedKeyEncryptionFrame._();
  @$core.override
  PairedKeyEncryptionFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PairedKeyEncryptionFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairedKeyEncryptionFrame>(create);
  static PairedKeyEncryptionFrame? _defaultInstance;

  /// The encrypted data (raw authentication token for the established
  /// connection) in byte array format.
  @$pb.TagNumber(1)
  $core.List<$core.int> get signedData => $_getN(0);
  @$pb.TagNumber(1)
  set signedData($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignedData() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignedData() => $_clearField(1);
}

/// Nearby Connections authentication frame, contains the bytes format of a
/// DeviceProvider's authentication message.
class AuthenticationMessageFrame extends $pb.GeneratedMessage {
  factory AuthenticationMessageFrame({
    $core.List<$core.int>? authMessage,
  }) {
    final result = create();
    if (authMessage != null) result.authMessage = authMessage;
    return result;
  }

  AuthenticationMessageFrame._();

  factory AuthenticationMessageFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuthenticationMessageFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthenticationMessageFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'authMessage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthenticationMessageFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthenticationMessageFrame copyWith(
          void Function(AuthenticationMessageFrame) updates) =>
      super.copyWith(
              (message) => updates(message as AuthenticationMessageFrame))
          as AuthenticationMessageFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthenticationMessageFrame create() => AuthenticationMessageFrame._();
  @$core.override
  AuthenticationMessageFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuthenticationMessageFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthenticationMessageFrame>(create);
  static AuthenticationMessageFrame? _defaultInstance;

  /// An auth message generated by DeviceProvider.
  /// To be sent to the remote device for verification during connection setups.
  @$pb.TagNumber(1)
  $core.List<$core.int> get authMessage => $_getN(0);
  @$pb.TagNumber(1)
  set authMessage($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAuthMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthMessage() => $_clearField(1);
}

/// Nearby Connections authentication result frame.
class AuthenticationResultFrame extends $pb.GeneratedMessage {
  factory AuthenticationResultFrame({
    $core.int? result,
  }) {
    final result$ = create();
    if (result != null) result$.result = result;
    return result$;
  }

  AuthenticationResultFrame._();

  factory AuthenticationResultFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuthenticationResultFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthenticationResultFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'result')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthenticationResultFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthenticationResultFrame copyWith(
          void Function(AuthenticationResultFrame) updates) =>
      super.copyWith((message) => updates(message as AuthenticationResultFrame))
          as AuthenticationResultFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthenticationResultFrame create() => AuthenticationResultFrame._();
  @$core.override
  AuthenticationResultFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuthenticationResultFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthenticationResultFrame>(create);
  static AuthenticationResultFrame? _defaultInstance;

  /// The authentication result. Non null if this frame is used to exchange
  /// authentication result.
  @$pb.TagNumber(1)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(1)
  set result($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => $_clearField(1);
}

class AutoResumeFrame extends $pb.GeneratedMessage {
  factory AutoResumeFrame({
    AutoResumeFrame_EventType? eventType,
    $fixnum.Int64? pendingPayloadId,
    $core.int? nextPayloadChunkIndex,
    $core.int? version,
  }) {
    final result = create();
    if (eventType != null) result.eventType = eventType;
    if (pendingPayloadId != null) result.pendingPayloadId = pendingPayloadId;
    if (nextPayloadChunkIndex != null)
      result.nextPayloadChunkIndex = nextPayloadChunkIndex;
    if (version != null) result.version = version;
    return result;
  }

  AutoResumeFrame._();

  factory AutoResumeFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AutoResumeFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AutoResumeFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aE<AutoResumeFrame_EventType>(1, _omitFieldNames ? '' : 'eventType',
        enumValues: AutoResumeFrame_EventType.values)
    ..aInt64(2, _omitFieldNames ? '' : 'pendingPayloadId')
    ..aI(3, _omitFieldNames ? '' : 'nextPayloadChunkIndex')
    ..aI(4, _omitFieldNames ? '' : 'version')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoResumeFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoResumeFrame copyWith(void Function(AutoResumeFrame) updates) =>
      super.copyWith((message) => updates(message as AutoResumeFrame))
          as AutoResumeFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AutoResumeFrame create() => AutoResumeFrame._();
  @$core.override
  AutoResumeFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AutoResumeFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AutoResumeFrame>(create);
  static AutoResumeFrame? _defaultInstance;

  @$pb.TagNumber(1)
  AutoResumeFrame_EventType get eventType => $_getN(0);
  @$pb.TagNumber(1)
  set eventType(AutoResumeFrame_EventType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasEventType() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get pendingPayloadId => $_getI64(1);
  @$pb.TagNumber(2)
  set pendingPayloadId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPendingPayloadId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPendingPayloadId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get nextPayloadChunkIndex => $_getIZ(2);
  @$pb.TagNumber(3)
  set nextPayloadChunkIndex($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNextPayloadChunkIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextPayloadChunkIndex() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get version => $_getIZ(3);
  @$pb.TagNumber(4)
  set version($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearVersion() => $_clearField(4);
}

class AutoReconnectFrame extends $pb.GeneratedMessage {
  factory AutoReconnectFrame({
    $core.String? endpointId,
    AutoReconnectFrame_EventType? eventType,
    $core.String? lastEndpointId,
  }) {
    final result = create();
    if (endpointId != null) result.endpointId = endpointId;
    if (eventType != null) result.eventType = eventType;
    if (lastEndpointId != null) result.lastEndpointId = lastEndpointId;
    return result;
  }

  AutoReconnectFrame._();

  factory AutoReconnectFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AutoReconnectFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AutoReconnectFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'endpointId')
    ..aE<AutoReconnectFrame_EventType>(2, _omitFieldNames ? '' : 'eventType',
        enumValues: AutoReconnectFrame_EventType.values)
    ..aOS(3, _omitFieldNames ? '' : 'lastEndpointId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoReconnectFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoReconnectFrame copyWith(void Function(AutoReconnectFrame) updates) =>
      super.copyWith((message) => updates(message as AutoReconnectFrame))
          as AutoReconnectFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AutoReconnectFrame create() => AutoReconnectFrame._();
  @$core.override
  AutoReconnectFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AutoReconnectFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AutoReconnectFrame>(create);
  static AutoReconnectFrame? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get endpointId => $_getSZ(0);
  @$pb.TagNumber(1)
  set endpointId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEndpointId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEndpointId() => $_clearField(1);

  @$pb.TagNumber(2)
  AutoReconnectFrame_EventType get eventType => $_getN(1);
  @$pb.TagNumber(2)
  set eventType(AutoReconnectFrame_EventType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEventType() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastEndpointId => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastEndpointId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLastEndpointId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastEndpointId() => $_clearField(3);
}

class MediumMetadata extends $pb.GeneratedMessage {
  factory MediumMetadata({
    $core.bool? supports5Ghz,
    $core.String? bssid,
    $core.List<$core.int>? ipAddress,
    $core.bool? supports6Ghz,
    $core.bool? mobileRadio,
    $core.int? apFrequency,
    AvailableChannels? availableChannels,
    WifiDirectCliUsableChannels? wifiDirectCliUsableChannels,
    WifiLanUsableChannels? wifiLanUsableChannels,
    WifiAwareUsableChannels? wifiAwareUsableChannels,
    WifiHotspotStaUsableChannels? wifiHotspotStaUsableChannels,
    MediumRole? mediumRole,
    $core.Iterable<MediumMetadata_WifiDirectAuthType>?
        supportedWifiDirectAuthTypes,
  }) {
    final result = create();
    if (supports5Ghz != null) result.supports5Ghz = supports5Ghz;
    if (bssid != null) result.bssid = bssid;
    if (ipAddress != null) result.ipAddress = ipAddress;
    if (supports6Ghz != null) result.supports6Ghz = supports6Ghz;
    if (mobileRadio != null) result.mobileRadio = mobileRadio;
    if (apFrequency != null) result.apFrequency = apFrequency;
    if (availableChannels != null) result.availableChannels = availableChannels;
    if (wifiDirectCliUsableChannels != null)
      result.wifiDirectCliUsableChannels = wifiDirectCliUsableChannels;
    if (wifiLanUsableChannels != null)
      result.wifiLanUsableChannels = wifiLanUsableChannels;
    if (wifiAwareUsableChannels != null)
      result.wifiAwareUsableChannels = wifiAwareUsableChannels;
    if (wifiHotspotStaUsableChannels != null)
      result.wifiHotspotStaUsableChannels = wifiHotspotStaUsableChannels;
    if (mediumRole != null) result.mediumRole = mediumRole;
    if (supportedWifiDirectAuthTypes != null)
      result.supportedWifiDirectAuthTypes.addAll(supportedWifiDirectAuthTypes);
    return result;
  }

  MediumMetadata._();

  factory MediumMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MediumMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MediumMetadata',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'supports5Ghz', protoName: 'supports_5_ghz')
    ..aOS(2, _omitFieldNames ? '' : 'bssid')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'ipAddress', $pb.PbFieldType.OY)
    ..aOB(4, _omitFieldNames ? '' : 'supports6Ghz', protoName: 'supports_6_ghz')
    ..aOB(5, _omitFieldNames ? '' : 'mobileRadio')
    ..aI(6, _omitFieldNames ? '' : 'apFrequency', defaultOrMaker: -1)
    ..aOM<AvailableChannels>(7, _omitFieldNames ? '' : 'availableChannels',
        subBuilder: AvailableChannels.create)
    ..aOM<WifiDirectCliUsableChannels>(
        8, _omitFieldNames ? '' : 'wifiDirectCliUsableChannels',
        subBuilder: WifiDirectCliUsableChannels.create)
    ..aOM<WifiLanUsableChannels>(
        9, _omitFieldNames ? '' : 'wifiLanUsableChannels',
        subBuilder: WifiLanUsableChannels.create)
    ..aOM<WifiAwareUsableChannels>(
        10, _omitFieldNames ? '' : 'wifiAwareUsableChannels',
        subBuilder: WifiAwareUsableChannels.create)
    ..aOM<WifiHotspotStaUsableChannels>(
        11, _omitFieldNames ? '' : 'wifiHotspotStaUsableChannels',
        subBuilder: WifiHotspotStaUsableChannels.create)
    ..aOM<MediumRole>(12, _omitFieldNames ? '' : 'mediumRole',
        subBuilder: MediumRole.create)
    ..pc<MediumMetadata_WifiDirectAuthType>(
        13,
        _omitFieldNames ? '' : 'supportedWifiDirectAuthTypes',
        $pb.PbFieldType.KE,
        valueOf: MediumMetadata_WifiDirectAuthType.valueOf,
        enumValues: MediumMetadata_WifiDirectAuthType.values,
        defaultEnumValue:
            MediumMetadata_WifiDirectAuthType.WIFI_DIRECT_TYPE_UNKNOWN)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediumMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediumMetadata copyWith(void Function(MediumMetadata) updates) =>
      super.copyWith((message) => updates(message as MediumMetadata))
          as MediumMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediumMetadata create() => MediumMetadata._();
  @$core.override
  MediumMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MediumMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MediumMetadata>(create);
  static MediumMetadata? _defaultInstance;

  /// True if local device supports 5GHz.
  @$pb.TagNumber(1)
  $core.bool get supports5Ghz => $_getBF(0);
  @$pb.TagNumber(1)
  set supports5Ghz($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSupports5Ghz() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupports5Ghz() => $_clearField(1);

  /// WiFi LAN BSSID, in the form of a six-byte MAC address: XX:XX:XX:XX:XX:XX
  @$pb.TagNumber(2)
  $core.String get bssid => $_getSZ(1);
  @$pb.TagNumber(2)
  set bssid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBssid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBssid() => $_clearField(2);

  /// IP address, in network byte order: the highest order byte of the address is
  /// in byte[0].
  @$pb.TagNumber(3)
  $core.List<$core.int> get ipAddress => $_getN(2);
  @$pb.TagNumber(3)
  set ipAddress($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIpAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearIpAddress() => $_clearField(3);

  /// True if local device supports 6GHz.
  @$pb.TagNumber(4)
  $core.bool get supports6Ghz => $_getBF(3);
  @$pb.TagNumber(4)
  set supports6Ghz($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSupports6Ghz() => $_has(3);
  @$pb.TagNumber(4)
  void clearSupports6Ghz() => $_clearField(4);

  /// True if local device has mobile radio.
  @$pb.TagNumber(5)
  $core.bool get mobileRadio => $_getBF(4);
  @$pb.TagNumber(5)
  set mobileRadio($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMobileRadio() => $_has(4);
  @$pb.TagNumber(5)
  void clearMobileRadio() => $_clearField(5);

  /// The frequency of the WiFi LAN AP(in MHz). Or -1 is not associated with an
  /// AP over WiFi, -2 represents the active network uses an Ethernet transport.
  @$pb.TagNumber(6)
  $core.int get apFrequency => $_getI(5, -1);
  @$pb.TagNumber(6)
  set apFrequency($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasApFrequency() => $_has(5);
  @$pb.TagNumber(6)
  void clearApFrequency() => $_clearField(6);

  /// Available channels on the local device.
  @$pb.TagNumber(7)
  AvailableChannels get availableChannels => $_getN(6);
  @$pb.TagNumber(7)
  set availableChannels(AvailableChannels value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasAvailableChannels() => $_has(6);
  @$pb.TagNumber(7)
  void clearAvailableChannels() => $_clearField(7);
  @$pb.TagNumber(7)
  AvailableChannels ensureAvailableChannels() => $_ensure(6);

  /// Usable WiFi Direct client channels on the local device.
  @$pb.TagNumber(8)
  WifiDirectCliUsableChannels get wifiDirectCliUsableChannels => $_getN(7);
  @$pb.TagNumber(8)
  set wifiDirectCliUsableChannels(WifiDirectCliUsableChannels value) =>
      $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasWifiDirectCliUsableChannels() => $_has(7);
  @$pb.TagNumber(8)
  void clearWifiDirectCliUsableChannels() => $_clearField(8);
  @$pb.TagNumber(8)
  WifiDirectCliUsableChannels ensureWifiDirectCliUsableChannels() =>
      $_ensure(7);

  /// Usable WiFi LAN channels on the local device.
  @$pb.TagNumber(9)
  WifiLanUsableChannels get wifiLanUsableChannels => $_getN(8);
  @$pb.TagNumber(9)
  set wifiLanUsableChannels(WifiLanUsableChannels value) =>
      $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasWifiLanUsableChannels() => $_has(8);
  @$pb.TagNumber(9)
  void clearWifiLanUsableChannels() => $_clearField(9);
  @$pb.TagNumber(9)
  WifiLanUsableChannels ensureWifiLanUsableChannels() => $_ensure(8);

  /// Usable WiFi Aware channels on the local device.
  @$pb.TagNumber(10)
  WifiAwareUsableChannels get wifiAwareUsableChannels => $_getN(9);
  @$pb.TagNumber(10)
  set wifiAwareUsableChannels(WifiAwareUsableChannels value) =>
      $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasWifiAwareUsableChannels() => $_has(9);
  @$pb.TagNumber(10)
  void clearWifiAwareUsableChannels() => $_clearField(10);
  @$pb.TagNumber(10)
  WifiAwareUsableChannels ensureWifiAwareUsableChannels() => $_ensure(9);

  /// Usable WiFi Hotspot STA channels on the local device.
  @$pb.TagNumber(11)
  WifiHotspotStaUsableChannels get wifiHotspotStaUsableChannels => $_getN(10);
  @$pb.TagNumber(11)
  set wifiHotspotStaUsableChannels(WifiHotspotStaUsableChannels value) =>
      $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasWifiHotspotStaUsableChannels() => $_has(10);
  @$pb.TagNumber(11)
  void clearWifiHotspotStaUsableChannels() => $_clearField(11);
  @$pb.TagNumber(11)
  WifiHotspotStaUsableChannels ensureWifiHotspotStaUsableChannels() =>
      $_ensure(10);

  /// The supported medium roles.
  @$pb.TagNumber(12)
  MediumRole get mediumRole => $_getN(11);
  @$pb.TagNumber(12)
  set mediumRole(MediumRole value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasMediumRole() => $_has(11);
  @$pb.TagNumber(12)
  void clearMediumRole() => $_clearField(12);
  @$pb.TagNumber(12)
  MediumRole ensureMediumRole() => $_ensure(11);

  /// The supported WifiDirect auth types.
  @$pb.TagNumber(13)
  $pb.PbList<MediumMetadata_WifiDirectAuthType>
      get supportedWifiDirectAuthTypes => $_getList(12);
}

/// Available channels on the local device.
class AvailableChannels extends $pb.GeneratedMessage {
  factory AvailableChannels({
    $core.Iterable<$core.int>? channels,
  }) {
    final result = create();
    if (channels != null) result.channels.addAll(channels);
    return result;
  }

  AvailableChannels._();

  factory AvailableChannels.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AvailableChannels.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AvailableChannels',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'channels', $pb.PbFieldType.K3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AvailableChannels clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AvailableChannels copyWith(void Function(AvailableChannels) updates) =>
      super.copyWith((message) => updates(message as AvailableChannels))
          as AvailableChannels;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AvailableChannels create() => AvailableChannels._();
  @$core.override
  AvailableChannels createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AvailableChannels getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvailableChannels>(create);
  static AvailableChannels? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.int> get channels => $_getList(0);
}

/// Usable WiFi Direct client channels on the local device.
class WifiDirectCliUsableChannels extends $pb.GeneratedMessage {
  factory WifiDirectCliUsableChannels({
    $core.Iterable<$core.int>? channels,
  }) {
    final result = create();
    if (channels != null) result.channels.addAll(channels);
    return result;
  }

  WifiDirectCliUsableChannels._();

  factory WifiDirectCliUsableChannels.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WifiDirectCliUsableChannels.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WifiDirectCliUsableChannels',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'channels', $pb.PbFieldType.K3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WifiDirectCliUsableChannels clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WifiDirectCliUsableChannels copyWith(
          void Function(WifiDirectCliUsableChannels) updates) =>
      super.copyWith(
              (message) => updates(message as WifiDirectCliUsableChannels))
          as WifiDirectCliUsableChannels;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WifiDirectCliUsableChannels create() =>
      WifiDirectCliUsableChannels._();
  @$core.override
  WifiDirectCliUsableChannels createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WifiDirectCliUsableChannels getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WifiDirectCliUsableChannels>(create);
  static WifiDirectCliUsableChannels? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.int> get channels => $_getList(0);
}

/// Usable WiFi LAN channels on the local device.
class WifiLanUsableChannels extends $pb.GeneratedMessage {
  factory WifiLanUsableChannels({
    $core.Iterable<$core.int>? channels,
  }) {
    final result = create();
    if (channels != null) result.channels.addAll(channels);
    return result;
  }

  WifiLanUsableChannels._();

  factory WifiLanUsableChannels.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WifiLanUsableChannels.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WifiLanUsableChannels',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'channels', $pb.PbFieldType.K3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WifiLanUsableChannels clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WifiLanUsableChannels copyWith(
          void Function(WifiLanUsableChannels) updates) =>
      super.copyWith((message) => updates(message as WifiLanUsableChannels))
          as WifiLanUsableChannels;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WifiLanUsableChannels create() => WifiLanUsableChannels._();
  @$core.override
  WifiLanUsableChannels createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WifiLanUsableChannels getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WifiLanUsableChannels>(create);
  static WifiLanUsableChannels? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.int> get channels => $_getList(0);
}

/// Usable WiFi Aware channels on the local device.
class WifiAwareUsableChannels extends $pb.GeneratedMessage {
  factory WifiAwareUsableChannels({
    $core.Iterable<$core.int>? channels,
  }) {
    final result = create();
    if (channels != null) result.channels.addAll(channels);
    return result;
  }

  WifiAwareUsableChannels._();

  factory WifiAwareUsableChannels.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WifiAwareUsableChannels.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WifiAwareUsableChannels',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'channels', $pb.PbFieldType.K3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WifiAwareUsableChannels clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WifiAwareUsableChannels copyWith(
          void Function(WifiAwareUsableChannels) updates) =>
      super.copyWith((message) => updates(message as WifiAwareUsableChannels))
          as WifiAwareUsableChannels;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WifiAwareUsableChannels create() => WifiAwareUsableChannels._();
  @$core.override
  WifiAwareUsableChannels createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WifiAwareUsableChannels getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WifiAwareUsableChannels>(create);
  static WifiAwareUsableChannels? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.int> get channels => $_getList(0);
}

/// Usable WiFi Hotspot STA channels on the local device.
class WifiHotspotStaUsableChannels extends $pb.GeneratedMessage {
  factory WifiHotspotStaUsableChannels({
    $core.Iterable<$core.int>? channels,
  }) {
    final result = create();
    if (channels != null) result.channels.addAll(channels);
    return result;
  }

  WifiHotspotStaUsableChannels._();

  factory WifiHotspotStaUsableChannels.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WifiHotspotStaUsableChannels.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WifiHotspotStaUsableChannels',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'channels', $pb.PbFieldType.K3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WifiHotspotStaUsableChannels clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WifiHotspotStaUsableChannels copyWith(
          void Function(WifiHotspotStaUsableChannels) updates) =>
      super.copyWith(
              (message) => updates(message as WifiHotspotStaUsableChannels))
          as WifiHotspotStaUsableChannels;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WifiHotspotStaUsableChannels create() =>
      WifiHotspotStaUsableChannels._();
  @$core.override
  WifiHotspotStaUsableChannels createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WifiHotspotStaUsableChannels getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WifiHotspotStaUsableChannels>(create);
  static WifiHotspotStaUsableChannels? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.int> get channels => $_getList(0);
}

/// The medium roles.
class MediumRole extends $pb.GeneratedMessage {
  factory MediumRole({
    $core.bool? supportWifiDirectGroupOwner,
    $core.bool? supportWifiDirectGroupClient,
    $core.bool? supportWifiHotspotHost,
    $core.bool? supportWifiHotspotClient,
    $core.bool? supportWifiAwarePublisher,
    $core.bool? supportWifiAwareSubscriber,
    $core.bool? supportAwdlPublisher,
    $core.bool? supportAwdlSubscriber,
  }) {
    final result = create();
    if (supportWifiDirectGroupOwner != null)
      result.supportWifiDirectGroupOwner = supportWifiDirectGroupOwner;
    if (supportWifiDirectGroupClient != null)
      result.supportWifiDirectGroupClient = supportWifiDirectGroupClient;
    if (supportWifiHotspotHost != null)
      result.supportWifiHotspotHost = supportWifiHotspotHost;
    if (supportWifiHotspotClient != null)
      result.supportWifiHotspotClient = supportWifiHotspotClient;
    if (supportWifiAwarePublisher != null)
      result.supportWifiAwarePublisher = supportWifiAwarePublisher;
    if (supportWifiAwareSubscriber != null)
      result.supportWifiAwareSubscriber = supportWifiAwareSubscriber;
    if (supportAwdlPublisher != null)
      result.supportAwdlPublisher = supportAwdlPublisher;
    if (supportAwdlSubscriber != null)
      result.supportAwdlSubscriber = supportAwdlSubscriber;
    return result;
  }

  MediumRole._();

  factory MediumRole.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MediumRole.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MediumRole',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'supportWifiDirectGroupOwner')
    ..aOB(2, _omitFieldNames ? '' : 'supportWifiDirectGroupClient')
    ..aOB(3, _omitFieldNames ? '' : 'supportWifiHotspotHost')
    ..aOB(4, _omitFieldNames ? '' : 'supportWifiHotspotClient')
    ..aOB(5, _omitFieldNames ? '' : 'supportWifiAwarePublisher')
    ..aOB(6, _omitFieldNames ? '' : 'supportWifiAwareSubscriber')
    ..aOB(7, _omitFieldNames ? '' : 'supportAwdlPublisher')
    ..aOB(8, _omitFieldNames ? '' : 'supportAwdlSubscriber')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediumRole clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediumRole copyWith(void Function(MediumRole) updates) =>
      super.copyWith((message) => updates(message as MediumRole)) as MediumRole;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediumRole create() => MediumRole._();
  @$core.override
  MediumRole createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MediumRole getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MediumRole>(create);
  static MediumRole? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get supportWifiDirectGroupOwner => $_getBF(0);
  @$pb.TagNumber(1)
  set supportWifiDirectGroupOwner($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSupportWifiDirectGroupOwner() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupportWifiDirectGroupOwner() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get supportWifiDirectGroupClient => $_getBF(1);
  @$pb.TagNumber(2)
  set supportWifiDirectGroupClient($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSupportWifiDirectGroupClient() => $_has(1);
  @$pb.TagNumber(2)
  void clearSupportWifiDirectGroupClient() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get supportWifiHotspotHost => $_getBF(2);
  @$pb.TagNumber(3)
  set supportWifiHotspotHost($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSupportWifiHotspotHost() => $_has(2);
  @$pb.TagNumber(3)
  void clearSupportWifiHotspotHost() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get supportWifiHotspotClient => $_getBF(3);
  @$pb.TagNumber(4)
  set supportWifiHotspotClient($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSupportWifiHotspotClient() => $_has(3);
  @$pb.TagNumber(4)
  void clearSupportWifiHotspotClient() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get supportWifiAwarePublisher => $_getBF(4);
  @$pb.TagNumber(5)
  set supportWifiAwarePublisher($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSupportWifiAwarePublisher() => $_has(4);
  @$pb.TagNumber(5)
  void clearSupportWifiAwarePublisher() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get supportWifiAwareSubscriber => $_getBF(5);
  @$pb.TagNumber(6)
  set supportWifiAwareSubscriber($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSupportWifiAwareSubscriber() => $_has(5);
  @$pb.TagNumber(6)
  void clearSupportWifiAwareSubscriber() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get supportAwdlPublisher => $_getBF(6);
  @$pb.TagNumber(7)
  set supportAwdlPublisher($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSupportAwdlPublisher() => $_has(6);
  @$pb.TagNumber(7)
  void clearSupportAwdlPublisher() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get supportAwdlSubscriber => $_getBF(7);
  @$pb.TagNumber(8)
  set supportAwdlSubscriber($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSupportAwdlSubscriber() => $_has(7);
  @$pb.TagNumber(8)
  void clearSupportAwdlSubscriber() => $_clearField(8);
}

/// LocationHint is used to specify a location as well as format.
class LocationHint extends $pb.GeneratedMessage {
  factory LocationHint({
    $core.String? location,
    LocationStandard_Format? format,
  }) {
    final result = create();
    if (location != null) result.location = location;
    if (format != null) result.format = format;
    return result;
  }

  LocationHint._();

  factory LocationHint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LocationHint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LocationHint',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'location')
    ..aE<LocationStandard_Format>(2, _omitFieldNames ? '' : 'format',
        enumValues: LocationStandard_Format.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocationHint clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocationHint copyWith(void Function(LocationHint) updates) =>
      super.copyWith((message) => updates(message as LocationHint))
          as LocationHint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocationHint create() => LocationHint._();
  @$core.override
  LocationHint createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LocationHint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LocationHint>(create);
  static LocationHint? _defaultInstance;

  /// Location is the location, provided in the format specified by format.
  @$pb.TagNumber(1)
  $core.String get location => $_getSZ(0);
  @$pb.TagNumber(1)
  set location($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocation() => $_clearField(1);

  /// the format of location.
  @$pb.TagNumber(2)
  LocationStandard_Format get format => $_getN(1);
  @$pb.TagNumber(2)
  set format(LocationStandard_Format value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFormat() => $_has(1);
  @$pb.TagNumber(2)
  void clearFormat() => $_clearField(2);
}

class LocationStandard extends $pb.GeneratedMessage {
  factory LocationStandard() => create();

  LocationStandard._();

  factory LocationStandard.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LocationStandard.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LocationStandard',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocationStandard clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocationStandard copyWith(void Function(LocationStandard) updates) =>
      super.copyWith((message) => updates(message as LocationStandard))
          as LocationStandard;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocationStandard create() => LocationStandard._();
  @$core.override
  LocationStandard createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LocationStandard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LocationStandard>(create);
  static LocationStandard? _defaultInstance;
}

/// Device capability for OS information.
class OsInfo extends $pb.GeneratedMessage {
  factory OsInfo({
    OsInfo_OsType? type,
  }) {
    final result = create();
    if (type != null) result.type = type;
    return result;
  }

  OsInfo._();

  factory OsInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OsInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OsInfo',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aE<OsInfo_OsType>(1, _omitFieldNames ? '' : 'type',
        enumValues: OsInfo_OsType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OsInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OsInfo copyWith(void Function(OsInfo) updates) =>
      super.copyWith((message) => updates(message as OsInfo)) as OsInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OsInfo create() => OsInfo._();
  @$core.override
  OsInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OsInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OsInfo>(create);
  static OsInfo? _defaultInstance;

  @$pb.TagNumber(1)
  OsInfo_OsType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(OsInfo_OsType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);
}

class ConnectionsDevice extends $pb.GeneratedMessage {
  factory ConnectionsDevice({
    $core.String? endpointId,
    EndpointType? endpointType,
    $core.List<$core.int>? connectivityInfoList,
    $core.List<$core.int>? endpointInfo,
  }) {
    final result = create();
    if (endpointId != null) result.endpointId = endpointId;
    if (endpointType != null) result.endpointType = endpointType;
    if (connectivityInfoList != null)
      result.connectivityInfoList = connectivityInfoList;
    if (endpointInfo != null) result.endpointInfo = endpointInfo;
    return result;
  }

  ConnectionsDevice._();

  factory ConnectionsDevice.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConnectionsDevice.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConnectionsDevice',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'endpointId')
    ..aE<EndpointType>(2, _omitFieldNames ? '' : 'endpointType',
        enumValues: EndpointType.values)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'connectivityInfoList', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'endpointInfo', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectionsDevice clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectionsDevice copyWith(void Function(ConnectionsDevice) updates) =>
      super.copyWith((message) => updates(message as ConnectionsDevice))
          as ConnectionsDevice;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectionsDevice create() => ConnectionsDevice._();
  @$core.override
  ConnectionsDevice createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConnectionsDevice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConnectionsDevice>(create);
  static ConnectionsDevice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get endpointId => $_getSZ(0);
  @$pb.TagNumber(1)
  set endpointId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEndpointId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEndpointId() => $_clearField(1);

  @$pb.TagNumber(2)
  EndpointType get endpointType => $_getN(1);
  @$pb.TagNumber(2)
  set endpointType(EndpointType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEndpointType() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndpointType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get connectivityInfoList => $_getN(2);
  @$pb.TagNumber(3)
  set connectivityInfoList($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasConnectivityInfoList() => $_has(2);
  @$pb.TagNumber(3)
  void clearConnectivityInfoList() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get endpointInfo => $_getN(3);
  @$pb.TagNumber(4)
  set endpointInfo($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEndpointInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndpointInfo() => $_clearField(4);
}

class PresenceDevice extends $pb.GeneratedMessage {
  factory PresenceDevice({
    $core.String? endpointId,
    EndpointType? endpointType,
    $core.List<$core.int>? connectivityInfoList,
    $fixnum.Int64? deviceId,
    $core.String? deviceName,
    PresenceDevice_DeviceType? deviceType,
    $core.String? deviceImageUrl,
    $core.Iterable<ConnectionRequestFrame_Medium>? discoveryMedium,
    $core.Iterable<$core.int>? actions,
    $core.Iterable<$fixnum.Int64>? identityType,
  }) {
    final result = create();
    if (endpointId != null) result.endpointId = endpointId;
    if (endpointType != null) result.endpointType = endpointType;
    if (connectivityInfoList != null)
      result.connectivityInfoList = connectivityInfoList;
    if (deviceId != null) result.deviceId = deviceId;
    if (deviceName != null) result.deviceName = deviceName;
    if (deviceType != null) result.deviceType = deviceType;
    if (deviceImageUrl != null) result.deviceImageUrl = deviceImageUrl;
    if (discoveryMedium != null) result.discoveryMedium.addAll(discoveryMedium);
    if (actions != null) result.actions.addAll(actions);
    if (identityType != null) result.identityType.addAll(identityType);
    return result;
  }

  PresenceDevice._();

  factory PresenceDevice.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PresenceDevice.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PresenceDevice',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'location.nearby.connections'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'endpointId')
    ..aE<EndpointType>(2, _omitFieldNames ? '' : 'endpointType',
        enumValues: EndpointType.values)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'connectivityInfoList', $pb.PbFieldType.OY)
    ..aInt64(4, _omitFieldNames ? '' : 'deviceId')
    ..aOS(5, _omitFieldNames ? '' : 'deviceName')
    ..aE<PresenceDevice_DeviceType>(6, _omitFieldNames ? '' : 'deviceType',
        enumValues: PresenceDevice_DeviceType.values)
    ..aOS(7, _omitFieldNames ? '' : 'deviceImageUrl')
    ..pc<ConnectionRequestFrame_Medium>(
        8, _omitFieldNames ? '' : 'discoveryMedium', $pb.PbFieldType.KE,
        valueOf: ConnectionRequestFrame_Medium.valueOf,
        enumValues: ConnectionRequestFrame_Medium.values,
        defaultEnumValue: ConnectionRequestFrame_Medium.UNKNOWN_MEDIUM)
    ..p<$core.int>(9, _omitFieldNames ? '' : 'actions', $pb.PbFieldType.K3)
    ..p<$fixnum.Int64>(
        10, _omitFieldNames ? '' : 'identityType', $pb.PbFieldType.K6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PresenceDevice clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PresenceDevice copyWith(void Function(PresenceDevice) updates) =>
      super.copyWith((message) => updates(message as PresenceDevice))
          as PresenceDevice;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PresenceDevice create() => PresenceDevice._();
  @$core.override
  PresenceDevice createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PresenceDevice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PresenceDevice>(create);
  static PresenceDevice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get endpointId => $_getSZ(0);
  @$pb.TagNumber(1)
  set endpointId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEndpointId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEndpointId() => $_clearField(1);

  @$pb.TagNumber(2)
  EndpointType get endpointType => $_getN(1);
  @$pb.TagNumber(2)
  set endpointType(EndpointType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEndpointType() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndpointType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get connectivityInfoList => $_getN(2);
  @$pb.TagNumber(3)
  set connectivityInfoList($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasConnectivityInfoList() => $_has(2);
  @$pb.TagNumber(3)
  void clearConnectivityInfoList() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get deviceId => $_getI64(3);
  @$pb.TagNumber(4)
  set deviceId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDeviceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get deviceName => $_getSZ(4);
  @$pb.TagNumber(5)
  set deviceName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDeviceName() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceName() => $_clearField(5);

  @$pb.TagNumber(6)
  PresenceDevice_DeviceType get deviceType => $_getN(5);
  @$pb.TagNumber(6)
  set deviceType(PresenceDevice_DeviceType value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasDeviceType() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeviceType() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get deviceImageUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set deviceImageUrl($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDeviceImageUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeviceImageUrl() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<ConnectionRequestFrame_Medium> get discoveryMedium => $_getList(7);

  @$pb.TagNumber(9)
  $pb.PbList<$core.int> get actions => $_getList(8);

  @$pb.TagNumber(10)
  $pb.PbList<$fixnum.Int64> get identityType => $_getList(9);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
