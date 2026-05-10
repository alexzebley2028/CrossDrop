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

import 'package:protobuf/protobuf.dart' as $pb;

class EndpointType extends $pb.ProtobufEnum {
  static const EndpointType UNKNOWN_ENDPOINT =
      EndpointType._(0, _omitEnumNames ? '' : 'UNKNOWN_ENDPOINT');
  static const EndpointType CONNECTIONS_ENDPOINT =
      EndpointType._(1, _omitEnumNames ? '' : 'CONNECTIONS_ENDPOINT');
  static const EndpointType PRESENCE_ENDPOINT =
      EndpointType._(2, _omitEnumNames ? '' : 'PRESENCE_ENDPOINT');

  static const $core.List<EndpointType> values = <EndpointType>[
    UNKNOWN_ENDPOINT,
    CONNECTIONS_ENDPOINT,
    PRESENCE_ENDPOINT,
  ];

  static final $core.List<EndpointType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static EndpointType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const EndpointType._(super.value, super.name);
}

class OfflineFrame_Version extends $pb.ProtobufEnum {
  static const OfflineFrame_Version UNKNOWN_VERSION =
      OfflineFrame_Version._(0, _omitEnumNames ? '' : 'UNKNOWN_VERSION');
  static const OfflineFrame_Version V1 =
      OfflineFrame_Version._(1, _omitEnumNames ? '' : 'V1');

  static const $core.List<OfflineFrame_Version> values = <OfflineFrame_Version>[
    UNKNOWN_VERSION,
    V1,
  ];

  static final $core.List<OfflineFrame_Version?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static OfflineFrame_Version? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const OfflineFrame_Version._(super.value, super.name);
}

class V1Frame_FrameType extends $pb.ProtobufEnum {
  static const V1Frame_FrameType UNKNOWN_FRAME_TYPE =
      V1Frame_FrameType._(0, _omitEnumNames ? '' : 'UNKNOWN_FRAME_TYPE');
  static const V1Frame_FrameType CONNECTION_REQUEST =
      V1Frame_FrameType._(1, _omitEnumNames ? '' : 'CONNECTION_REQUEST');
  static const V1Frame_FrameType CONNECTION_RESPONSE =
      V1Frame_FrameType._(2, _omitEnumNames ? '' : 'CONNECTION_RESPONSE');
  static const V1Frame_FrameType PAYLOAD_TRANSFER =
      V1Frame_FrameType._(3, _omitEnumNames ? '' : 'PAYLOAD_TRANSFER');
  static const V1Frame_FrameType BANDWIDTH_UPGRADE_NEGOTIATION =
      V1Frame_FrameType._(
          4, _omitEnumNames ? '' : 'BANDWIDTH_UPGRADE_NEGOTIATION');
  static const V1Frame_FrameType KEEP_ALIVE =
      V1Frame_FrameType._(5, _omitEnumNames ? '' : 'KEEP_ALIVE');
  static const V1Frame_FrameType DISCONNECTION =
      V1Frame_FrameType._(6, _omitEnumNames ? '' : 'DISCONNECTION');
  static const V1Frame_FrameType PAIRED_KEY_ENCRYPTION =
      V1Frame_FrameType._(7, _omitEnumNames ? '' : 'PAIRED_KEY_ENCRYPTION');
  static const V1Frame_FrameType AUTHENTICATION_MESSAGE =
      V1Frame_FrameType._(8, _omitEnumNames ? '' : 'AUTHENTICATION_MESSAGE');
  static const V1Frame_FrameType AUTHENTICATION_RESULT =
      V1Frame_FrameType._(9, _omitEnumNames ? '' : 'AUTHENTICATION_RESULT');
  static const V1Frame_FrameType AUTO_RESUME =
      V1Frame_FrameType._(10, _omitEnumNames ? '' : 'AUTO_RESUME');
  static const V1Frame_FrameType AUTO_RECONNECT =
      V1Frame_FrameType._(11, _omitEnumNames ? '' : 'AUTO_RECONNECT');
  static const V1Frame_FrameType BANDWIDTH_UPGRADE_RETRY =
      V1Frame_FrameType._(12, _omitEnumNames ? '' : 'BANDWIDTH_UPGRADE_RETRY');

