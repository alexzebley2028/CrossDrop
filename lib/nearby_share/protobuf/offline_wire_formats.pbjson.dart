// This is a generated file - do not edit.
//
// Generated from offline_wire_formats.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use endpointTypeDescriptor instead')
const EndpointType$json = {
  '1': 'EndpointType',
  '2': [
    {'1': 'UNKNOWN_ENDPOINT', '2': 0},
    {'1': 'CONNECTIONS_ENDPOINT', '2': 1},
    {'1': 'PRESENCE_ENDPOINT', '2': 2},
  ],
};

/// Descriptor for `EndpointType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List endpointTypeDescriptor = $convert.base64Decode(
    'CgxFbmRwb2ludFR5cGUSFAoQVU5LTk9XTl9FTkRQT0lOVBAAEhgKFENPTk5FQ1RJT05TX0VORF'
    'BPSU5UEAESFQoRUFJFU0VOQ0VfRU5EUE9JTlQQAg==');

@$core.Deprecated('Use offlineFrameDescriptor instead')
const OfflineFrame$json = {
  '1': 'OfflineFrame',
  '2': [
    {
      '1': 'version',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.location.nearby.connections.OfflineFrame.Version',
      '10': 'version'
    },
    {
      '1': 'v1',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.V1Frame',
      '10': 'v1'
    },
  ],
  '4': [OfflineFrame_Version$json],
};

@$core.Deprecated('Use offlineFrameDescriptor instead')
const OfflineFrame_Version$json = {
  '1': 'Version',
  '2': [
    {'1': 'UNKNOWN_VERSION', '2': 0},
    {'1': 'V1', '2': 1},
  ],
};

/// Descriptor for `OfflineFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List offlineFrameDescriptor = $convert.base64Decode(
    'CgxPZmZsaW5lRnJhbWUSSwoHdmVyc2lvbhgBIAEoDjIxLmxvY2F0aW9uLm5lYXJieS5jb25uZW'
    'N0aW9ucy5PZmZsaW5lRnJhbWUuVmVyc2lvblIHdmVyc2lvbhI0CgJ2MRgCIAEoCzIkLmxvY2F0'
    'aW9uLm5lYXJieS5jb25uZWN0aW9ucy5WMUZyYW1lUgJ2MSImCgdWZXJzaW9uEhMKD1VOS05PV0'
    '5fVkVSU0lPThAAEgYKAlYxEAE=');

@$core.Deprecated('Use v1FrameDescriptor instead')
const V1Frame$json = {
  '1': 'V1Frame',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.location.nearby.connections.V1Frame.FrameType',
      '10': 'type'
    },
    {
      '1': 'connection_request',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.ConnectionRequestFrame',
      '10': 'connectionRequest'
    },
    {
      '1': 'connection_response',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.ConnectionResponseFrame',
      '10': 'connectionResponse'
    },
    {
      '1': 'payload_transfer',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.PayloadTransferFrame',
      '10': 'payloadTransfer'
    },
    {
      '1': 'bandwidth_upgrade_negotiation',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.BandwidthUpgradeNegotiationFrame',
      '10': 'bandwidthUpgradeNegotiation'
    },
    {
      '1': 'keep_alive',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.KeepAliveFrame',
      '10': 'keepAlive'
    },
    {
      '1': 'disconnection',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.DisconnectionFrame',
      '10': 'disconnection'
    },
    {
      '1': 'paired_key_encryption',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.PairedKeyEncryptionFrame',
      '10': 'pairedKeyEncryption'
    },
    {
      '1': 'authentication_message',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.AuthenticationMessageFrame',
      '10': 'authenticationMessage'
    },
    {
      '1': 'authentication_result',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.AuthenticationResultFrame',
      '10': 'authenticationResult'
    },
    {
      '1': 'auto_resume',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.AutoResumeFrame',
      '10': 'autoResume'
    },
    {
      '1': 'auto_reconnect',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.AutoReconnectFrame',
      '10': 'autoReconnect'
    },
    {
      '1': 'bandwidth_upgrade_retry',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.BandwidthUpgradeRetryFrame',
      '10': 'bandwidthUpgradeRetry'
    },
  ],
  '4': [V1Frame_FrameType$json],
};

@$core.Deprecated('Use v1FrameDescriptor instead')
const V1Frame_FrameType$json = {
  '1': 'FrameType',
  '2': [
    {'1': 'UNKNOWN_FRAME_TYPE', '2': 0},
    {'1': 'CONNECTION_REQUEST', '2': 1},
    {'1': 'CONNECTION_RESPONSE', '2': 2},
    {'1': 'PAYLOAD_TRANSFER', '2': 3},
    {'1': 'BANDWIDTH_UPGRADE_NEGOTIATION', '2': 4},
    {'1': 'KEEP_ALIVE', '2': 5},
    {'1': 'DISCONNECTION', '2': 6},
    {'1': 'PAIRED_KEY_ENCRYPTION', '2': 7},
    {'1': 'AUTHENTICATION_MESSAGE', '2': 8},
    {'1': 'AUTHENTICATION_RESULT', '2': 9},
    {'1': 'AUTO_RESUME', '2': 10},
    {'1': 'AUTO_RECONNECT', '2': 11},
    {'1': 'BANDWIDTH_UPGRADE_RETRY', '2': 12},
  ],
};

/// Descriptor for `V1Frame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List v1FrameDescriptor = $convert.base64Decode(
    'CgdWMUZyYW1lEkIKBHR5cGUYASABKA4yLi5sb2NhdGlvbi5uZWFyYnkuY29ubmVjdGlvbnMuVj'
    'FGcmFtZS5GcmFtZVR5cGVSBHR5cGUSYgoSY29ubmVjdGlvbl9yZXF1ZXN0GAIgASgLMjMubG9j'
    'YXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLkNvbm5lY3Rpb25SZXF1ZXN0RnJhbWVSEWNvbm5lY3'
    'Rpb25SZXF1ZXN0EmUKE2Nvbm5lY3Rpb25fcmVzcG9uc2UYAyABKAsyNC5sb2NhdGlvbi5uZWFy'
    'YnkuY29ubmVjdGlvbnMuQ29ubmVjdGlvblJlc3BvbnNlRnJhbWVSEmNvbm5lY3Rpb25SZXNwb2'
    '5zZRJcChBwYXlsb2FkX3RyYW5zZmVyGAQgASgLMjEubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rp'
    'b25zLlBheWxvYWRUcmFuc2ZlckZyYW1lUg9wYXlsb2FkVHJhbnNmZXISgQEKHWJhbmR3aWR0aF'
    '91cGdyYWRlX25lZ290aWF0aW9uGAUgASgLMj0ubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25z'
    'LkJhbmR3aWR0aFVwZ3JhZGVOZWdvdGlhdGlvbkZyYW1lUhtiYW5kd2lkdGhVcGdyYWRlTmVnb3'
    'RpYXRpb24SSgoKa2VlcF9hbGl2ZRgGIAEoCzIrLmxvY2F0aW9uLm5lYXJieS5jb25uZWN0aW9u'
    'cy5LZWVwQWxpdmVGcmFtZVIJa2VlcEFsaXZlElUKDWRpc2Nvbm5lY3Rpb24YByABKAsyLy5sb2'
    'NhdGlvbi5uZWFyYnkuY29ubmVjdGlvbnMuRGlzY29ubmVjdGlvbkZyYW1lUg1kaXNjb25uZWN0'
    'aW9uEmkKFXBhaXJlZF9rZXlfZW5jcnlwdGlvbhgIIAEoCzI1LmxvY2F0aW9uLm5lYXJieS5jb2'
    '5uZWN0aW9ucy5QYWlyZWRLZXlFbmNyeXB0aW9uRnJhbWVSE3BhaXJlZEtleUVuY3J5cHRpb24S'
    'bgoWYXV0aGVudGljYXRpb25fbWVzc2FnZRgJIAEoCzI3LmxvY2F0aW9uLm5lYXJieS5jb25uZW'
    'N0aW9ucy5BdXRoZW50aWNhdGlvbk1lc3NhZ2VGcmFtZVIVYXV0aGVudGljYXRpb25NZXNzYWdl'
    'EmsKFWF1dGhlbnRpY2F0aW9uX3Jlc3VsdBgKIAEoCzI2LmxvY2F0aW9uLm5lYXJieS5jb25uZW'
    'N0aW9ucy5BdXRoZW50aWNhdGlvblJlc3VsdEZyYW1lUhRhdXRoZW50aWNhdGlvblJlc3VsdBJN'
    'CgthdXRvX3Jlc3VtZRgLIAEoCzIsLmxvY2F0aW9uLm5lYXJieS5jb25uZWN0aW9ucy5BdXRvUm'
    'VzdW1lRnJhbWVSCmF1dG9SZXN1bWUSVgoOYXV0b19yZWNvbm5lY3QYDCABKAsyLy5sb2NhdGlv'
    'bi5uZWFyYnkuY29ubmVjdGlvbnMuQXV0b1JlY29ubmVjdEZyYW1lUg1hdXRvUmVjb25uZWN0Em'
    '8KF2JhbmR3aWR0aF91cGdyYWRlX3JldHJ5GA0gASgLMjcubG9jYXRpb24ubmVhcmJ5LmNvbm5l'
    'Y3Rpb25zLkJhbmR3aWR0aFVwZ3JhZGVSZXRyeUZyYW1lUhViYW5kd2lkdGhVcGdyYWRlUmV0cn'
    'kixAIKCUZyYW1lVHlwZRIWChJVTktOT1dOX0ZSQU1FX1RZUEUQABIWChJDT05ORUNUSU9OX1JF'
    'UVVFU1QQARIXChNDT05ORUNUSU9OX1JFU1BPTlNFEAISFAoQUEFZTE9BRF9UUkFOU0ZFUhADEi'
    'EKHUJBTkRXSURUSF9VUEdSQURFX05FR09USUFUSU9OEAQSDgoKS0VFUF9BTElWRRAFEhEKDURJ'
    'U0NPTk5FQ1RJT04QBhIZChVQQUlSRURfS0VZX0VOQ1JZUFRJT04QBxIaChZBVVRIRU5USUNBVE'
    'lPTl9NRVNTQUdFEAgSGQoVQVVUSEVOVElDQVRJT05fUkVTVUxUEAkSDwoLQVVUT19SRVNVTUUQ'
    'ChISCg5BVVRPX1JFQ09OTkVDVBALEhsKF0JBTkRXSURUSF9VUEdSQURFX1JFVFJZEAw=');