  static const $core.List<V1Frame_FrameType> values = <V1Frame_FrameType>[
    UNKNOWN_FRAME_TYPE,
    CONNECTION_REQUEST,
    CONNECTION_RESPONSE,
    PAYLOAD_TRANSFER,
    BANDWIDTH_UPGRADE_NEGOTIATION,
    KEEP_ALIVE,
    DISCONNECTION,
    PAIRED_KEY_ENCRYPTION,
    AUTHENTICATION_MESSAGE,
    AUTHENTICATION_RESULT,
    AUTO_RESUME,
    AUTO_RECONNECT,
    BANDWIDTH_UPGRADE_RETRY,
  ];

  static final $core.List<V1Frame_FrameType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 12);
  static V1Frame_FrameType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const V1Frame_FrameType._(super.value, super.name);
}

/// Should always match cs/symbol:location.nearby.proto.connections.Medium
/// LINT.IfChange
class ConnectionRequestFrame_Medium extends $pb.ProtobufEnum {
  static const ConnectionRequestFrame_Medium UNKNOWN_MEDIUM =
      ConnectionRequestFrame_Medium._(
          0, _omitEnumNames ? '' : 'UNKNOWN_MEDIUM');
  @$core.Deprecated('This enum value is deprecated')
  static const ConnectionRequestFrame_Medium MDNS =
      ConnectionRequestFrame_Medium._(1, _omitEnumNames ? '' : 'MDNS');
  static const ConnectionRequestFrame_Medium BLUETOOTH =
      ConnectionRequestFrame_Medium._(2, _omitEnumNames ? '' : 'BLUETOOTH');
  static const ConnectionRequestFrame_Medium WIFI_HOTSPOT =
      ConnectionRequestFrame_Medium._(3, _omitEnumNames ? '' : 'WIFI_HOTSPOT');
  static const ConnectionRequestFrame_Medium BLE =
      ConnectionRequestFrame_Medium._(4, _omitEnumNames ? '' : 'BLE');
  static const ConnectionRequestFrame_Medium WIFI_LAN =
      ConnectionRequestFrame_Medium._(5, _omitEnumNames ? '' : 'WIFI_LAN');
  static const ConnectionRequestFrame_Medium WIFI_AWARE =
      ConnectionRequestFrame_Medium._(6, _omitEnumNames ? '' : 'WIFI_AWARE');
  static const ConnectionRequestFrame_Medium NFC =
      ConnectionRequestFrame_Medium._(7, _omitEnumNames ? '' : 'NFC');
  static const ConnectionRequestFrame_Medium WIFI_DIRECT =
      ConnectionRequestFrame_Medium._(8, _omitEnumNames ? '' : 'WIFI_DIRECT');
  static const ConnectionRequestFrame_Medium WEB_RTC =
      ConnectionRequestFrame_Medium._(9, _omitEnumNames ? '' : 'WEB_RTC');
  static const ConnectionRequestFrame_Medium BLE_L2CAP =
      ConnectionRequestFrame_Medium._(10, _omitEnumNames ? '' : 'BLE_L2CAP');
  static const ConnectionRequestFrame_Medium USB =
      ConnectionRequestFrame_Medium._(11, _omitEnumNames ? '' : 'USB');
  static const ConnectionRequestFrame_Medium WEB_RTC_NON_CELLULAR =
      ConnectionRequestFrame_Medium._(
          12, _omitEnumNames ? '' : 'WEB_RTC_NON_CELLULAR');
  static const ConnectionRequestFrame_Medium AWDL =
      ConnectionRequestFrame_Medium._(13, _omitEnumNames ? '' : 'AWDL');

  static const $core.List<ConnectionRequestFrame_Medium> values =
      <ConnectionRequestFrame_Medium>[
    UNKNOWN_MEDIUM,
    MDNS,
    BLUETOOTH,
    WIFI_HOTSPOT,
    BLE,
    WIFI_LAN,
    WIFI_AWARE,
    NFC,
    WIFI_DIRECT,
    WEB_RTC,
    BLE_L2CAP,
    USB,
    WEB_RTC_NON_CELLULAR,
    AWDL,
  ];

  static final $core.List<ConnectionRequestFrame_Medium?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 13);
  static ConnectionRequestFrame_Medium? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ConnectionRequestFrame_Medium._(super.value, super.name);
}

/// LINT.IfChange
class ConnectionRequestFrame_ConnectionMode extends $pb.ProtobufEnum {
  static const ConnectionRequestFrame_ConnectionMode LEGACY =
      ConnectionRequestFrame_ConnectionMode._(
          0, _omitEnumNames ? '' : 'LEGACY');
  static const ConnectionRequestFrame_ConnectionMode INSTANT =
      ConnectionRequestFrame_ConnectionMode._(
          1, _omitEnumNames ? '' : 'INSTANT');

  static const $core.List<ConnectionRequestFrame_ConnectionMode> values =
      <ConnectionRequestFrame_ConnectionMode>[
    LEGACY,
    INSTANT,
  ];

  static final $core.List<ConnectionRequestFrame_ConnectionMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ConnectionRequestFrame_ConnectionMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ConnectionRequestFrame_ConnectionMode._(super.value, super.name);
}

/// Used to replace the status integer parameter with a meaningful enum item.
/// Map ConnectionsStatusCodes.STATUS_OK to ACCEPT and
/// ConnectionsStatusCodes.STATUS_CONNECTION_REJECTED to REJECT.
/// Flag: connection_replace_status_with_response_connectionResponseFrame
class ConnectionResponseFrame_ResponseStatus extends $pb.ProtobufEnum {
  static const ConnectionResponseFrame_ResponseStatus UNKNOWN_RESPONSE_STATUS =
      ConnectionResponseFrame_ResponseStatus._(
          0, _omitEnumNames ? '' : 'UNKNOWN_RESPONSE_STATUS');
  static const ConnectionResponseFrame_ResponseStatus ACCEPT =
      ConnectionResponseFrame_ResponseStatus._(
          1, _omitEnumNames ? '' : 'ACCEPT');
  static const ConnectionResponseFrame_ResponseStatus REJECT =
      ConnectionResponseFrame_ResponseStatus._(
          2, _omitEnumNames ? '' : 'REJECT');

  static const $core.List<ConnectionResponseFrame_ResponseStatus> values =
      <ConnectionResponseFrame_ResponseStatus>[
    UNKNOWN_RESPONSE_STATUS,
    ACCEPT,
    REJECT,
  ];

  static final $core.List<ConnectionResponseFrame_ResponseStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ConnectionResponseFrame_ResponseStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ConnectionResponseFrame_ResponseStatus._(super.value, super.name);
}

class PayloadTransferFrame_PacketType extends $pb.ProtobufEnum {
  static const PayloadTransferFrame_PacketType UNKNOWN_PACKET_TYPE =
      PayloadTransferFrame_PacketType._(
          0, _omitEnumNames ? '' : 'UNKNOWN_PACKET_TYPE');
  static const PayloadTransferFrame_PacketType DATA =
      PayloadTransferFrame_PacketType._(1, _omitEnumNames ? '' : 'DATA');
  static const PayloadTransferFrame_PacketType CONTROL =
      PayloadTransferFrame_PacketType._(2, _omitEnumNames ? '' : 'CONTROL');
  static const PayloadTransferFrame_PacketType PAYLOAD_ACK =
      PayloadTransferFrame_PacketType._(3, _omitEnumNames ? '' : 'PAYLOAD_ACK');

  static const $core.List<PayloadTransferFrame_PacketType> values =
      <PayloadTransferFrame_PacketType>[
    UNKNOWN_PACKET_TYPE,
    DATA,
    CONTROL,
    PAYLOAD_ACK,
  ];

  static final $core.List<PayloadTransferFrame_PacketType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static PayloadTransferFrame_PacketType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PayloadTransferFrame_PacketType._(super.value, super.name);
}

class PayloadTransferFrame_PayloadHeader_PayloadType extends $pb.ProtobufEnum {
  static const PayloadTransferFrame_PayloadHeader_PayloadType
      UNKNOWN_PAYLOAD_TYPE = PayloadTransferFrame_PayloadHeader_PayloadType._(
          0, _omitEnumNames ? '' : 'UNKNOWN_PAYLOAD_TYPE');
  static const PayloadTransferFrame_PayloadHeader_PayloadType BYTES =
      PayloadTransferFrame_PayloadHeader_PayloadType._(
          1, _omitEnumNames ? '' : 'BYTES');
  static const PayloadTransferFrame_PayloadHeader_PayloadType FILE =
      PayloadTransferFrame_PayloadHeader_PayloadType._(
          2, _omitEnumNames ? '' : 'FILE');
  static const PayloadTransferFrame_PayloadHeader_PayloadType STREAM =
      PayloadTransferFrame_PayloadHeader_PayloadType._(
          3, _omitEnumNames ? '' : 'STREAM');