@$core.Deprecated('Use connectionRequestFrameDescriptor instead')
const ConnectionRequestFrame$json = {
  '1': 'ConnectionRequestFrame',
  '2': [
    {'1': 'endpoint_id', '3': 1, '4': 1, '5': 9, '10': 'endpointId'},
    {'1': 'endpoint_name', '3': 2, '4': 1, '5': 9, '10': 'endpointName'},
    {'1': 'handshake_data', '3': 3, '4': 1, '5': 12, '10': 'handshakeData'},
    {'1': 'nonce', '3': 4, '4': 1, '5': 5, '10': 'nonce'},
    {
      '1': 'mediums',
      '3': 5,
      '4': 3,
      '5': 14,
      '6': '.location.nearby.connections.ConnectionRequestFrame.Medium',
      '10': 'mediums'
    },
    {'1': 'endpoint_info', '3': 6, '4': 1, '5': 12, '10': 'endpointInfo'},
    {
      '1': 'medium_metadata',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.MediumMetadata',
      '10': 'mediumMetadata'
    },
    {
      '1': 'keep_alive_interval_millis',
      '3': 8,
      '4': 1,
      '5': 5,
      '10': 'keepAliveIntervalMillis'
    },
    {
      '1': 'keep_alive_timeout_millis',
      '3': 9,
      '4': 1,
      '5': 5,
      '10': 'keepAliveTimeoutMillis'
    },
    {
      '1': 'device_type',
      '3': 10,
      '4': 1,
      '5': 5,
      '7': '0',
      '8': {'3': true},
      '10': 'deviceType',
    },
    {
      '1': 'device_info',
      '3': 11,
      '4': 1,
      '5': 12,
      '8': {'3': true},
      '10': 'deviceInfo',
    },
    {
      '1': 'connections_device',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.ConnectionsDevice',
      '9': 0,
      '10': 'connectionsDevice'
    },
    {
      '1': 'presence_device',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.PresenceDevice',
      '9': 0,
      '10': 'presenceDevice'
    },
    {
      '1': 'connection_mode',
      '3': 14,
      '4': 1,
      '5': 14,
      '6': '.location.nearby.connections.ConnectionRequestFrame.ConnectionMode',
      '10': 'connectionMode'
    },
    {
      '1': 'location_hint',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.LocationHint',
      '10': 'locationHint'
    },
  ],
  '4': [
    ConnectionRequestFrame_Medium$json,
    ConnectionRequestFrame_ConnectionMode$json
  ],
  '8': [
    {'1': 'Device'},
  ],
};

@$core.Deprecated('Use connectionRequestFrameDescriptor instead')
const ConnectionRequestFrame_Medium$json = {
  '1': 'Medium',
  '2': [
    {'1': 'UNKNOWN_MEDIUM', '2': 0},
    {
      '1': 'MDNS',
      '2': 1,
      '3': {'1': true},
    },
    {'1': 'BLUETOOTH', '2': 2},
    {'1': 'WIFI_HOTSPOT', '2': 3},
    {'1': 'BLE', '2': 4},
    {'1': 'WIFI_LAN', '2': 5},
    {'1': 'WIFI_AWARE', '2': 6},
    {'1': 'NFC', '2': 7},
    {'1': 'WIFI_DIRECT', '2': 8},
    {'1': 'WEB_RTC', '2': 9},
    {'1': 'BLE_L2CAP', '2': 10},
    {'1': 'USB', '2': 11},
    {'1': 'WEB_RTC_NON_CELLULAR', '2': 12},
    {'1': 'AWDL', '2': 13},
  ],
};

@$core.Deprecated('Use connectionRequestFrameDescriptor instead')
const ConnectionRequestFrame_ConnectionMode$json = {
  '1': 'ConnectionMode',
  '2': [
    {'1': 'LEGACY', '2': 0},
    {'1': 'INSTANT', '2': 1},
  ],
};

/// Descriptor for `ConnectionRequestFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectionRequestFrameDescriptor = $convert.base64Decode(
    'ChZDb25uZWN0aW9uUmVxdWVzdEZyYW1lEh8KC2VuZHBvaW50X2lkGAEgASgJUgplbmRwb2ludE'
    'lkEiMKDWVuZHBvaW50X25hbWUYAiABKAlSDGVuZHBvaW50TmFtZRIlCg5oYW5kc2hha2VfZGF0'
    'YRgDIAEoDFINaGFuZHNoYWtlRGF0YRIUCgVub25jZRgEIAEoBVIFbm9uY2USVAoHbWVkaXVtcx'
    'gFIAMoDjI6LmxvY2F0aW9uLm5lYXJieS5jb25uZWN0aW9ucy5Db25uZWN0aW9uUmVxdWVzdEZy'
    'YW1lLk1lZGl1bVIHbWVkaXVtcxIjCg1lbmRwb2ludF9pbmZvGAYgASgMUgxlbmRwb2ludEluZm'
    '8SVAoPbWVkaXVtX21ldGFkYXRhGAcgASgLMisubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25z'
    'Lk1lZGl1bU1ldGFkYXRhUg5tZWRpdW1NZXRhZGF0YRI7ChprZWVwX2FsaXZlX2ludGVydmFsX2'
    '1pbGxpcxgIIAEoBVIXa2VlcEFsaXZlSW50ZXJ2YWxNaWxsaXMSOQoZa2VlcF9hbGl2ZV90aW1l'
    'b3V0X21pbGxpcxgJIAEoBVIWa2VlcEFsaXZlVGltZW91dE1pbGxpcxImCgtkZXZpY2VfdHlwZR'
    'gKIAEoBToBMEICGAFSCmRldmljZVR5cGUSIwoLZGV2aWNlX2luZm8YCyABKAxCAhgBUgpkZXZp'
    'Y2VJbmZvEl8KEmNvbm5lY3Rpb25zX2RldmljZRgMIAEoCzIuLmxvY2F0aW9uLm5lYXJieS5jb2'
    '5uZWN0aW9ucy5Db25uZWN0aW9uc0RldmljZUgAUhFjb25uZWN0aW9uc0RldmljZRJWCg9wcmVz'
    'ZW5jZV9kZXZpY2UYDSABKAsyKy5sb2NhdGlvbi5uZWFyYnkuY29ubmVjdGlvbnMuUHJlc2VuY2'
    'VEZXZpY2VIAFIOcHJlc2VuY2VEZXZpY2USawoPY29ubmVjdGlvbl9tb2RlGA4gASgOMkIubG9j'
    'YXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLkNvbm5lY3Rpb25SZXF1ZXN0RnJhbWUuQ29ubmVjdG'
    'lvbk1vZGVSDmNvbm5lY3Rpb25Nb2RlEk4KDWxvY2F0aW9uX2hpbnQYDyABKAsyKS5sb2NhdGlv'
    'bi5uZWFyYnkuY29ubmVjdGlvbnMuTG9jYXRpb25IaW50Ugxsb2NhdGlvbkhpbnQi1QEKBk1lZG'
    'l1bRISCg5VTktOT1dOX01FRElVTRAAEgwKBE1ETlMQARoCCAESDQoJQkxVRVRPT1RIEAISEAoM'
    'V0lGSV9IT1RTUE9UEAMSBwoDQkxFEAQSDAoIV0lGSV9MQU4QBRIOCgpXSUZJX0FXQVJFEAYSBw'
    'oDTkZDEAcSDwoLV0lGSV9ESVJFQ1QQCBILCgdXRUJfUlRDEAkSDQoJQkxFX0wyQ0FQEAoSBwoD'
    'VVNCEAsSGAoUV0VCX1JUQ19OT05fQ0VMTFVMQVIQDBIICgRBV0RMEA0iKQoOQ29ubmVjdGlvbk'
    '1vZGUSCgoGTEVHQUNZEAASCwoHSU5TVEFOVBABQggKBkRldmljZQ==');

@$core.Deprecated('Use connectionResponseFrameDescriptor instead')
const ConnectionResponseFrame$json = {
  '1': 'ConnectionResponseFrame',
  '2': [
    {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 5,
      '8': {'3': true},
      '10': 'status',
    },
    {'1': 'handshake_data', '3': 2, '4': 1, '5': 12, '10': 'handshakeData'},
    {
      '1': 'response',
      '3': 3,
      '4': 1,
      '5': 14,
      '6':
          '.location.nearby.connections.ConnectionResponseFrame.ResponseStatus',
      '10': 'response'
    },
    {
      '1': 'os_info',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.OsInfo',
      '10': 'osInfo'
    },
    {
      '1': 'multiplex_socket_bitmask',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'multiplexSocketBitmask'
    },
    {
      '1': 'nearby_connections_version',
      '3': 6,
      '4': 1,
      '5': 5,
      '8': {'3': true},
      '10': 'nearbyConnectionsVersion',
    },
    {
      '1': 'safe_to_disconnect_version',
      '3': 7,
      '4': 1,
      '5': 5,
      '10': 'safeToDisconnectVersion'
    },
    {
      '1': 'location_hint',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.LocationHint',
      '10': 'locationHint'
    },
    {
      '1': 'keep_alive_timeout_millis',
      '3': 9,
      '4': 1,
      '5': 5,
      '10': 'keepAliveTimeoutMillis'
    },
  ],
  '4': [ConnectionResponseFrame_ResponseStatus$json],
};

@$core.Deprecated('Use connectionResponseFrameDescriptor instead')
const ConnectionResponseFrame_ResponseStatus$json = {
  '1': 'ResponseStatus',
  '2': [
    {'1': 'UNKNOWN_RESPONSE_STATUS', '2': 0},
    {'1': 'ACCEPT', '2': 1},
    {'1': 'REJECT', '2': 2},
  ],
};

/// Descriptor for `ConnectionResponseFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectionResponseFrameDescriptor = $convert.base64Decode(
    'ChdDb25uZWN0aW9uUmVzcG9uc2VGcmFtZRIaCgZzdGF0dXMYASABKAVCAhgBUgZzdGF0dXMSJQ'
    'oOaGFuZHNoYWtlX2RhdGEYAiABKAxSDWhhbmRzaGFrZURhdGESXwoIcmVzcG9uc2UYAyABKA4y'
    'Qy5sb2NhdGlvbi5uZWFyYnkuY29ubmVjdGlvbnMuQ29ubmVjdGlvblJlc3BvbnNlRnJhbWUuUm'
    'VzcG9uc2VTdGF0dXNSCHJlc3BvbnNlEjwKB29zX2luZm8YBCABKAsyIy5sb2NhdGlvbi5uZWFy'
    'YnkuY29ubmVjdGlvbnMuT3NJbmZvUgZvc0luZm8SOAoYbXVsdGlwbGV4X3NvY2tldF9iaXRtYX'
    'NrGAUgASgFUhZtdWx0aXBsZXhTb2NrZXRCaXRtYXNrEkAKGm5lYXJieV9jb25uZWN0aW9uc192'
    'ZXJzaW9uGAYgASgFQgIYAVIYbmVhcmJ5Q29ubmVjdGlvbnNWZXJzaW9uEjsKGnNhZmVfdG9fZG'
    'lzY29ubmVjdF92ZXJzaW9uGAcgASgFUhdzYWZlVG9EaXNjb25uZWN0VmVyc2lvbhJOCg1sb2Nh'
    'dGlvbl9oaW50GAggASgLMikubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLkxvY2F0aW9uSG'
    'ludFIMbG9jYXRpb25IaW50EjkKGWtlZXBfYWxpdmVfdGltZW91dF9taWxsaXMYCSABKAVSFmtl'
    'ZXBBbGl2ZVRpbWVvdXRNaWxsaXMiRQoOUmVzcG9uc2VTdGF0dXMSGwoXVU5LTk9XTl9SRVNQT0'
    '5TRV9TVEFUVVMQABIKCgZBQ0NFUFQQARIKCgZSRUpFQ1QQAg==');