  static const $core.List<PayloadTransferFrame_PayloadHeader_PayloadType>
      values = <PayloadTransferFrame_PayloadHeader_PayloadType>[
    UNKNOWN_PAYLOAD_TYPE,
    BYTES,
    FILE,
    STREAM,
  ];

  static final $core.List<PayloadTransferFrame_PayloadHeader_PayloadType?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 3);
  static PayloadTransferFrame_PayloadHeader_PayloadType? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PayloadTransferFrame_PayloadHeader_PayloadType._(
      super.value, super.name);
}

class PayloadTransferFrame_PayloadChunk_Flags extends $pb.ProtobufEnum {
  static const PayloadTransferFrame_PayloadChunk_Flags LAST_CHUNK =
      PayloadTransferFrame_PayloadChunk_Flags._(
          1, _omitEnumNames ? '' : 'LAST_CHUNK');

  static const $core.List<PayloadTransferFrame_PayloadChunk_Flags> values =
      <PayloadTransferFrame_PayloadChunk_Flags>[
    LAST_CHUNK,
  ];

  static final $core.Map<$core.int, PayloadTransferFrame_PayloadChunk_Flags>
      _byValue = $pb.ProtobufEnum.initByValue(values);
  static PayloadTransferFrame_PayloadChunk_Flags? valueOf($core.int value) =>
      _byValue[value];

  const PayloadTransferFrame_PayloadChunk_Flags._(super.value, super.name);
}

class PayloadTransferFrame_ControlMessage_EventType extends $pb.ProtobufEnum {
  static const PayloadTransferFrame_ControlMessage_EventType
      UNKNOWN_EVENT_TYPE = PayloadTransferFrame_ControlMessage_EventType._(
          0, _omitEnumNames ? '' : 'UNKNOWN_EVENT_TYPE');
  static const PayloadTransferFrame_ControlMessage_EventType PAYLOAD_ERROR =
      PayloadTransferFrame_ControlMessage_EventType._(
          1, _omitEnumNames ? '' : 'PAYLOAD_ERROR');
  static const PayloadTransferFrame_ControlMessage_EventType PAYLOAD_CANCELED =
      PayloadTransferFrame_ControlMessage_EventType._(
          2, _omitEnumNames ? '' : 'PAYLOAD_CANCELED');

  /// Use PacketType.PAYLOAD_ACK instead
  @$core.Deprecated('This enum value is deprecated')
  static const PayloadTransferFrame_ControlMessage_EventType
      PAYLOAD_RECEIVED_ACK = PayloadTransferFrame_ControlMessage_EventType._(
          3, _omitEnumNames ? '' : 'PAYLOAD_RECEIVED_ACK');

  static const $core.List<PayloadTransferFrame_ControlMessage_EventType>
      values = <PayloadTransferFrame_ControlMessage_EventType>[
    UNKNOWN_EVENT_TYPE,
    PAYLOAD_ERROR,
    PAYLOAD_CANCELED,
    PAYLOAD_RECEIVED_ACK,
  ];

  static final $core.List<PayloadTransferFrame_ControlMessage_EventType?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 3);
  static PayloadTransferFrame_ControlMessage_EventType? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PayloadTransferFrame_ControlMessage_EventType._(
      super.value, super.name);
}