@$core.Deprecated('Use payloadTransferFrameDescriptor instead')
const PayloadTransferFrame$json = {
  '1': 'PayloadTransferFrame',
  '2': [
    {
      '1': 'packet_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.location.nearby.connections.PayloadTransferFrame.PacketType',
      '10': 'packetType'
    },
    {
      '1': 'payload_header',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.PayloadTransferFrame.PayloadHeader',
      '10': 'payloadHeader'
    },
    {
      '1': 'payload_chunk',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.PayloadTransferFrame.PayloadChunk',
      '10': 'payloadChunk'
    },
    {
      '1': 'control_message',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.PayloadTransferFrame.ControlMessage',
      '10': 'controlMessage'
    },
  ],
  '3': [
    PayloadTransferFrame_PayloadHeader$json,
    PayloadTransferFrame_PayloadChunk$json,
    PayloadTransferFrame_ControlMessage$json
  ],
  '4': [PayloadTransferFrame_PacketType$json],
};

@$core.Deprecated('Use payloadTransferFrameDescriptor instead')
const PayloadTransferFrame_PayloadHeader$json = {
  '1': 'PayloadHeader',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6':
          '.location.nearby.connections.PayloadTransferFrame.PayloadHeader.PayloadType',
      '10': 'type'
    },
    {'1': 'total_size', '3': 3, '4': 1, '5': 3, '10': 'totalSize'},
    {'1': 'is_sensitive', '3': 4, '4': 1, '5': 8, '10': 'isSensitive'},
    {'1': 'file_name', '3': 5, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'parent_folder', '3': 6, '4': 1, '5': 9, '10': 'parentFolder'},
    {
      '1': 'last_modified_timestamp_millis',
      '3': 7,
      '4': 1,
      '5': 3,
      '10': 'lastModifiedTimestampMillis'
    },
  ],
  '4': [PayloadTransferFrame_PayloadHeader_PayloadType$json],
};

@$core.Deprecated('Use payloadTransferFrameDescriptor instead')
const PayloadTransferFrame_PayloadHeader_PayloadType$json = {
  '1': 'PayloadType',
  '2': [
    {'1': 'UNKNOWN_PAYLOAD_TYPE', '2': 0},
    {'1': 'BYTES', '2': 1},
    {'1': 'FILE', '2': 2},
    {'1': 'STREAM', '2': 3},
  ],
};

@$core.Deprecated('Use payloadTransferFrameDescriptor instead')
const PayloadTransferFrame_PayloadChunk$json = {
  '1': 'PayloadChunk',
  '2': [
    {'1': 'flags', '3': 1, '4': 1, '5': 5, '10': 'flags'},
    {'1': 'offset', '3': 2, '4': 1, '5': 3, '10': 'offset'},
    {'1': 'body', '3': 3, '4': 1, '5': 12, '10': 'body'},
    {'1': 'index', '3': 4, '4': 1, '5': 5, '10': 'index'},
  ],
  '4': [PayloadTransferFrame_PayloadChunk_Flags$json],
};

@$core.Deprecated('Use payloadTransferFrameDescriptor instead')
const PayloadTransferFrame_PayloadChunk_Flags$json = {
  '1': 'Flags',
  '2': [
    {'1': 'LAST_CHUNK', '2': 1},
  ],
};

@$core.Deprecated('Use payloadTransferFrameDescriptor instead')
const PayloadTransferFrame_ControlMessage$json = {
  '1': 'ControlMessage',
  '2': [
    {
      '1': 'event',
      '3': 1,
      '4': 1,
      '5': 14,
      '6':
          '.location.nearby.connections.PayloadTransferFrame.ControlMessage.EventType',
      '10': 'event'
    },
    {'1': 'offset', '3': 2, '4': 1, '5': 3, '10': 'offset'},
  ],
  '4': [PayloadTransferFrame_ControlMessage_EventType$json],
};

@$core.Deprecated('Use payloadTransferFrameDescriptor instead')
const PayloadTransferFrame_ControlMessage_EventType$json = {
  '1': 'EventType',
  '2': [
    {'1': 'UNKNOWN_EVENT_TYPE', '2': 0},
    {'1': 'PAYLOAD_ERROR', '2': 1},
    {'1': 'PAYLOAD_CANCELED', '2': 2},
    {
      '1': 'PAYLOAD_RECEIVED_ACK',
      '2': 3,
      '3': {'1': true},
    },
  ],
};

@$core.Deprecated('Use payloadTransferFrameDescriptor instead')
const PayloadTransferFrame_PacketType$json = {
  '1': 'PacketType',
  '2': [
    {'1': 'UNKNOWN_PACKET_TYPE', '2': 0},
    {'1': 'DATA', '2': 1},
    {'1': 'CONTROL', '2': 2},
    {'1': 'PAYLOAD_ACK', '2': 3},
  ],
};

/// Descriptor for `PayloadTransferFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payloadTransferFrameDescriptor = $convert.base64Decode(
    'ChRQYXlsb2FkVHJhbnNmZXJGcmFtZRJdCgtwYWNrZXRfdHlwZRgBIAEoDjI8LmxvY2F0aW9uLm'
    '5lYXJieS5jb25uZWN0aW9ucy5QYXlsb2FkVHJhbnNmZXJGcmFtZS5QYWNrZXRUeXBlUgpwYWNr'
    'ZXRUeXBlEmYKDnBheWxvYWRfaGVhZGVyGAIgASgLMj8ubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3'
    'Rpb25zLlBheWxvYWRUcmFuc2ZlckZyYW1lLlBheWxvYWRIZWFkZXJSDXBheWxvYWRIZWFkZXIS'
    'YwoNcGF5bG9hZF9jaHVuaxgDIAEoCzI+LmxvY2F0aW9uLm5lYXJieS5jb25uZWN0aW9ucy5QYX'
    'lsb2FkVHJhbnNmZXJGcmFtZS5QYXlsb2FkQ2h1bmtSDHBheWxvYWRDaHVuaxJpCg9jb250cm9s'
    'X21lc3NhZ2UYBCABKAsyQC5sb2NhdGlvbi5uZWFyYnkuY29ubmVjdGlvbnMuUGF5bG9hZFRyYW'
    '5zZmVyRnJhbWUuQ29udHJvbE1lc3NhZ2VSDmNvbnRyb2xNZXNzYWdlGpMDCg1QYXlsb2FkSGVh'
    'ZGVyEg4KAmlkGAEgASgDUgJpZBJfCgR0eXBlGAIgASgOMksubG9jYXRpb24ubmVhcmJ5LmNvbm'
    '5lY3Rpb25zLlBheWxvYWRUcmFuc2ZlckZyYW1lLlBheWxvYWRIZWFkZXIuUGF5bG9hZFR5cGVS'
    'BHR5cGUSHQoKdG90YWxfc2l6ZRgDIAEoA1IJdG90YWxTaXplEiEKDGlzX3NlbnNpdGl2ZRgEIA'
    'EoCFILaXNTZW5zaXRpdmUSGwoJZmlsZV9uYW1lGAUgASgJUghmaWxlTmFtZRIjCg1wYXJlbnRf'
    'Zm9sZGVyGAYgASgJUgxwYXJlbnRGb2xkZXISQwoebGFzdF9tb2RpZmllZF90aW1lc3RhbXBfbW'
    'lsbGlzGAcgASgDUhtsYXN0TW9kaWZpZWRUaW1lc3RhbXBNaWxsaXMiSAoLUGF5bG9hZFR5cGUS'
    'GAoUVU5LTk9XTl9QQVlMT0FEX1RZUEUQABIJCgVCWVRFUxABEggKBEZJTEUQAhIKCgZTVFJFQU'
    '0QAxp/CgxQYXlsb2FkQ2h1bmsSFAoFZmxhZ3MYASABKAVSBWZsYWdzEhYKBm9mZnNldBgCIAEo'
    'A1IGb2Zmc2V0EhIKBGJvZHkYAyABKAxSBGJvZHkSFAoFaW5kZXgYBCABKAVSBWluZGV4IhcKBU'
    'ZsYWdzEg4KCkxBU1RfQ0hVTksQARr2AQoOQ29udHJvbE1lc3NhZ2USYAoFZXZlbnQYASABKA4y'
    'Si5sb2NhdGlvbi5uZWFyYnkuY29ubmVjdGlvbnMuUGF5bG9hZFRyYW5zZmVyRnJhbWUuQ29udH'
    'JvbE1lc3NhZ2UuRXZlbnRUeXBlUgVldmVudBIWCgZvZmZzZXQYAiABKANSBm9mZnNldCJqCglF'
    'dmVudFR5cGUSFgoSVU5LTk9XTl9FVkVOVF9UWVBFEAASEQoNUEFZTE9BRF9FUlJPUhABEhQKEF'
    'BBWUxPQURfQ0FOQ0VMRUQQAhIcChRQQVlMT0FEX1JFQ0VJVkVEX0FDSxADGgIIASJNCgpQYWNr'
    'ZXRUeXBlEhcKE1VOS05PV05fUEFDS0VUX1RZUEUQABIICgREQVRBEAESCwoHQ09OVFJPTBACEg'
    '8KC1BBWUxPQURfQUNLEAM=');

@$core.Deprecated('Use serviceAddressDescriptor instead')
const ServiceAddress$json = {
  '1': 'ServiceAddress',
  '2': [
    {'1': 'ip_address', '3': 1, '4': 1, '5': 12, '10': 'ipAddress'},
    {'1': 'port', '3': 2, '4': 1, '5': 5, '10': 'port'},
  ],
};

/// Descriptor for `ServiceAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceAddressDescriptor = $convert.base64Decode(
    'Cg5TZXJ2aWNlQWRkcmVzcxIdCgppcF9hZGRyZXNzGAEgASgMUglpcEFkZHJlc3MSEgoEcG9ydB'
    'gCIAEoBVIEcG9ydA==');

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame$json = {
  '1': 'BandwidthUpgradeNegotiationFrame',
  '2': [
    {
      '1': 'event_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.EventType',
      '10': 'eventType'
    },
    {
      '1': 'upgrade_path_info',
      '3': 2,
      '4': 1,
      '5': 11,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.UpgradePathInfo',
      '10': 'upgradePathInfo'
    },
    {
      '1': 'client_introduction',
      '3': 3,
      '4': 1,
      '5': 11,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.ClientIntroduction',
      '10': 'clientIntroduction'
    },
    {
      '1': 'client_introduction_ack',
      '3': 4,
      '4': 1,
      '5': 11,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.ClientIntroductionAck',
      '10': 'clientIntroductionAck'
    },
    {
      '1': 'safe_to_close_prior_channel',
      '3': 5,
      '4': 1,
      '5': 11,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.SafeToClosePriorChannel',
      '10': 'safeToClosePriorChannel'
    },
  ],
  '3': [
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo$json,
    BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel$json,
    BandwidthUpgradeNegotiationFrame_ClientIntroduction$json,
    BandwidthUpgradeNegotiationFrame_ClientIntroductionAck$json
  ],
  '4': [BandwidthUpgradeNegotiationFrame_EventType$json],
};

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame_UpgradePathInfo$json = {
  '1': 'UpgradePathInfo',
  '2': [
    {
      '1': 'medium',
      '3': 1,
      '4': 1,
      '5': 14,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.UpgradePathInfo.Medium',
      '10': 'medium'
    },
    {
      '1': 'wifi_hotspot_credentials',
      '3': 2,
      '4': 1,
      '5': 11,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.UpgradePathInfo.WifiHotspotCredentials',
      '10': 'wifiHotspotCredentials'
    },
    {
      '1': 'wifi_lan_socket',
      '3': 3,
      '4': 1,
      '5': 11,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.UpgradePathInfo.WifiLanSocket',
      '10': 'wifiLanSocket'
    },
    {
      '1': 'bluetooth_credentials',
      '3': 4,
      '4': 1,
      '5': 11,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.UpgradePathInfo.BluetoothCredentials',
      '10': 'bluetoothCredentials'
    },
    {
      '1': 'wifi_aware_credentials',
      '3': 5,
      '4': 1,
      '5': 11,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.UpgradePathInfo.WifiAwareCredentials',
      '10': 'wifiAwareCredentials'
    },
    {
      '1': 'wifi_direct_credentials',
      '3': 6,
      '4': 1,
      '5': 11,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.UpgradePathInfo.WifiDirectCredentials',
      '10': 'wifiDirectCredentials'
    },
    {
      '1': 'web_rtc_credentials',
      '3': 8,
      '4': 1,
      '5': 11,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.UpgradePathInfo.WebRtcCredentials',
      '10': 'webRtcCredentials'
    },
    {
      '1': 'awdl_credentials',
      '3': 11,
      '4': 1,
      '5': 11,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.UpgradePathInfo.AwdlCredentials',
      '10': 'awdlCredentials'
    },
    {
      '1': 'supports_disabling_encryption',
      '3': 7,
      '4': 1,
      '5': 8,
      '10': 'supportsDisablingEncryption'
    },
    {
      '1': 'supports_client_introduction_ack',
      '3': 9,
      '4': 1,
      '5': 8,
      '10': 'supportsClientIntroductionAck'
    },
    {
      '1': 'upgrade_path_request',
      '3': 10,
      '4': 1,
      '5': 11,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.UpgradePathInfo.UpgradePathRequest',
      '10': 'upgradePathRequest'
    },
  ],
  '3': [
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials$json,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket$json,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials$json,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials$json,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials$json,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials$json,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials$json,
    BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest$json
  ],
  '4': [BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium$json],
};

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiHotspotCredentials$json =
    {
  '1': 'WifiHotspotCredentials',
  '2': [
    {'1': 'ssid', '3': 1, '4': 1, '5': 9, '10': 'ssid'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'port', '3': 3, '4': 1, '5': 5, '10': 'port'},
    {'1': 'gateway', '3': 4, '4': 1, '5': 9, '7': '0.0.0.0', '10': 'gateway'},
    {'1': 'frequency', '3': 5, '4': 1, '5': 5, '7': '-1', '10': 'frequency'},
    {
      '1': 'address_candidates',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.location.nearby.connections.ServiceAddress',
      '10': 'addressCandidates'
    },
  ],
};

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiLanSocket$json = {
  '1': 'WifiLanSocket',
  '2': [
    {'1': 'ip_address', '3': 1, '4': 1, '5': 12, '10': 'ipAddress'},
    {'1': 'wifi_port', '3': 2, '4': 1, '5': 5, '10': 'wifiPort'},
    {
      '1': 'address_candidates',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.location.nearby.connections.ServiceAddress',
      '10': 'addressCandidates'
    },
  ],
};

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_BluetoothCredentials$json =
    {
  '1': 'BluetoothCredentials',
  '2': [
    {'1': 'service_name', '3': 1, '4': 1, '5': 9, '10': 'serviceName'},
    {'1': 'mac_address', '3': 2, '4': 1, '5': 9, '10': 'macAddress'},
  ],
};

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiAwareCredentials$json =
    {
  '1': 'WifiAwareCredentials',
  '2': [
    {'1': 'service_id', '3': 1, '4': 1, '5': 9, '10': 'serviceId'},
    {'1': 'service_info', '3': 2, '4': 1, '5': 12, '10': 'serviceInfo'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WifiDirectCredentials$json =
    {
  '1': 'WifiDirectCredentials',
  '2': [
    {'1': 'ssid', '3': 1, '4': 1, '5': 9, '10': 'ssid'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'port', '3': 3, '4': 1, '5': 5, '10': 'port'},
    {'1': 'frequency', '3': 4, '4': 1, '5': 5, '10': 'frequency'},
    {'1': 'gateway', '3': 5, '4': 1, '5': 9, '7': '0.0.0.0', '10': 'gateway'},
    {'1': 'ip_v6_address', '3': 6, '4': 1, '5': 12, '10': 'ipV6Address'},
    {'1': 'service_name', '3': 7, '4': 1, '5': 9, '10': 'serviceName'},
    {'1': 'pin', '3': 8, '4': 1, '5': 9, '10': 'pin'},
  ],
};

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_WebRtcCredentials$json =
    {
  '1': 'WebRtcCredentials',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {
      '1': 'location_hint',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.LocationHint',
      '10': 'locationHint'
    },
  ],
};

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_AwdlCredentials$json = {
  '1': 'AwdlCredentials',
  '2': [
    {'1': 'service_name', '3': 1, '4': 1, '5': 9, '10': 'serviceName'},
    {'1': 'service_type', '3': 2, '4': 1, '5': 9, '10': 'serviceType'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_UpgradePathRequest$json =
    {
  '1': 'UpgradePathRequest',
  '2': [
    {
      '1': 'mediums',
      '3': 1,
      '4': 3,
      '5': 14,
      '6':
          '.location.nearby.connections.BandwidthUpgradeNegotiationFrame.UpgradePathInfo.Medium',
      '8': {'2': true},
      '10': 'mediums',
    },
    {
      '1': 'medium_meta_data',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.MediumMetadata',
      '10': 'mediumMetaData'
    },
  ],
};

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame_UpgradePathInfo_Medium$json = {
  '1': 'Medium',
  '2': [
    {'1': 'UNKNOWN_MEDIUM', '2': 0},
    {
      '1': 'MDNS',
      '2': 1,
      '3': {'1': true},
    },
    {'1': 'BLUETOOTH', '2': 2},
    {'1': 'WIFI_HOTSPOT', '2': 3},
    {'1': 'BLE', '2': 4},
    {'1': 'WIFI_LAN', '2': 5},
    {'1': 'WIFI_AWARE', '2': 6},
    {'1': 'NFC', '2': 7},
    {'1': 'WIFI_DIRECT', '2': 8},
    {'1': 'WEB_RTC', '2': 9},
    {'1': 'USB', '2': 11},
    {'1': 'WEB_RTC_NON_CELLULAR', '2': 12},
    {'1': 'AWDL', '2': 13},
  ],
};

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame_SafeToClosePriorChannel$json = {
  '1': 'SafeToClosePriorChannel',
  '2': [
    {'1': 'sta_frequency', '3': 1, '4': 1, '5': 5, '10': 'staFrequency'},
  ],
};

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame_ClientIntroduction$json = {
  '1': 'ClientIntroduction',
  '2': [
    {'1': 'endpoint_id', '3': 1, '4': 1, '5': 9, '10': 'endpointId'},
    {
      '1': 'supports_disabling_encryption',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'supportsDisablingEncryption'
    },
    {'1': 'last_endpoint_id', '3': 3, '4': 1, '5': 9, '10': 'lastEndpointId'},
  ],
};

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame_ClientIntroductionAck$json = {
  '1': 'ClientIntroductionAck',
};

@$core.Deprecated('Use bandwidthUpgradeNegotiationFrameDescriptor instead')
const BandwidthUpgradeNegotiationFrame_EventType$json = {
  '1': 'EventType',
  '2': [
    {'1': 'UNKNOWN_EVENT_TYPE', '2': 0},
    {'1': 'UPGRADE_PATH_AVAILABLE', '2': 1},
    {'1': 'LAST_WRITE_TO_PRIOR_CHANNEL', '2': 2},
    {'1': 'SAFE_TO_CLOSE_PRIOR_CHANNEL', '2': 3},
    {'1': 'CLIENT_INTRODUCTION', '2': 4},
    {'1': 'UPGRADE_FAILURE', '2': 5},
    {'1': 'CLIENT_INTRODUCTION_ACK', '2': 6},
    {'1': 'UPGRADE_PATH_REQUEST', '2': 7},
  ],
};

/// Descriptor for `BandwidthUpgradeNegotiationFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bandwidthUpgradeNegotiationFrameDescriptor = $convert.base64Decode(
    'CiBCYW5kd2lkdGhVcGdyYWRlTmVnb3RpYXRpb25GcmFtZRJmCgpldmVudF90eXBlGAEgASgOMk'
    'cubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLkJhbmR3aWR0aFVwZ3JhZGVOZWdvdGlhdGlv'
    'bkZyYW1lLkV2ZW50VHlwZVIJZXZlbnRUeXBlEnkKEXVwZ3JhZGVfcGF0aF9pbmZvGAIgASgLMk'
    '0ubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLkJhbmR3aWR0aFVwZ3JhZGVOZWdvdGlhdGlv'
    'bkZyYW1lLlVwZ3JhZGVQYXRoSW5mb1IPdXBncmFkZVBhdGhJbmZvEoEBChNjbGllbnRfaW50cm'
    '9kdWN0aW9uGAMgASgLMlAubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLkJhbmR3aWR0aFVw'
    'Z3JhZGVOZWdvdGlhdGlvbkZyYW1lLkNsaWVudEludHJvZHVjdGlvblISY2xpZW50SW50cm9kdW'
    'N0aW9uEosBChdjbGllbnRfaW50cm9kdWN0aW9uX2FjaxgEIAEoCzJTLmxvY2F0aW9uLm5lYXJi'
    'eS5jb25uZWN0aW9ucy5CYW5kd2lkdGhVcGdyYWRlTmVnb3RpYXRpb25GcmFtZS5DbGllbnRJbn'
    'Ryb2R1Y3Rpb25BY2tSFWNsaWVudEludHJvZHVjdGlvbkFjaxKTAQobc2FmZV90b19jbG9zZV9w'
    'cmlvcl9jaGFubmVsGAUgASgLMlUubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLkJhbmR3aW'
    'R0aFVwZ3JhZGVOZWdvdGlhdGlvbkZyYW1lLlNhZmVUb0Nsb3NlUHJpb3JDaGFubmVsUhdzYWZl'
    'VG9DbG9zZVByaW9yQ2hhbm5lbBrKFwoPVXBncmFkZVBhdGhJbmZvEmwKBm1lZGl1bRgBIAEoDj'
    'JULmxvY2F0aW9uLm5lYXJieS5jb25uZWN0aW9ucy5CYW5kd2lkdGhVcGdyYWRlTmVnb3RpYXRp'
    'b25GcmFtZS5VcGdyYWRlUGF0aEluZm8uTWVkaXVtUgZtZWRpdW0SngEKGHdpZmlfaG90c3BvdF'
    '9jcmVkZW50aWFscxgCIAEoCzJkLmxvY2F0aW9uLm5lYXJieS5jb25uZWN0aW9ucy5CYW5kd2lk'
    'dGhVcGdyYWRlTmVnb3RpYXRpb25GcmFtZS5VcGdyYWRlUGF0aEluZm8uV2lmaUhvdHNwb3RDcm'
    'VkZW50aWFsc1IWd2lmaUhvdHNwb3RDcmVkZW50aWFscxKDAQoPd2lmaV9sYW5fc29ja2V0GAMg'
    'ASgLMlsubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLkJhbmR3aWR0aFVwZ3JhZGVOZWdvdG'
    'lhdGlvbkZyYW1lLlVwZ3JhZGVQYXRoSW5mby5XaWZpTGFuU29ja2V0Ug13aWZpTGFuU29ja2V0'
    'EpcBChVibHVldG9vdGhfY3JlZGVudGlhbHMYBCABKAsyYi5sb2NhdGlvbi5uZWFyYnkuY29ubm'
    'VjdGlvbnMuQmFuZHdpZHRoVXBncmFkZU5lZ290aWF0aW9uRnJhbWUuVXBncmFkZVBhdGhJbmZv'
    'LkJsdWV0b290aENyZWRlbnRpYWxzUhRibHVldG9vdGhDcmVkZW50aWFscxKYAQoWd2lmaV9hd2'
    'FyZV9jcmVkZW50aWFscxgFIAEoCzJiLmxvY2F0aW9uLm5lYXJieS5jb25uZWN0aW9ucy5CYW5k'
    'd2lkdGhVcGdyYWRlTmVnb3RpYXRpb25GcmFtZS5VcGdyYWRlUGF0aEluZm8uV2lmaUF3YXJlQ3'
    'JlZGVudGlhbHNSFHdpZmlBd2FyZUNyZWRlbnRpYWxzEpsBChd3aWZpX2RpcmVjdF9jcmVkZW50'
    'aWFscxgGIAEoCzJjLmxvY2F0aW9uLm5lYXJieS5jb25uZWN0aW9ucy5CYW5kd2lkdGhVcGdyYW'
    'RlTmVnb3RpYXRpb25GcmFtZS5VcGdyYWRlUGF0aEluZm8uV2lmaURpcmVjdENyZWRlbnRpYWxz'
    'UhV3aWZpRGlyZWN0Q3JlZGVudGlhbHMSjwEKE3dlYl9ydGNfY3JlZGVudGlhbHMYCCABKAsyXy'
    '5sb2NhdGlvbi5uZWFyYnkuY29ubmVjdGlvbnMuQmFuZHdpZHRoVXBncmFkZU5lZ290aWF0aW9u'
    'RnJhbWUuVXBncmFkZVBhdGhJbmZvLldlYlJ0Y0NyZWRlbnRpYWxzUhF3ZWJSdGNDcmVkZW50aW'
    'FscxKIAQoQYXdkbF9jcmVkZW50aWFscxgLIAEoCzJdLmxvY2F0aW9uLm5lYXJieS5jb25uZWN0'
    'aW9ucy5CYW5kd2lkdGhVcGdyYWRlTmVnb3RpYXRpb25GcmFtZS5VcGdyYWRlUGF0aEluZm8uQX'
    'dkbENyZWRlbnRpYWxzUg9hd2RsQ3JlZGVudGlhbHMSQgodc3VwcG9ydHNfZGlzYWJsaW5nX2Vu'
    'Y3J5cHRpb24YByABKAhSG3N1cHBvcnRzRGlzYWJsaW5nRW5jcnlwdGlvbhJHCiBzdXBwb3J0c1'
    '9jbGllbnRfaW50cm9kdWN0aW9uX2FjaxgJIAEoCFIdc3VwcG9ydHNDbGllbnRJbnRyb2R1Y3Rp'
    'b25BY2sSkgEKFHVwZ3JhZGVfcGF0aF9yZXF1ZXN0GAogASgLMmAubG9jYXRpb24ubmVhcmJ5Lm'
    'Nvbm5lY3Rpb25zLkJhbmR3aWR0aFVwZ3JhZGVOZWdvdGlhdGlvbkZyYW1lLlVwZ3JhZGVQYXRo'
    'SW5mby5VcGdyYWRlUGF0aFJlcXVlc3RSEnVwZ3JhZGVQYXRoUmVxdWVzdBr9AQoWV2lmaUhvdH'
    'Nwb3RDcmVkZW50aWFscxISCgRzc2lkGAEgASgJUgRzc2lkEhoKCHBhc3N3b3JkGAIgASgJUghw'
    'YXNzd29yZBISCgRwb3J0GAMgASgFUgRwb3J0EiEKB2dhdGV3YXkYBCABKAk6BzAuMC4wLjBSB2'
    'dhdGV3YXkSIAoJZnJlcXVlbmN5GAUgASgFOgItMVIJZnJlcXVlbmN5EloKEmFkZHJlc3NfY2Fu'
    'ZGlkYXRlcxgGIAMoCzIrLmxvY2F0aW9uLm5lYXJieS5jb25uZWN0aW9ucy5TZXJ2aWNlQWRkcm'
    'Vzc1IRYWRkcmVzc0NhbmRpZGF0ZXMapwEKDVdpZmlMYW5Tb2NrZXQSHQoKaXBfYWRkcmVzcxgB'
    'IAEoDFIJaXBBZGRyZXNzEhsKCXdpZmlfcG9ydBgCIAEoBVIId2lmaVBvcnQSWgoSYWRkcmVzc1'
    '9jYW5kaWRhdGVzGAMgAygLMisubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLlNlcnZpY2VB'
    'ZGRyZXNzUhFhZGRyZXNzQ2FuZGlkYXRlcxpaChRCbHVldG9vdGhDcmVkZW50aWFscxIhCgxzZX'
    'J2aWNlX25hbWUYASABKAlSC3NlcnZpY2VOYW1lEh8KC21hY19hZGRyZXNzGAIgASgJUgptYWNB'
    'ZGRyZXNzGnQKFFdpZmlBd2FyZUNyZWRlbnRpYWxzEh0KCnNlcnZpY2VfaWQYASABKAlSCXNlcn'
    'ZpY2VJZBIhCgxzZXJ2aWNlX2luZm8YAiABKAxSC3NlcnZpY2VJbmZvEhoKCHBhc3N3b3JkGAMg'
    'ASgJUghwYXNzd29yZBr1AQoVV2lmaURpcmVjdENyZWRlbnRpYWxzEhIKBHNzaWQYASABKAlSBH'
    'NzaWQSGgoIcGFzc3dvcmQYAiABKAlSCHBhc3N3b3JkEhIKBHBvcnQYAyABKAVSBHBvcnQSHAoJ'
    'ZnJlcXVlbmN5GAQgASgFUglmcmVxdWVuY3kSIQoHZ2F0ZXdheRgFIAEoCToHMC4wLjAuMFIHZ2'
    'F0ZXdheRIiCg1pcF92Nl9hZGRyZXNzGAYgASgMUgtpcFY2QWRkcmVzcxIhCgxzZXJ2aWNlX25h'
    'bWUYByABKAlSC3NlcnZpY2VOYW1lEhAKA3BpbhgIIAEoCVIDcGluGnwKEVdlYlJ0Y0NyZWRlbn'
    'RpYWxzEhcKB3BlZXJfaWQYASABKAlSBnBlZXJJZBJOCg1sb2NhdGlvbl9oaW50GAIgASgLMiku'
    'bG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLkxvY2F0aW9uSGludFIMbG9jYXRpb25IaW50Gn'
    'MKD0F3ZGxDcmVkZW50aWFscxIhCgxzZXJ2aWNlX25hbWUYASABKAlSC3NlcnZpY2VOYW1lEiEK'
    'DHNlcnZpY2VfdHlwZRgCIAEoCVILc2VydmljZVR5cGUSGgoIcGFzc3dvcmQYAyABKAlSCHBhc3'
    'N3b3JkGt8BChJVcGdyYWRlUGF0aFJlcXVlc3QScgoHbWVkaXVtcxgBIAMoDjJULmxvY2F0aW9u'
    'Lm5lYXJieS5jb25uZWN0aW9ucy5CYW5kd2lkdGhVcGdyYWRlTmVnb3RpYXRpb25GcmFtZS5VcG'
    'dyYWRlUGF0aEluZm8uTWVkaXVtQgIQAVIHbWVkaXVtcxJVChBtZWRpdW1fbWV0YV9kYXRhGAIg'
    'ASgLMisubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLk1lZGl1bU1ldGFkYXRhUg5tZWRpdW'
    '1NZXRhRGF0YSLGAQoGTWVkaXVtEhIKDlVOS05PV05fTUVESVVNEAASDAoETUROUxABGgIIARIN'
    'CglCTFVFVE9PVEgQAhIQCgxXSUZJX0hPVFNQT1QQAxIHCgNCTEUQBBIMCghXSUZJX0xBThAFEg'
    '4KCldJRklfQVdBUkUQBhIHCgNORkMQBxIPCgtXSUZJX0RJUkVDVBAIEgsKB1dFQl9SVEMQCRIH'
    'CgNVU0IQCxIYChRXRUJfUlRDX05PTl9DRUxMVUxBUhAMEggKBEFXREwQDRo+ChdTYWZlVG9DbG'
    '9zZVByaW9yQ2hhbm5lbBIjCg1zdGFfZnJlcXVlbmN5GAEgASgFUgxzdGFGcmVxdWVuY3kaowEK'
    'EkNsaWVudEludHJvZHVjdGlvbhIfCgtlbmRwb2ludF9pZBgBIAEoCVIKZW5kcG9pbnRJZBJCCh'
    '1zdXBwb3J0c19kaXNhYmxpbmdfZW5jcnlwdGlvbhgCIAEoCFIbc3VwcG9ydHNEaXNhYmxpbmdF'
    'bmNyeXB0aW9uEigKEGxhc3RfZW5kcG9pbnRfaWQYAyABKAlSDmxhc3RFbmRwb2ludElkGhcKFU'
    'NsaWVudEludHJvZHVjdGlvbkFjayLmAQoJRXZlbnRUeXBlEhYKElVOS05PV05fRVZFTlRfVFlQ'
    'RRAAEhoKFlVQR1JBREVfUEFUSF9BVkFJTEFCTEUQARIfChtMQVNUX1dSSVRFX1RPX1BSSU9SX0'
    'NIQU5ORUwQAhIfChtTQUZFX1RPX0NMT1NFX1BSSU9SX0NIQU5ORUwQAxIXChNDTElFTlRfSU5U'
    'Uk9EVUNUSU9OEAQSEwoPVVBHUkFERV9GQUlMVVJFEAUSGwoXQ0xJRU5UX0lOVFJPRFVDVElPTl'
    '9BQ0sQBhIYChRVUEdSQURFX1BBVEhfUkVRVUVTVBAH');

@$core.Deprecated('Use bandwidthUpgradeRetryFrameDescriptor instead')
const BandwidthUpgradeRetryFrame$json = {
  '1': 'BandwidthUpgradeRetryFrame',
  '2': [
    {
      '1': 'supported_medium',
      '3': 1,
      '4': 3,
      '5': 14,
      '6': '.location.nearby.connections.BandwidthUpgradeRetryFrame.Medium',
      '10': 'supportedMedium'
    },
    {'1': 'is_request', '3': 2, '4': 1, '5': 8, '10': 'isRequest'},
  ],
  '4': [BandwidthUpgradeRetryFrame_Medium$json],
};

@$core.Deprecated('Use bandwidthUpgradeRetryFrameDescriptor instead')
const BandwidthUpgradeRetryFrame_Medium$json = {
  '1': 'Medium',
  '2': [
    {'1': 'UNKNOWN_MEDIUM', '2': 0},
    {'1': 'BLUETOOTH', '2': 2},
    {'1': 'WIFI_HOTSPOT', '2': 3},
    {'1': 'BLE', '2': 4},
    {'1': 'WIFI_LAN', '2': 5},
    {'1': 'WIFI_AWARE', '2': 6},
    {'1': 'NFC', '2': 7},
    {'1': 'WIFI_DIRECT', '2': 8},
    {'1': 'WEB_RTC', '2': 9},
    {'1': 'BLE_L2CAP', '2': 10},
    {'1': 'USB', '2': 11},
    {'1': 'WEB_RTC_NON_CELLULAR', '2': 12},
    {'1': 'AWDL', '2': 13},
  ],
};

/// Descriptor for `BandwidthUpgradeRetryFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bandwidthUpgradeRetryFrameDescriptor = $convert.base64Decode(
    'ChpCYW5kd2lkdGhVcGdyYWRlUmV0cnlGcmFtZRJpChBzdXBwb3J0ZWRfbWVkaXVtGAEgAygOMj'
    '4ubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLkJhbmR3aWR0aFVwZ3JhZGVSZXRyeUZyYW1l'
    'Lk1lZGl1bVIPc3VwcG9ydGVkTWVkaXVtEh0KCmlzX3JlcXVlc3QYAiABKAhSCWlzUmVxdWVzdC'
    'LHAQoGTWVkaXVtEhIKDlVOS05PV05fTUVESVVNEAASDQoJQkxVRVRPT1RIEAISEAoMV0lGSV9I'
    'T1RTUE9UEAMSBwoDQkxFEAQSDAoIV0lGSV9MQU4QBRIOCgpXSUZJX0FXQVJFEAYSBwoDTkZDEA'
    'cSDwoLV0lGSV9ESVJFQ1QQCBILCgdXRUJfUlRDEAkSDQoJQkxFX0wyQ0FQEAoSBwoDVVNCEAsS'
    'GAoUV0VCX1JUQ19OT05fQ0VMTFVMQVIQDBIICgRBV0RMEA0=');

@$core.Deprecated('Use keepAliveFrameDescriptor instead')
const KeepAliveFrame$json = {
  '1': 'KeepAliveFrame',
  '2': [
    {'1': 'ack', '3': 1, '4': 1, '5': 8, '10': 'ack'},
    {'1': 'seq_num', '3': 2, '4': 1, '5': 13, '10': 'seqNum'},
  ],
};

/// Descriptor for `KeepAliveFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keepAliveFrameDescriptor = $convert.base64Decode(
    'Cg5LZWVwQWxpdmVGcmFtZRIQCgNhY2sYASABKAhSA2FjaxIXCgdzZXFfbnVtGAIgASgNUgZzZX'
    'FOdW0=');

@$core.Deprecated('Use disconnectionFrameDescriptor instead')
const DisconnectionFrame$json = {
  '1': 'DisconnectionFrame',
  '2': [
    {
      '1': 'request_safe_to_disconnect',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'requestSafeToDisconnect'
    },
    {
      '1': 'ack_safe_to_disconnect',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'ackSafeToDisconnect'
    },
  ],
};

/// Descriptor for `DisconnectionFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disconnectionFrameDescriptor = $convert.base64Decode(
    'ChJEaXNjb25uZWN0aW9uRnJhbWUSOwoacmVxdWVzdF9zYWZlX3RvX2Rpc2Nvbm5lY3QYASABKA'
    'hSF3JlcXVlc3RTYWZlVG9EaXNjb25uZWN0EjMKFmFja19zYWZlX3RvX2Rpc2Nvbm5lY3QYAiAB'
    'KAhSE2Fja1NhZmVUb0Rpc2Nvbm5lY3Q=');

@$core.Deprecated('Use pairedKeyEncryptionFrameDescriptor instead')
const PairedKeyEncryptionFrame$json = {
  '1': 'PairedKeyEncryptionFrame',
  '2': [
    {'1': 'signed_data', '3': 1, '4': 1, '5': 12, '10': 'signedData'},
  ],
};

/// Descriptor for `PairedKeyEncryptionFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairedKeyEncryptionFrameDescriptor =
    $convert.base64Decode(
        'ChhQYWlyZWRLZXlFbmNyeXB0aW9uRnJhbWUSHwoLc2lnbmVkX2RhdGEYASABKAxSCnNpZ25lZE'
        'RhdGE=');

@$core.Deprecated('Use authenticationMessageFrameDescriptor instead')
const AuthenticationMessageFrame$json = {
  '1': 'AuthenticationMessageFrame',
  '2': [
    {'1': 'auth_message', '3': 1, '4': 1, '5': 12, '10': 'authMessage'},
  ],
};

/// Descriptor for `AuthenticationMessageFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticationMessageFrameDescriptor =
    $convert.base64Decode(
        'ChpBdXRoZW50aWNhdGlvbk1lc3NhZ2VGcmFtZRIhCgxhdXRoX21lc3NhZ2UYASABKAxSC2F1dG'
        'hNZXNzYWdl');

@$core.Deprecated('Use authenticationResultFrameDescriptor instead')
const AuthenticationResultFrame$json = {
  '1': 'AuthenticationResultFrame',
  '2': [
    {'1': 'result', '3': 1, '4': 1, '5': 5, '10': 'result'},
  ],
};

/// Descriptor for `AuthenticationResultFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticationResultFrameDescriptor =
    $convert.base64Decode(
        'ChlBdXRoZW50aWNhdGlvblJlc3VsdEZyYW1lEhYKBnJlc3VsdBgBIAEoBVIGcmVzdWx0');

@$core.Deprecated('Use autoResumeFrameDescriptor instead')
const AutoResumeFrame$json = {
  '1': 'AutoResumeFrame',
  '2': [
    {
      '1': 'event_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.location.nearby.connections.AutoResumeFrame.EventType',
      '10': 'eventType'
    },
    {
      '1': 'pending_payload_id',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'pendingPayloadId'
    },
    {
      '1': 'next_payload_chunk_index',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'nextPayloadChunkIndex'
    },
    {'1': 'version', '3': 4, '4': 1, '5': 5, '10': 'version'},
  ],
  '4': [AutoResumeFrame_EventType$json],
};

@$core.Deprecated('Use autoResumeFrameDescriptor instead')
const AutoResumeFrame_EventType$json = {
  '1': 'EventType',
  '2': [
    {'1': 'UNKNOWN_AUTO_RESUME_EVENT_TYPE', '2': 0},
    {'1': 'PAYLOAD_RESUME_TRANSFER_START', '2': 1},
    {'1': 'PAYLOAD_RESUME_TRANSFER_ACK', '2': 2},
  ],
};

/// Descriptor for `AutoResumeFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List autoResumeFrameDescriptor = $convert.base64Decode(
    'Cg9BdXRvUmVzdW1lRnJhbWUSVQoKZXZlbnRfdHlwZRgBIAEoDjI2LmxvY2F0aW9uLm5lYXJieS'
    '5jb25uZWN0aW9ucy5BdXRvUmVzdW1lRnJhbWUuRXZlbnRUeXBlUglldmVudFR5cGUSLAoScGVu'
    'ZGluZ19wYXlsb2FkX2lkGAIgASgDUhBwZW5kaW5nUGF5bG9hZElkEjcKGG5leHRfcGF5bG9hZF'
    '9jaHVua19pbmRleBgDIAEoBVIVbmV4dFBheWxvYWRDaHVua0luZGV4EhgKB3ZlcnNpb24YBCAB'
    'KAVSB3ZlcnNpb24icwoJRXZlbnRUeXBlEiIKHlVOS05PV05fQVVUT19SRVNVTUVfRVZFTlRfVF'
    'lQRRAAEiEKHVBBWUxPQURfUkVTVU1FX1RSQU5TRkVSX1NUQVJUEAESHwobUEFZTE9BRF9SRVNV'
    'TUVfVFJBTlNGRVJfQUNLEAI=');