class BandwidthUpgradeNegotiationFrame_EventType extends $pb.ProtobufEnum {
  static const BandwidthUpgradeNegotiationFrame_EventType UNKNOWN_EVENT_TYPE =
      BandwidthUpgradeNegotiationFrame_EventType._(
          0, _omitEnumNames ? '' : 'UNKNOWN_EVENT_TYPE');
  static const BandwidthUpgradeNegotiationFrame_EventType
      UPGRADE_PATH_AVAILABLE = BandwidthUpgradeNegotiationFrame_EventType._(
          1, _omitEnumNames ? '' : 'UPGRADE_PATH_AVAILABLE');
  static const BandwidthUpgradeNegotiationFrame_EventType
      LAST_WRITE_TO_PRIOR_CHANNEL =
      BandwidthUpgradeNegotiationFrame_EventType._(
          2, _omitEnumNames ? '' : 'LAST_WRITE_TO_PRIOR_CHANNEL');
  static const BandwidthUpgradeNegotiationFrame_EventType
      SAFE_TO_CLOSE_PRIOR_CHANNEL =
      BandwidthUpgradeNegotiationFrame_EventType._(
          3, _omitEnumNames ? '' : 'SAFE_TO_CLOSE_PRIOR_CHANNEL');
  static const BandwidthUpgradeNegotiationFrame_EventType CLIENT_INTRODUCTION =
      BandwidthUpgradeNegotiationFrame_EventType._(
          4, _omitEnumNames ? '' : 'CLIENT_INTRODUCTION');
  static const BandwidthUpgradeNegotiationFrame_EventType UPGRADE_FAILURE =
      BandwidthUpgradeNegotiationFrame_EventType._(
          5, _omitEnumNames ? '' : 'UPGRADE_FAILURE');
  static const BandwidthUpgradeNegotiationFrame_EventType
      CLIENT_INTRODUCTION_ACK = BandwidthUpgradeNegotiationFrame_EventType._(
          6, _omitEnumNames ? '' : 'CLIENT_INTRODUCTION_ACK');

  /// The event type that requires the remote device to send the available
  /// upgrade path.
  static const BandwidthUpgradeNegotiationFrame_EventType UPGRADE_PATH_REQUEST =
      BandwidthUpgradeNegotiationFrame_EventType._(
          7, _omitEnumNames ? '' : 'UPGRADE_PATH_REQUEST');

  static const $core.List<BandwidthUpgradeNegotiationFrame_EventType> values =
      <BandwidthUpgradeNegotiationFrame_EventType>[
    UNKNOWN_EVENT_TYPE,
    UPGRADE_PATH_AVAILABLE,
    LAST_WRITE_TO_PRIOR_CHANNEL,
    SAFE_TO_CLOSE_PRIOR_CHANNEL,
    CLIENT_INTRODUCTION,
    UPGRADE_FAILURE,
    CLIENT_INTRODUCTION_ACK,
    UPGRADE_PATH_REQUEST,
  ];

  static final $core.List<BandwidthUpgradeNegotiationFrame_EventType?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 7);
  static BandwidthUpgradeNegotiationFrame_EventType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BandwidthUpgradeNegotiationFrame_EventType._(super.value, super.name);
}

/// Should always match cs/symbol:location.nearby.proto.connections.Medium
class BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium
    extends $pb.ProtobufEnum {
  static const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium
      UNKNOWN_MEDIUM =
      BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium._(
          0, _omitEnumNames ? '' : 'UNKNOWN_MEDIUM');
  @$core.Deprecated('This enum value is deprecated')
  static const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium MDNS =
      BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium._(
          1, _omitEnumNames ? '' : 'MDNS');
  static const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium
      BLUETOOTH = BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium._(
          2, _omitEnumNames ? '' : 'BLUETOOTH');
  static const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium
      WIFI_HOTSPOT = BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium._(
          3, _omitEnumNames ? '' : 'WIFI_HOTSPOT');
  static const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium BLE =
      BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium._(
          4, _omitEnumNames ? '' : 'BLE');
  static const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium
      WIFI_LAN = BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium._(
          5, _omitEnumNames ? '' : 'WIFI_LAN');
  static const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium
      WIFI_AWARE = BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium._(
          6, _omitEnumNames ? '' : 'WIFI_AWARE');
  static const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium NFC =
      BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium._(
          7, _omitEnumNames ? '' : 'NFC');
  static const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium
      WIFI_DIRECT = BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium._(
          8, _omitEnumNames ? '' : 'WIFI_DIRECT');
  static const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium WEB_RTC =
      BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium._(
          9, _omitEnumNames ? '' : 'WEB_RTC');

  /// 10 is reserved.
  static const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium USB =
      BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium._(
          11, _omitEnumNames ? '' : 'USB');
  static const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium
      WEB_RTC_NON_CELLULAR =
      BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium._(
          12, _omitEnumNames ? '' : 'WEB_RTC_NON_CELLULAR');
  static const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium AWDL =
      BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium._(
          13, _omitEnumNames ? '' : 'AWDL');

  static const $core
      .List<BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium>
      values = <BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium>[
    UNKNOWN_MEDIUM,
    MDNS,
    BLUETOOTH,
    WIFI_HOTSPOT,
    BLE,
    WIFI_LAN,
    WIFI_AWARE,
    NFC,
    WIFI_DIRECT,
    WEB_RTC,
    USB,
    WEB_RTC_NON_CELLULAR,
    AWDL,
  ];

  static final $core
      .List<BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 13);
  static BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium._(
      super.value, super.name);
}