@$core.Deprecated('Use autoReconnectFrameDescriptor instead')
const AutoReconnectFrame$json = {
  '1': 'AutoReconnectFrame',
  '2': [
    {'1': 'endpoint_id', '3': 1, '4': 1, '5': 9, '10': 'endpointId'},
    {
      '1': 'event_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.location.nearby.connections.AutoReconnectFrame.EventType',
      '10': 'eventType'
    },
    {'1': 'last_endpoint_id', '3': 3, '4': 1, '5': 9, '10': 'lastEndpointId'},
  ],
  '4': [AutoReconnectFrame_EventType$json],
};

@$core.Deprecated('Use autoReconnectFrameDescriptor instead')
const AutoReconnectFrame_EventType$json = {
  '1': 'EventType',
  '2': [
    {'1': 'UNKNOWN_EVENT_TYPE', '2': 0},
    {'1': 'CLIENT_INTRODUCTION', '2': 1},
    {'1': 'CLIENT_INTRODUCTION_ACK', '2': 2},
  ],
};

/// Descriptor for `AutoReconnectFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List autoReconnectFrameDescriptor = $convert.base64Decode(
    'ChJBdXRvUmVjb25uZWN0RnJhbWUSHwoLZW5kcG9pbnRfaWQYASABKAlSCmVuZHBvaW50SWQSWA'
    'oKZXZlbnRfdHlwZRgCIAEoDjI5LmxvY2F0aW9uLm5lYXJieS5jb25uZWN0aW9ucy5BdXRvUmVj'
    'b25uZWN0RnJhbWUuRXZlbnRUeXBlUglldmVudFR5cGUSKAoQbGFzdF9lbmRwb2ludF9pZBgDIA'
    'EoCVIObGFzdEVuZHBvaW50SWQiWQoJRXZlbnRUeXBlEhYKElVOS05PV05fRVZFTlRfVFlQRRAA'
    'EhcKE0NMSUVOVF9JTlRST0RVQ1RJT04QARIbChdDTElFTlRfSU5UUk9EVUNUSU9OX0FDSxAC');

@$core.Deprecated('Use mediumMetadataDescriptor instead')
const MediumMetadata$json = {
  '1': 'MediumMetadata',
  '2': [
    {'1': 'supports_5_ghz', '3': 1, '4': 1, '5': 8, '10': 'supports5Ghz'},
    {'1': 'bssid', '3': 2, '4': 1, '5': 9, '10': 'bssid'},
    {'1': 'ip_address', '3': 3, '4': 1, '5': 12, '10': 'ipAddress'},
    {'1': 'supports_6_ghz', '3': 4, '4': 1, '5': 8, '10': 'supports6Ghz'},
    {'1': 'mobile_radio', '3': 5, '4': 1, '5': 8, '10': 'mobileRadio'},
    {
      '1': 'ap_frequency',
      '3': 6,
      '4': 1,
      '5': 5,
      '7': '-1',
      '10': 'apFrequency'
    },
    {
      '1': 'available_channels',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.AvailableChannels',
      '10': 'availableChannels'
    },
    {
      '1': 'wifi_direct_cli_usable_channels',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.WifiDirectCliUsableChannels',
      '10': 'wifiDirectCliUsableChannels'
    },
    {
      '1': 'wifi_lan_usable_channels',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.WifiLanUsableChannels',
      '10': 'wifiLanUsableChannels'
    },
    {
      '1': 'wifi_aware_usable_channels',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.WifiAwareUsableChannels',
      '10': 'wifiAwareUsableChannels'
    },
    {
      '1': 'wifi_hotspot_sta_usable_channels',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.WifiHotspotStaUsableChannels',
      '10': 'wifiHotspotStaUsableChannels'
    },
    {
      '1': 'medium_role',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.location.nearby.connections.MediumRole',
      '10': 'mediumRole'
    },
    {
      '1': 'supported_wifi_direct_auth_types',
      '3': 13,
      '4': 3,
      '5': 14,
      '6': '.location.nearby.connections.MediumMetadata.WifiDirectAuthType',
      '8': {'2': true},
      '10': 'supportedWifiDirectAuthTypes',
    },
  ],
  '4': [MediumMetadata_WifiDirectAuthType$json],
};