/// Should always match cs/symbol:location.nearby.proto.connections.Medium
/// LINT.IfChange
class BandwidthUpgradeRetryFrame_Medium extends $pb.ProtobufEnum {
  static const BandwidthUpgradeRetryFrame_Medium UNKNOWN_MEDIUM =
      BandwidthUpgradeRetryFrame_Medium._(
          0, _omitEnumNames ? '' : 'UNKNOWN_MEDIUM');

  /// 1 is reserved.
  static const BandwidthUpgradeRetryFrame_Medium BLUETOOTH =
      BandwidthUpgradeRetryFrame_Medium._(2, _omitEnumNames ? '' : 'BLUETOOTH');
  static const BandwidthUpgradeRetryFrame_Medium WIFI_HOTSPOT =
      BandwidthUpgradeRetryFrame_Medium._(
          3, _omitEnumNames ? '' : 'WIFI_HOTSPOT');
  static const BandwidthUpgradeRetryFrame_Medium BLE =
      BandwidthUpgradeRetryFrame_Medium._(4, _omitEnumNames ? '' : 'BLE');
  static const BandwidthUpgradeRetryFrame_Medium WIFI_LAN =
      BandwidthUpgradeRetryFrame_Medium._(5, _omitEnumNames ? '' : 'WIFI_LAN');
  static const BandwidthUpgradeRetryFrame_Medium WIFI_AWARE =
      BandwidthUpgradeRetryFrame_Medium._(
          6, _omitEnumNames ? '' : 'WIFI_AWARE');
  static const BandwidthUpgradeRetryFrame_Medium NFC =
      BandwidthUpgradeRetryFrame_Medium._(7, _omitEnumNames ? '' : 'NFC');
  static const BandwidthUpgradeRetryFrame_Medium WIFI_DIRECT =
      BandwidthUpgradeRetryFrame_Medium._(
          8, _omitEnumNames ? '' : 'WIFI_DIRECT');
  static const BandwidthUpgradeRetryFrame_Medium WEB_RTC =
      BandwidthUpgradeRetryFrame_Medium._(9, _omitEnumNames ? '' : 'WEB_RTC');
  static const BandwidthUpgradeRetryFrame_Medium BLE_L2CAP =
      BandwidthUpgradeRetryFrame_Medium._(
          10, _omitEnumNames ? '' : 'BLE_L2CAP');
  static const BandwidthUpgradeRetryFrame_Medium USB =
      BandwidthUpgradeRetryFrame_Medium._(11, _omitEnumNames ? '' : 'USB');
  static const BandwidthUpgradeRetryFrame_Medium WEB_RTC_NON_CELLULAR =
      BandwidthUpgradeRetryFrame_Medium._(
          12, _omitEnumNames ? '' : 'WEB_RTC_NON_CELLULAR');
  static const BandwidthUpgradeRetryFrame_Medium AWDL =
      BandwidthUpgradeRetryFrame_Medium._(13, _omitEnumNames ? '' : 'AWDL');

  static const $core.List<BandwidthUpgradeRetryFrame_Medium> values =
      <BandwidthUpgradeRetryFrame_Medium>[
    UNKNOWN_MEDIUM,
    BLUETOOTH,
    WIFI_HOTSPOT,
    BLE,
    WIFI_LAN,
    WIFI_AWARE,
    NFC,
    WIFI_DIRECT,
    WEB_RTC,
    BLE_L2CAP,
    USB,
    WEB_RTC_NON_CELLULAR,
    AWDL,
  ];