@$core.Deprecated('Use mediumMetadataDescriptor instead')
const MediumMetadata_WifiDirectAuthType$json = {
  '1': 'WifiDirectAuthType',
  '2': [
    {'1': 'WIFI_DIRECT_TYPE_UNKNOWN', '2': 0},
    {'1': 'WIFI_DIRECT_WITH_PASSWORD', '2': 1},
    {'1': 'WIFI_DIRECT_WITH_PIN', '2': 2},
  ],
};

/// Descriptor for `MediumMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediumMetadataDescriptor = $convert.base64Decode(
    'Cg5NZWRpdW1NZXRhZGF0YRIkCg5zdXBwb3J0c181X2doehgBIAEoCFIMc3VwcG9ydHM1R2h6Eh'
    'QKBWJzc2lkGAIgASgJUgVic3NpZBIdCgppcF9hZGRyZXNzGAMgASgMUglpcEFkZHJlc3MSJAoO'
    'c3VwcG9ydHNfNl9naHoYBCABKAhSDHN1cHBvcnRzNkdoehIhCgxtb2JpbGVfcmFkaW8YBSABKA'
    'hSC21vYmlsZVJhZGlvEiUKDGFwX2ZyZXF1ZW5jeRgGIAEoBToCLTFSC2FwRnJlcXVlbmN5El0K'
    'EmF2YWlsYWJsZV9jaGFubmVscxgHIAEoCzIuLmxvY2F0aW9uLm5lYXJieS5jb25uZWN0aW9ucy'
    '5BdmFpbGFibGVDaGFubmVsc1IRYXZhaWxhYmxlQ2hhbm5lbHMSfgofd2lmaV9kaXJlY3RfY2xp'
    'X3VzYWJsZV9jaGFubmVscxgIIAEoCzI4LmxvY2F0aW9uLm5lYXJieS5jb25uZWN0aW9ucy5XaW'
    'ZpRGlyZWN0Q2xpVXNhYmxlQ2hhbm5lbHNSG3dpZmlEaXJlY3RDbGlVc2FibGVDaGFubmVscxJr'
    'Chh3aWZpX2xhbl91c2FibGVfY2hhbm5lbHMYCSABKAsyMi5sb2NhdGlvbi5uZWFyYnkuY29ubm'
    'VjdGlvbnMuV2lmaUxhblVzYWJsZUNoYW5uZWxzUhV3aWZpTGFuVXNhYmxlQ2hhbm5lbHMScQoa'
    'd2lmaV9hd2FyZV91c2FibGVfY2hhbm5lbHMYCiABKAsyNC5sb2NhdGlvbi5uZWFyYnkuY29ubm'
    'VjdGlvbnMuV2lmaUF3YXJlVXNhYmxlQ2hhbm5lbHNSF3dpZmlBd2FyZVVzYWJsZUNoYW5uZWxz'
    'EoEBCiB3aWZpX2hvdHNwb3Rfc3RhX3VzYWJsZV9jaGFubmVscxgLIAEoCzI5LmxvY2F0aW9uLm'
    '5lYXJieS5jb25uZWN0aW9ucy5XaWZpSG90c3BvdFN0YVVzYWJsZUNoYW5uZWxzUhx3aWZpSG90'
    'c3BvdFN0YVVzYWJsZUNoYW5uZWxzEkgKC21lZGl1bV9yb2xlGAwgASgLMicubG9jYXRpb24ubm'
    'VhcmJ5LmNvbm5lY3Rpb25zLk1lZGl1bVJvbGVSCm1lZGl1bVJvbGUSigEKIHN1cHBvcnRlZF93'
    'aWZpX2RpcmVjdF9hdXRoX3R5cGVzGA0gAygOMj4ubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb2'
    '5zLk1lZGl1bU1ldGFkYXRhLldpZmlEaXJlY3RBdXRoVHlwZUICEAFSHHN1cHBvcnRlZFdpZmlE'
    'aXJlY3RBdXRoVHlwZXMiawoSV2lmaURpcmVjdEF1dGhUeXBlEhwKGFdJRklfRElSRUNUX1RZUE'
    'VfVU5LTk9XThAAEh0KGVdJRklfRElSRUNUX1dJVEhfUEFTU1dPUkQQARIYChRXSUZJX0RJUkVD'
    'VF9XSVRIX1BJThAC');

@$core.Deprecated('Use availableChannelsDescriptor instead')
const AvailableChannels$json = {
  '1': 'AvailableChannels',
  '2': [
    {
      '1': 'channels',
      '3': 1,
      '4': 3,
      '5': 5,
      '8': {'2': true},
      '10': 'channels',
    },
  ],
};

/// Descriptor for `AvailableChannels`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List availableChannelsDescriptor = $convert.base64Decode(
    'ChFBdmFpbGFibGVDaGFubmVscxIeCghjaGFubmVscxgBIAMoBUICEAFSCGNoYW5uZWxz');

@$core.Deprecated('Use wifiDirectCliUsableChannelsDescriptor instead')
const WifiDirectCliUsableChannels$json = {
  '1': 'WifiDirectCliUsableChannels',
  '2': [
    {
      '1': 'channels',
      '3': 1,
      '4': 3,
      '5': 5,
      '8': {'2': true},
      '10': 'channels',
    },
  ],
};

/// Descriptor for `WifiDirectCliUsableChannels`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wifiDirectCliUsableChannelsDescriptor =
    $convert.base64Decode(
        'ChtXaWZpRGlyZWN0Q2xpVXNhYmxlQ2hhbm5lbHMSHgoIY2hhbm5lbHMYASADKAVCAhABUghjaG'
        'FubmVscw==');

@$core.Deprecated('Use wifiLanUsableChannelsDescriptor instead')
const WifiLanUsableChannels$json = {
  '1': 'WifiLanUsableChannels',
  '2': [
    {
      '1': 'channels',
      '3': 1,
      '4': 3,
      '5': 5,
      '8': {'2': true},
      '10': 'channels',
    },
  ],
};

/// Descriptor for `WifiLanUsableChannels`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wifiLanUsableChannelsDescriptor = $convert.base64Decode(
    'ChVXaWZpTGFuVXNhYmxlQ2hhbm5lbHMSHgoIY2hhbm5lbHMYASADKAVCAhABUghjaGFubmVscw'
    '==');

@$core.Deprecated('Use wifiAwareUsableChannelsDescriptor instead')
const WifiAwareUsableChannels$json = {
  '1': 'WifiAwareUsableChannels',
  '2': [
    {
      '1': 'channels',
      '3': 1,
      '4': 3,
      '5': 5,
      '8': {'2': true},
      '10': 'channels',
    },
  ],
};

/// Descriptor for `WifiAwareUsableChannels`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wifiAwareUsableChannelsDescriptor =
    $convert.base64Decode(
        'ChdXaWZpQXdhcmVVc2FibGVDaGFubmVscxIeCghjaGFubmVscxgBIAMoBUICEAFSCGNoYW5uZW'
        'xz');

@$core.Deprecated('Use wifiHotspotStaUsableChannelsDescriptor instead')
const WifiHotspotStaUsableChannels$json = {
  '1': 'WifiHotspotStaUsableChannels',
  '2': [
    {
      '1': 'channels',
      '3': 1,
      '4': 3,
      '5': 5,
      '8': {'2': true},
      '10': 'channels',
    },
  ],
};

/// Descriptor for `WifiHotspotStaUsableChannels`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wifiHotspotStaUsableChannelsDescriptor =
    $convert.base64Decode(
        'ChxXaWZpSG90c3BvdFN0YVVzYWJsZUNoYW5uZWxzEh4KCGNoYW5uZWxzGAEgAygFQgIQAVIIY2'
        'hhbm5lbHM=');

@$core.Deprecated('Use mediumRoleDescriptor instead')
const MediumRole$json = {
  '1': 'MediumRole',
  '2': [
    {
      '1': 'support_wifi_direct_group_owner',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'supportWifiDirectGroupOwner'
    },
    {
      '1': 'support_wifi_direct_group_client',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'supportWifiDirectGroupClient'
    },
    {
      '1': 'support_wifi_hotspot_host',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'supportWifiHotspotHost'
    },
    {
      '1': 'support_wifi_hotspot_client',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'supportWifiHotspotClient'
    },
    {
      '1': 'support_wifi_aware_publisher',
      '3': 5,
      '4': 1,
      '5': 8,
      '10': 'supportWifiAwarePublisher'
    },
    {
      '1': 'support_wifi_aware_subscriber',
      '3': 6,
      '4': 1,
      '5': 8,
      '10': 'supportWifiAwareSubscriber'
    },
    {
      '1': 'support_awdl_publisher',
      '3': 7,
      '4': 1,
      '5': 8,
      '10': 'supportAwdlPublisher'
    },
    {
      '1': 'support_awdl_subscriber',
      '3': 8,
      '4': 1,
      '5': 8,
      '10': 'supportAwdlSubscriber'
    },
  ],
};