  static final $core.List<BandwidthUpgradeRetryFrame_Medium?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 13);
  static BandwidthUpgradeRetryFrame_Medium? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BandwidthUpgradeRetryFrame_Medium._(super.value, super.name);
}

class AutoResumeFrame_EventType extends $pb.ProtobufEnum {
  static const AutoResumeFrame_EventType UNKNOWN_AUTO_RESUME_EVENT_TYPE =
      AutoResumeFrame_EventType._(
          0, _omitEnumNames ? '' : 'UNKNOWN_AUTO_RESUME_EVENT_TYPE');
  static const AutoResumeFrame_EventType PAYLOAD_RESUME_TRANSFER_START =
      AutoResumeFrame_EventType._(
          1, _omitEnumNames ? '' : 'PAYLOAD_RESUME_TRANSFER_START');
  static const AutoResumeFrame_EventType PAYLOAD_RESUME_TRANSFER_ACK =
      AutoResumeFrame_EventType._(
          2, _omitEnumNames ? '' : 'PAYLOAD_RESUME_TRANSFER_ACK');

  static const $core.List<AutoResumeFrame_EventType> values =
      <AutoResumeFrame_EventType>[
    UNKNOWN_AUTO_RESUME_EVENT_TYPE,
    PAYLOAD_RESUME_TRANSFER_START,
    PAYLOAD_RESUME_TRANSFER_ACK,
  ];

  static final $core.List<AutoResumeFrame_EventType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static AutoResumeFrame_EventType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AutoResumeFrame_EventType._(super.value, super.name);
}

class AutoReconnectFrame_EventType extends $pb.ProtobufEnum {
  static const AutoReconnectFrame_EventType UNKNOWN_EVENT_TYPE =
      AutoReconnectFrame_EventType._(
          0, _omitEnumNames ? '' : 'UNKNOWN_EVENT_TYPE');
  static const AutoReconnectFrame_EventType CLIENT_INTRODUCTION =
      AutoReconnectFrame_EventType._(
          1, _omitEnumNames ? '' : 'CLIENT_INTRODUCTION');
  static const AutoReconnectFrame_EventType CLIENT_INTRODUCTION_ACK =
      AutoReconnectFrame_EventType._(
          2, _omitEnumNames ? '' : 'CLIENT_INTRODUCTION_ACK');

  static const $core.List<AutoReconnectFrame_EventType> values =
      <AutoReconnectFrame_EventType>[
    UNKNOWN_EVENT_TYPE,
    CLIENT_INTRODUCTION,
    CLIENT_INTRODUCTION_ACK,
  ];

  static final $core.List<AutoReconnectFrame_EventType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static AutoReconnectFrame_EventType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AutoReconnectFrame_EventType._(super.value, super.name);
}

/// Should always match
/// cs/symbol:location.nearby.proto.connections.WifiDirectAuthType
/// LINT.IfChange
class MediumMetadata_WifiDirectAuthType extends $pb.ProtobufEnum {
  static const MediumMetadata_WifiDirectAuthType WIFI_DIRECT_TYPE_UNKNOWN =
      MediumMetadata_WifiDirectAuthType._(
          0, _omitEnumNames ? '' : 'WIFI_DIRECT_TYPE_UNKNOWN');

  /// WifiDirect type that uses ssid/password for authentication. Android
  /// supports this type, but Windows does not.
  static const MediumMetadata_WifiDirectAuthType WIFI_DIRECT_WITH_PASSWORD =
      MediumMetadata_WifiDirectAuthType._(
          1, _omitEnumNames ? '' : 'WIFI_DIRECT_WITH_PASSWORD');

  /// WifiDirect type that uses service_name/pin for authentication. Android
  /// and Windows both support this type.
  static const MediumMetadata_WifiDirectAuthType WIFI_DIRECT_WITH_PIN =
      MediumMetadata_WifiDirectAuthType._(
          2, _omitEnumNames ? '' : 'WIFI_DIRECT_WITH_PIN');

  static const $core.List<MediumMetadata_WifiDirectAuthType> values =
      <MediumMetadata_WifiDirectAuthType>[
    WIFI_DIRECT_TYPE_UNKNOWN,
    WIFI_DIRECT_WITH_PASSWORD,
    WIFI_DIRECT_WITH_PIN,
  ];

  static final $core.List<MediumMetadata_WifiDirectAuthType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static MediumMetadata_WifiDirectAuthType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MediumMetadata_WifiDirectAuthType._(super.value, super.name);
}

class LocationStandard_Format extends $pb.ProtobufEnum {
  static const LocationStandard_Format UNKNOWN =
      LocationStandard_Format._(0, _omitEnumNames ? '' : 'UNKNOWN');

  /// E164 country codes:
  /// https://en.wikipedia.org/wiki/List_of_country_calling_codes
  /// e.g. +1 for USA
  static const LocationStandard_Format E164_CALLING =
      LocationStandard_Format._(1, _omitEnumNames ? '' : 'E164_CALLING');

  /// ISO 3166-1 alpha-2 country codes:
  /// https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
  static const LocationStandard_Format ISO_3166_1_ALPHA_2 =
      LocationStandard_Format._(2, _omitEnumNames ? '' : 'ISO_3166_1_ALPHA_2');

  static const $core.List<LocationStandard_Format> values =
      <LocationStandard_Format>[
    UNKNOWN,
    E164_CALLING,
    ISO_3166_1_ALPHA_2,
  ];

  static final $core.List<LocationStandard_Format?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static LocationStandard_Format? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const LocationStandard_Format._(super.value, super.name);
}

class OsInfo_OsType extends $pb.ProtobufEnum {
  static const OsInfo_OsType UNKNOWN_OS_TYPE =
      OsInfo_OsType._(0, _omitEnumNames ? '' : 'UNKNOWN_OS_TYPE');
  static const OsInfo_OsType ANDROID =
      OsInfo_OsType._(1, _omitEnumNames ? '' : 'ANDROID');
  static const OsInfo_OsType CHROME_OS =
      OsInfo_OsType._(2, _omitEnumNames ? '' : 'CHROME_OS');
  static const OsInfo_OsType WINDOWS =
      OsInfo_OsType._(3, _omitEnumNames ? '' : 'WINDOWS');
  static const OsInfo_OsType APPLE =
      OsInfo_OsType._(4, _omitEnumNames ? '' : 'APPLE');
  static const OsInfo_OsType LINUX =
      OsInfo_OsType._(100, _omitEnumNames ? '' : 'LINUX');

  static const $core.List<OsInfo_OsType> values = <OsInfo_OsType>[
    UNKNOWN_OS_TYPE,
    ANDROID,
    CHROME_OS,
    WINDOWS,
    APPLE,
    LINUX,
  ];

  static final $core.Map<$core.int, OsInfo_OsType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static OsInfo_OsType? valueOf($core.int value) => _byValue[value];

  const OsInfo_OsType._(super.value, super.name);
}

class PresenceDevice_DeviceType extends $pb.ProtobufEnum {
  static const PresenceDevice_DeviceType UNKNOWN =
      PresenceDevice_DeviceType._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const PresenceDevice_DeviceType PHONE =
      PresenceDevice_DeviceType._(1, _omitEnumNames ? '' : 'PHONE');
  static const PresenceDevice_DeviceType TABLET =
      PresenceDevice_DeviceType._(2, _omitEnumNames ? '' : 'TABLET');
  static const PresenceDevice_DeviceType DISPLAY =
      PresenceDevice_DeviceType._(3, _omitEnumNames ? '' : 'DISPLAY');
  static const PresenceDevice_DeviceType LAPTOP =
      PresenceDevice_DeviceType._(4, _omitEnumNames ? '' : 'LAPTOP');
  static const PresenceDevice_DeviceType TV =
      PresenceDevice_DeviceType._(5, _omitEnumNames ? '' : 'TV');
  static const PresenceDevice_DeviceType WATCH =
      PresenceDevice_DeviceType._(6, _omitEnumNames ? '' : 'WATCH');

  static const $core.List<PresenceDevice_DeviceType> values =
      <PresenceDevice_DeviceType>[
    UNKNOWN,
    PHONE,
    TABLET,
    DISPLAY,
    LAPTOP,
    TV,
    WATCH,
  ];

  static final $core.List<PresenceDevice_DeviceType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static PresenceDevice_DeviceType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PresenceDevice_DeviceType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