/// Descriptor for `MediumRole`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediumRoleDescriptor = $convert.base64Decode(
    'CgpNZWRpdW1Sb2xlEkQKH3N1cHBvcnRfd2lmaV9kaXJlY3RfZ3JvdXBfb3duZXIYASABKAhSG3'
    'N1cHBvcnRXaWZpRGlyZWN0R3JvdXBPd25lchJGCiBzdXBwb3J0X3dpZmlfZGlyZWN0X2dyb3Vw'
    'X2NsaWVudBgCIAEoCFIcc3VwcG9ydFdpZmlEaXJlY3RHcm91cENsaWVudBI5ChlzdXBwb3J0X3'
    'dpZmlfaG90c3BvdF9ob3N0GAMgASgIUhZzdXBwb3J0V2lmaUhvdHNwb3RIb3N0Ej0KG3N1cHBv'
    'cnRfd2lmaV9ob3RzcG90X2NsaWVudBgEIAEoCFIYc3VwcG9ydFdpZmlIb3RzcG90Q2xpZW50Ej'
    '8KHHN1cHBvcnRfd2lmaV9hd2FyZV9wdWJsaXNoZXIYBSABKAhSGXN1cHBvcnRXaWZpQXdhcmVQ'
    'dWJsaXNoZXISQQodc3VwcG9ydF93aWZpX2F3YXJlX3N1YnNjcmliZXIYBiABKAhSGnN1cHBvcn'
    'RXaWZpQXdhcmVTdWJzY3JpYmVyEjQKFnN1cHBvcnRfYXdkbF9wdWJsaXNoZXIYByABKAhSFHN1'
    'cHBvcnRBd2RsUHVibGlzaGVyEjYKF3N1cHBvcnRfYXdkbF9zdWJzY3JpYmVyGAggASgIUhVzdX'
    'Bwb3J0QXdkbFN1YnNjcmliZXI=');

@$core.Deprecated('Use locationHintDescriptor instead')
const LocationHint$json = {
  '1': 'LocationHint',
  '2': [
    {'1': 'location', '3': 1, '4': 1, '5': 9, '10': 'location'},
    {
      '1': 'format',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.location.nearby.connections.LocationStandard.Format',
      '10': 'format'
    },
  ],
};

/// Descriptor for `LocationHint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationHintDescriptor = $convert.base64Decode(
    'CgxMb2NhdGlvbkhpbnQSGgoIbG9jYXRpb24YASABKAlSCGxvY2F0aW9uEkwKBmZvcm1hdBgCIA'
    'EoDjI0LmxvY2F0aW9uLm5lYXJieS5jb25uZWN0aW9ucy5Mb2NhdGlvblN0YW5kYXJkLkZvcm1h'
    'dFIGZm9ybWF0');

@$core.Deprecated('Use locationStandardDescriptor instead')
const LocationStandard$json = {
  '1': 'LocationStandard',
  '4': [LocationStandard_Format$json],
};

@$core.Deprecated('Use locationStandardDescriptor instead')
const LocationStandard_Format$json = {
  '1': 'Format',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'E164_CALLING', '2': 1},
    {'1': 'ISO_3166_1_ALPHA_2', '2': 2},
  ],
};

/// Descriptor for `LocationStandard`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationStandardDescriptor = $convert.base64Decode(
    'ChBMb2NhdGlvblN0YW5kYXJkIj8KBkZvcm1hdBILCgdVTktOT1dOEAASEAoMRTE2NF9DQUxMSU'
    '5HEAESFgoSSVNPXzMxNjZfMV9BTFBIQV8yEAI=');

@$core.Deprecated('Use osInfoDescriptor instead')
const OsInfo$json = {
  '1': 'OsInfo',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.location.nearby.connections.OsInfo.OsType',
      '10': 'type'
    },
  ],
  '4': [OsInfo_OsType$json],
};

@$core.Deprecated('Use osInfoDescriptor instead')
const OsInfo_OsType$json = {
  '1': 'OsType',
  '2': [
    {'1': 'UNKNOWN_OS_TYPE', '2': 0},
    {'1': 'ANDROID', '2': 1},
    {'1': 'CHROME_OS', '2': 2},
    {'1': 'WINDOWS', '2': 3},
    {'1': 'APPLE', '2': 4},
    {'1': 'LINUX', '2': 100},
  ],
};

/// Descriptor for `OsInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List osInfoDescriptor = $convert.base64Decode(
    'CgZPc0luZm8SPgoEdHlwZRgBIAEoDjIqLmxvY2F0aW9uLm5lYXJieS5jb25uZWN0aW9ucy5Pc0'
    'luZm8uT3NUeXBlUgR0eXBlIlwKBk9zVHlwZRITCg9VTktOT1dOX09TX1RZUEUQABILCgdBTkRS'
    'T0lEEAESDQoJQ0hST01FX09TEAISCwoHV0lORE9XUxADEgkKBUFQUExFEAQSCQoFTElOVVgQZA'
    '==');

@$core.Deprecated('Use connectionsDeviceDescriptor instead')
const ConnectionsDevice$json = {
  '1': 'ConnectionsDevice',
  '2': [
    {'1': 'endpoint_id', '3': 1, '4': 1, '5': 9, '10': 'endpointId'},
    {
      '1': 'endpoint_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.location.nearby.connections.EndpointType',
      '10': 'endpointType'
    },
    {
      '1': 'connectivity_info_list',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'connectivityInfoList'
    },
    {'1': 'endpoint_info', '3': 4, '4': 1, '5': 12, '10': 'endpointInfo'},
  ],
};

/// Descriptor for `ConnectionsDevice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectionsDeviceDescriptor = $convert.base64Decode(
    'ChFDb25uZWN0aW9uc0RldmljZRIfCgtlbmRwb2ludF9pZBgBIAEoCVIKZW5kcG9pbnRJZBJOCg'
    '1lbmRwb2ludF90eXBlGAIgASgOMikubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLkVuZHBv'
    'aW50VHlwZVIMZW5kcG9pbnRUeXBlEjQKFmNvbm5lY3Rpdml0eV9pbmZvX2xpc3QYAyABKAxSFG'
    'Nvbm5lY3Rpdml0eUluZm9MaXN0EiMKDWVuZHBvaW50X2luZm8YBCABKAxSDGVuZHBvaW50SW5m'
    'bw==');

@$core.Deprecated('Use presenceDeviceDescriptor instead')
const PresenceDevice$json = {
  '1': 'PresenceDevice',
  '2': [
    {'1': 'endpoint_id', '3': 1, '4': 1, '5': 9, '10': 'endpointId'},
    {
      '1': 'endpoint_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.location.nearby.connections.EndpointType',
      '10': 'endpointType'
    },
    {
      '1': 'connectivity_info_list',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'connectivityInfoList'
    },
    {'1': 'device_id', '3': 4, '4': 1, '5': 3, '10': 'deviceId'},
    {'1': 'device_name', '3': 5, '4': 1, '5': 9, '10': 'deviceName'},
    {
      '1': 'device_type',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.location.nearby.connections.PresenceDevice.DeviceType',
      '10': 'deviceType'
    },
    {'1': 'device_image_url', '3': 7, '4': 1, '5': 9, '10': 'deviceImageUrl'},
    {
      '1': 'discovery_medium',
      '3': 8,
      '4': 3,
      '5': 14,
      '6': '.location.nearby.connections.ConnectionRequestFrame.Medium',
      '8': {'2': true},
      '10': 'discoveryMedium',
    },
    {
      '1': 'actions',
      '3': 9,
      '4': 3,
      '5': 5,
      '8': {'2': true},
      '10': 'actions',
    },
    {
      '1': 'identity_type',
      '3': 10,
      '4': 3,
      '5': 3,
      '8': {'2': true},
      '10': 'identityType',
    },
  ],
  '4': [PresenceDevice_DeviceType$json],
};

@$core.Deprecated('Use presenceDeviceDescriptor instead')
const PresenceDevice_DeviceType$json = {
  '1': 'DeviceType',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'PHONE', '2': 1},
    {'1': 'TABLET', '2': 2},
    {'1': 'DISPLAY', '2': 3},
    {'1': 'LAPTOP', '2': 4},
    {'1': 'TV', '2': 5},
    {'1': 'WATCH', '2': 6},
  ],
};

/// Descriptor for `PresenceDevice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List presenceDeviceDescriptor = $convert.base64Decode(
    'Cg5QcmVzZW5jZURldmljZRIfCgtlbmRwb2ludF9pZBgBIAEoCVIKZW5kcG9pbnRJZBJOCg1lbm'
    'Rwb2ludF90eXBlGAIgASgOMikubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLkVuZHBvaW50'
    'VHlwZVIMZW5kcG9pbnRUeXBlEjQKFmNvbm5lY3Rpdml0eV9pbmZvX2xpc3QYAyABKAxSFGNvbm'
    '5lY3Rpdml0eUluZm9MaXN0EhsKCWRldmljZV9pZBgEIAEoA1IIZGV2aWNlSWQSHwoLZGV2aWNl'
    'X25hbWUYBSABKAlSCmRldmljZU5hbWUSVwoLZGV2aWNlX3R5cGUYBiABKA4yNi5sb2NhdGlvbi'
    '5uZWFyYnkuY29ubmVjdGlvbnMuUHJlc2VuY2VEZXZpY2UuRGV2aWNlVHlwZVIKZGV2aWNlVHlw'
    'ZRIoChBkZXZpY2VfaW1hZ2VfdXJsGAcgASgJUg5kZXZpY2VJbWFnZVVybBJpChBkaXNjb3Zlcn'
    'lfbWVkaXVtGAggAygOMjoubG9jYXRpb24ubmVhcmJ5LmNvbm5lY3Rpb25zLkNvbm5lY3Rpb25S'
    'ZXF1ZXN0RnJhbWUuTWVkaXVtQgIQAVIPZGlzY292ZXJ5TWVkaXVtEhwKB2FjdGlvbnMYCSADKA'
    'VCAhABUgdhY3Rpb25zEicKDWlkZW50aXR5X3R5cGUYCiADKANCAhABUgxpZGVudGl0eVR5cGUi'
    'XAoKRGV2aWNlVHlwZRILCgdVTktOT1dOEAASCQoFUEhPTkUQARIKCgZUQUJMRVQQAhILCgdESV'
    'NQTEFZEAMSCgoGTEFQVE9QEAQSBgoCVFYQBRIJCgVXQVRDSBAG');
