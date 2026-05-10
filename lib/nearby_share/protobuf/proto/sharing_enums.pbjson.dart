// This is a generated file - do not edit.
//
// Generated from proto/sharing_enums.proto.

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

@$core.Deprecated('Use eventTypeDescriptor instead')
const EventType$json = {
  '1': 'EventType',
  '2': [
    {'1': 'UNKNOWN_EVENT_TYPE', '2': 0},
    {'1': 'ACCEPT_AGREEMENTS', '2': 1},
    {'1': 'ENABLE_NEARBY_SHARING', '2': 2},
    {'1': 'SET_VISIBILITY', '2': 3},
    {'1': 'DESCRIBE_ATTACHMENTS', '2': 4},
    {'1': 'SCAN_FOR_SHARE_TARGETS_START', '2': 5},
    {'1': 'SCAN_FOR_SHARE_TARGETS_END', '2': 6},
    {'1': 'ADVERTISE_DEVICE_PRESENCE_START', '2': 7},
    {'1': 'ADVERTISE_DEVICE_PRESENCE_END', '2': 8},
    {'1': 'SEND_FAST_INITIALIZATION', '2': 9},
    {'1': 'RECEIVE_FAST_INITIALIZATION', '2': 10},
    {'1': 'DISCOVER_SHARE_TARGET', '2': 11},
    {'1': 'SEND_INTRODUCTION', '2': 12},
    {'1': 'RECEIVE_INTRODUCTION', '2': 13},
    {'1': 'RESPOND_TO_INTRODUCTION', '2': 14},
    {'1': 'SEND_ATTACHMENTS_START', '2': 15},
    {'1': 'SEND_ATTACHMENTS_END', '2': 16},
    {'1': 'RECEIVE_ATTACHMENTS_START', '2': 17},
    {'1': 'RECEIVE_ATTACHMENTS_END', '2': 18},
    {'1': 'CANCEL_SENDING_ATTACHMENTS', '2': 19},
    {'1': 'CANCEL_RECEIVING_ATTACHMENTS', '2': 20},
    {'1': 'OPEN_RECEIVED_ATTACHMENTS', '2': 21},
    {
      '1': 'LAUNCH_SETUP_ACTIVITY',
      '2': 22,
      '3': {'1': true},
    },
    {'1': 'ADD_CONTACT', '2': 23},
    {'1': 'REMOVE_CONTACT', '2': 24},
    {'1': 'FAST_SHARE_SERVER_RESPONSE', '2': 25},
    {'1': 'SEND_START', '2': 26},
    {'1': 'ACCEPT_FAST_INITIALIZATION', '2': 27},
    {'1': 'SET_DATA_USAGE', '2': 28},
    {'1': 'DISMISS_FAST_INITIALIZATION', '2': 29},
    {'1': 'CANCEL_CONNECTION', '2': 30},
    {'1': 'LAUNCH_ACTIVITY', '2': 31},
    {'1': 'DISMISS_PRIVACY_NOTIFICATION', '2': 32},
    {'1': 'TAP_PRIVACY_NOTIFICATION', '2': 33},
    {'1': 'TAP_HELP', '2': 34},
    {'1': 'TAP_FEEDBACK', '2': 35},
    {'1': 'ADD_QUICK_SETTINGS_TILE', '2': 36},
    {'1': 'REMOVE_QUICK_SETTINGS_TILE', '2': 37},
    {'1': 'LAUNCH_PHONE_CONSENT', '2': 38},
    {'1': 'DISPLAY_PHONE_CONSENT', '2': 54},
    {'1': 'TAP_QUICK_SETTINGS_TILE', '2': 39},
    {'1': 'INSTALL_APK', '2': 40},
    {'1': 'VERIFY_APK', '2': 41},
    {'1': 'LAUNCH_CONSENT', '2': 42},
    {'1': 'PROCESS_RECEIVED_ATTACHMENTS_END', '2': 43},
    {'1': 'TOGGLE_SHOW_NOTIFICATION', '2': 44},
    {'1': 'SET_DEVICE_NAME', '2': 45},
    {'1': 'DECLINE_AGREEMENTS', '2': 46},
    {'1': 'REQUEST_SETTING_PERMISSIONS', '2': 47},
    {'1': 'ESTABLISH_CONNECTION', '2': 48},
    {'1': 'DEVICE_SETTINGS', '2': 49},
    {'1': 'AUTO_DISMISS_FAST_INITIALIZATION', '2': 50},
    {'1': 'APP_CRASH', '2': 51},
    {'1': 'TAP_QUICK_SETTINGS_FILE_SHARE', '2': 52},
    {'1': 'DISPLAY_PRIVACY_NOTIFICATION', '2': 53},
    {'1': 'PREFERENCES_USAGE', '2': 55},
    {'1': 'DEFAULT_OPT_IN', '2': 56},
    {'1': 'SETUP_WIZARD', '2': 57},
    {'1': 'TAP_QR_CODE', '2': 58},
    {'1': 'QR_CODE_LINK_SHOWN', '2': 59},
    {'1': 'PARSING_FAILED_ENDPOINT_ID', '2': 60},
    {'1': 'FAST_INIT_DISCOVER_DEVICE', '2': 61},
    {'1': 'SEND_DESKTOP_NOTIFICATION', '2': 62},
    {'1': 'SET_ACCOUNT', '2': 63},
    {'1': 'DECRYPT_CERTIFICATE_FAILURE', '2': 64},
    {'1': 'SHOW_ALLOW_PERMISSION_AUTO_ACCESS', '2': 65},
    {'1': 'SEND_DESKTOP_TRANSFER_EVENT', '2': 66},
    {'1': 'WAITING_FOR_ACCEPT', '2': 67},
    {'1': 'HIGH_QUALITY_MEDIUM_SETUP', '2': 68},
    {'1': 'RPC_CALL_STATUS', '2': 69},
    {'1': 'START_QR_CODE_SESSION', '2': 70},
    {'1': 'QR_CODE_OPENED_IN_WEB_CLIENT', '2': 71},
    {'1': 'HATS_JOINT_EVENT', '2': 72},
    {'1': 'RECEIVE_PREVIEWS', '2': 73},
    {'1': 'CLOUD_CREATE_SHARING_REQUEST', '2': 74},
    {'1': 'CLOUD_REGISTER_RECEIVER', '2': 75},
    {'1': 'CLOUD_UPLOAD_START', '2': 76},
    {'1': 'CLOUD_UPLOAD_END', '2': 77},
    {'1': 'CLOUD_DOWNLOAD_START', '2': 78},
    {'1': 'CLOUD_DOWNLOAD_END', '2': 79},
    {'1': 'CLOUD_SHARING_RPC_RESULT', '2': 80},
  ],
};

/// Descriptor for `EventType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List eventTypeDescriptor = $convert.base64Decode(
    'CglFdmVudFR5cGUSFgoSVU5LTk9XTl9FVkVOVF9UWVBFEAASFQoRQUNDRVBUX0FHUkVFTUVOVF'
    'MQARIZChVFTkFCTEVfTkVBUkJZX1NIQVJJTkcQAhISCg5TRVRfVklTSUJJTElUWRADEhgKFERF'
    'U0NSSUJFX0FUVEFDSE1FTlRTEAQSIAocU0NBTl9GT1JfU0hBUkVfVEFSR0VUU19TVEFSVBAFEh'
    '4KGlNDQU5fRk9SX1NIQVJFX1RBUkdFVFNfRU5EEAYSIwofQURWRVJUSVNFX0RFVklDRV9QUkVT'
    'RU5DRV9TVEFSVBAHEiEKHUFEVkVSVElTRV9ERVZJQ0VfUFJFU0VOQ0VfRU5EEAgSHAoYU0VORF'
    '9GQVNUX0lOSVRJQUxJWkFUSU9OEAkSHwobUkVDRUlWRV9GQVNUX0lOSVRJQUxJWkFUSU9OEAoS'
    'GQoVRElTQ09WRVJfU0hBUkVfVEFSR0VUEAsSFQoRU0VORF9JTlRST0RVQ1RJT04QDBIYChRSRU'
    'NFSVZFX0lOVFJPRFVDVElPThANEhsKF1JFU1BPTkRfVE9fSU5UUk9EVUNUSU9OEA4SGgoWU0VO'
    'RF9BVFRBQ0hNRU5UU19TVEFSVBAPEhgKFFNFTkRfQVRUQUNITUVOVFNfRU5EEBASHQoZUkVDRU'
    'lWRV9BVFRBQ0hNRU5UU19TVEFSVBAREhsKF1JFQ0VJVkVfQVRUQUNITUVOVFNfRU5EEBISHgoa'
    'Q0FOQ0VMX1NFTkRJTkdfQVRUQUNITUVOVFMQExIgChxDQU5DRUxfUkVDRUlWSU5HX0FUVEFDSE'
    '1FTlRTEBQSHQoZT1BFTl9SRUNFSVZFRF9BVFRBQ0hNRU5UUxAVEh0KFUxBVU5DSF9TRVRVUF9B'
    'Q1RJVklUWRAWGgIIARIPCgtBRERfQ09OVEFDVBAXEhIKDlJFTU9WRV9DT05UQUNUEBgSHgoaRk'
    'FTVF9TSEFSRV9TRVJWRVJfUkVTUE9OU0UQGRIOCgpTRU5EX1NUQVJUEBoSHgoaQUNDRVBUX0ZB'
    'U1RfSU5JVElBTElaQVRJT04QGxISCg5TRVRfREFUQV9VU0FHRRAcEh8KG0RJU01JU1NfRkFTVF'
    '9JTklUSUFMSVpBVElPThAdEhUKEUNBTkNFTF9DT05ORUNUSU9OEB4SEwoPTEFVTkNIX0FDVElW'
    'SVRZEB8SIAocRElTTUlTU19QUklWQUNZX05PVElGSUNBVElPThAgEhwKGFRBUF9QUklWQUNZX0'
    '5PVElGSUNBVElPThAhEgwKCFRBUF9IRUxQECISEAoMVEFQX0ZFRURCQUNLECMSGwoXQUREX1FV'
    'SUNLX1NFVFRJTkdTX1RJTEUQJBIeChpSRU1PVkVfUVVJQ0tfU0VUVElOR1NfVElMRRAlEhgKFE'
    'xBVU5DSF9QSE9ORV9DT05TRU5UECYSGQoVRElTUExBWV9QSE9ORV9DT05TRU5UEDYSGwoXVEFQ'
    'X1FVSUNLX1NFVFRJTkdTX1RJTEUQJxIPCgtJTlNUQUxMX0FQSxAoEg4KClZFUklGWV9BUEsQKR'
    'ISCg5MQVVOQ0hfQ09OU0VOVBAqEiQKIFBST0NFU1NfUkVDRUlWRURfQVRUQUNITUVOVFNfRU5E'
    'ECsSHAoYVE9HR0xFX1NIT1dfTk9USUZJQ0FUSU9OECwSEwoPU0VUX0RFVklDRV9OQU1FEC0SFg'
    'oSREVDTElORV9BR1JFRU1FTlRTEC4SHwobUkVRVUVTVF9TRVRUSU5HX1BFUk1JU1NJT05TEC8S'
    'GAoURVNUQUJMSVNIX0NPTk5FQ1RJT04QMBITCg9ERVZJQ0VfU0VUVElOR1MQMRIkCiBBVVRPX0'
    'RJU01JU1NfRkFTVF9JTklUSUFMSVpBVElPThAyEg0KCUFQUF9DUkFTSBAzEiEKHVRBUF9RVUlD'
    'S19TRVRUSU5HU19GSUxFX1NIQVJFEDQSIAocRElTUExBWV9QUklWQUNZX05PVElGSUNBVElPTh'
    'A1EhUKEVBSRUZFUkVOQ0VTX1VTQUdFEDcSEgoOREVGQVVMVF9PUFRfSU4QOBIQCgxTRVRVUF9X'
    'SVpBUkQQORIPCgtUQVBfUVJfQ09ERRA6EhYKElFSX0NPREVfTElOS19TSE9XThA7Eh4KGlBBUl'
    'NJTkdfRkFJTEVEX0VORFBPSU5UX0lEEDwSHQoZRkFTVF9JTklUX0RJU0NPVkVSX0RFVklDRRA9'
    'Eh0KGVNFTkRfREVTS1RPUF9OT1RJRklDQVRJT04QPhIPCgtTRVRfQUNDT1VOVBA/Eh8KG0RFQ1'
    'JZUFRfQ0VSVElGSUNBVEVfRkFJTFVSRRBAEiUKIVNIT1dfQUxMT1dfUEVSTUlTU0lPTl9BVVRP'
    'X0FDQ0VTUxBBEh8KG1NFTkRfREVTS1RPUF9UUkFOU0ZFUl9FVkVOVBBCEhYKEldBSVRJTkdfRk'
    '9SX0FDQ0VQVBBDEh0KGUhJR0hfUVVBTElUWV9NRURJVU1fU0VUVVAQRBITCg9SUENfQ0FMTF9T'
    'VEFUVVMQRRIZChVTVEFSVF9RUl9DT0RFX1NFU1NJT04QRhIgChxRUl9DT0RFX09QRU5FRF9JTl'
    '9XRUJfQ0xJRU5UEEcSFAoQSEFUU19KT0lOVF9FVkVOVBBIEhQKEFJFQ0VJVkVfUFJFVklFV1MQ'
    'SRIgChxDTE9VRF9DUkVBVEVfU0hBUklOR19SRVFVRVNUEEoSGwoXQ0xPVURfUkVHSVNURVJfUk'
    'VDRUlWRVIQSxIWChJDTE9VRF9VUExPQURfU1RBUlQQTBIUChBDTE9VRF9VUExPQURfRU5EEE0S'
    'GAoUQ0xPVURfRE9XTkxPQURfU1RBUlQQThIWChJDTE9VRF9ET1dOTE9BRF9FTkQQTxIcChhDTE'
    '9VRF9TSEFSSU5HX1JQQ19SRVNVTFQQUA==');

@$core.Deprecated('Use eventCategoryDescriptor instead')
const EventCategory$json = {
  '1': 'EventCategory',
  '2': [
    {'1': 'UNKNOWN_EVENT_CATEGORY', '2': 0},
    {'1': 'SENDING_EVENT', '2': 1},
    {'1': 'RECEIVING_EVENT', '2': 2},
    {'1': 'SETTINGS_EVENT', '2': 3},
    {'1': 'RPC_EVENT', '2': 4},
  ],
};

/// Descriptor for `EventCategory`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List eventCategoryDescriptor = $convert.base64Decode(
    'Cg1FdmVudENhdGVnb3J5EhoKFlVOS05PV05fRVZFTlRfQ0FURUdPUlkQABIRCg1TRU5ESU5HX0'
    'VWRU5UEAESEwoPUkVDRUlWSU5HX0VWRU5UEAISEgoOU0VUVElOR1NfRVZFTlQQAxINCglSUENf'
    'RVZFTlQQBA==');

@$core.Deprecated('Use nearbySharingStatusDescriptor instead')
const NearbySharingStatus$json = {
  '1': 'NearbySharingStatus',
  '2': [
    {'1': 'UNKNOWN_NEARBY_SHARING_STATUS', '2': 0},
    {'1': 'ON', '2': 1},
    {'1': 'OFF', '2': 2},
  ],
};

/// Descriptor for `NearbySharingStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List nearbySharingStatusDescriptor = $convert.base64Decode(
    'ChNOZWFyYnlTaGFyaW5nU3RhdHVzEiEKHVVOS05PV05fTkVBUkJZX1NIQVJJTkdfU1RBVFVTEA'
    'ASBgoCT04QARIHCgNPRkYQAg==');

@$core.Deprecated('Use visibilityDescriptor instead')
const Visibility$json = {
  '1': 'Visibility',
  '2': [
    {'1': 'UNKNOWN_VISIBILITY', '2': 0},
    {'1': 'CONTACTS_ONLY', '2': 1},
    {'1': 'EVERYONE', '2': 2},
    {
      '1': 'SELECTED_CONTACTS_ONLY',
      '2': 3,
      '3': {'1': true},
    },
    {'1': 'HIDDEN', '2': 4},
    {'1': 'SELF_SHARE', '2': 5},
  ],
};

/// Descriptor for `Visibility`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List visibilityDescriptor = $convert.base64Decode(
    'CgpWaXNpYmlsaXR5EhYKElVOS05PV05fVklTSUJJTElUWRAAEhEKDUNPTlRBQ1RTX09OTFkQAR'
    'IMCghFVkVSWU9ORRACEh4KFlNFTEVDVEVEX0NPTlRBQ1RTX09OTFkQAxoCCAESCgoGSElEREVO'
    'EAQSDgoKU0VMRl9TSEFSRRAF');

@$core.Deprecated('Use dataUsageDescriptor instead')
const DataUsage$json = {
  '1': 'DataUsage',
  '2': [
    {'1': 'UNKNOWN_DATA_USAGE', '2': 0},
    {'1': 'ONLINE', '2': 1},
    {'1': 'WIFI_ONLY', '2': 2},
    {'1': 'OFFLINE', '2': 3},
  ],
};

/// Descriptor for `DataUsage`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dataUsageDescriptor = $convert.base64Decode(
    'CglEYXRhVXNhZ2USFgoSVU5LTk9XTl9EQVRBX1VTQUdFEAASCgoGT05MSU5FEAESDQoJV0lGSV'
    '9PTkxZEAISCwoHT0ZGTElORRAD');

@$core.Deprecated('Use establishConnectionStatusDescriptor instead')
const EstablishConnectionStatus$json = {
  '1': 'EstablishConnectionStatus',
  '2': [
    {'1': 'CONNECTION_STATUS_UNKNOWN', '2': 0},
    {'1': 'CONNECTION_STATUS_SUCCESS', '2': 1},
    {'1': 'CONNECTION_STATUS_FAILURE', '2': 2},
    {'1': 'CONNECTION_STATUS_CANCELLATION', '2': 3},
    {'1': 'CONNECTION_STATUS_MEDIA_UNAVAILABLE_ATTACHMENT', '2': 4},
    {'1': 'CONNECTION_STATUS_FAILED_PAIRED_KEYHANDSHAKE', '2': 5},
    {'1': 'CONNECTION_STATUS_FAILED_WRITE_INTRODUCTION', '2': 6},
    {'1': 'CONNECTION_STATUS_FAILED_NULL_CONNECTION', '2': 7},
    {'1': 'CONNECTION_STATUS_FAILED_NO_TRANSFER_UPDATE_CALLBACK', '2': 8},
    {'1': 'CONNECTION_STATUS_LOST_CONNECTIVITY', '2': 9},
    {'1': 'CONNECTION_STATUS_INVALID_ADVERTISEMENT', '2': 10},
  ],
};

/// Descriptor for `EstablishConnectionStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List establishConnectionStatusDescriptor = $convert.base64Decode(
    'ChlFc3RhYmxpc2hDb25uZWN0aW9uU3RhdHVzEh0KGUNPTk5FQ1RJT05fU1RBVFVTX1VOS05PV0'
    '4QABIdChlDT05ORUNUSU9OX1NUQVRVU19TVUNDRVNTEAESHQoZQ09OTkVDVElPTl9TVEFUVVNf'
    'RkFJTFVSRRACEiIKHkNPTk5FQ1RJT05fU1RBVFVTX0NBTkNFTExBVElPThADEjIKLkNPTk5FQ1'
    'RJT05fU1RBVFVTX01FRElBX1VOQVZBSUxBQkxFX0FUVEFDSE1FTlQQBBIwCixDT05ORUNUSU9O'
    'X1NUQVRVU19GQUlMRURfUEFJUkVEX0tFWUhBTkRTSEFLRRAFEi8KK0NPTk5FQ1RJT05fU1RBVF'
    'VTX0ZBSUxFRF9XUklURV9JTlRST0RVQ1RJT04QBhIsCihDT05ORUNUSU9OX1NUQVRVU19GQUlM'
    'RURfTlVMTF9DT05ORUNUSU9OEAcSOAo0Q09OTkVDVElPTl9TVEFUVVNfRkFJTEVEX05PX1RSQU'
    '5TRkVSX1VQREFURV9DQUxMQkFDSxAIEicKI0NPTk5FQ1RJT05fU1RBVFVTX0xPU1RfQ09OTkVD'
    'VElWSVRZEAkSKwonQ09OTkVDVElPTl9TVEFUVVNfSU5WQUxJRF9BRFZFUlRJU0VNRU5UEAo=');

@$core.Deprecated('Use attachmentTransmissionStatusDescriptor instead')
const AttachmentTransmissionStatus$json = {
  '1': 'AttachmentTransmissionStatus',
  '2': [
    {'1': 'UNKNOWN_ATTACHMENT_TRANSMISSION_STATUS', '2': 0},
    {'1': 'COMPLETE_ATTACHMENT_TRANSMISSION_STATUS', '2': 1},
    {'1': 'CANCELED_ATTACHMENT_TRANSMISSION_STATUS', '2': 2},
    {'1': 'FAILED_ATTACHMENT_TRANSMISSION_STATUS', '2': 3},
    {
      '1': 'REJECTED_ATTACHMENT',
      '2': 4,
      '3': {'1': true},
    },
    {
      '1': 'TIMED_OUT_ATTACHMENT',
      '2': 5,
      '3': {'1': true},
    },
    {
      '1': 'AWAITING_REMOTE_ACCEPTANCE_FAILED_ATTACHMENT',
      '2': 6,
      '3': {'1': true},
    },
    {
      '1': 'NOT_ENOUGH_SPACE_ATTACHMENT',
      '2': 7,
      '3': {'1': true},
    },
    {
      '1': 'FAILED_NO_TRANSFER_UPDATE_CALLBACK',
      '2': 8,
      '3': {'1': true},
    },
    {
      '1': 'MEDIA_UNAVAILABLE_ATTACHMENT',
      '2': 9,
      '3': {'1': true},
    },
    {
      '1': 'UNSUPPORTED_ATTACHMENT_TYPE_ATTACHMENT',
      '2': 10,
      '3': {'1': true},
    },
    {
      '1': 'NO_ATTACHMENT_FOUND',
      '2': 11,
      '3': {'1': true},
    },
    {
      '1': 'FAILED_NO_SHARE_TARGET_ENDPOINT',
      '2': 12,
      '3': {'1': true},
    },
    {
      '1': 'FAILED_PAIRED_KEYHANDSHAKE',
      '2': 13,
      '3': {'1': true},
    },
    {
      '1': 'FAILED_NULL_CONNECTION',
      '2': 14,
      '3': {'1': true},
    },
    {
      '1': 'FAILED_NO_PAYLOAD',
      '2': 15,
      '3': {'1': true},
    },
    {
      '1': 'FAILED_WRITE_INTRODUCTION',
      '2': 16,
      '3': {'1': true},
    },
    {
      '1': 'FAILED_UNKNOWN_REMOTE_RESPONSE',
      '2': 17,
      '3': {'1': true},
    },
    {'1': 'FAILED_NULL_CONNECTION_INIT_OUTGOING', '2': 18},
    {'1': 'FAILED_NULL_CONNECTION_DISCONNECTED', '2': 19},
    {
      '1': 'FAILED_NULL_CONNECTION_LOST_CONNECTIVITY',
      '2': 20,
      '3': {'1': true},
    },
    {
      '1': 'FAILED_NULL_CONNECTION_FAILURE',
      '2': 21,
      '3': {'1': true},
    },
    {'1': 'REJECTED_ATTACHMENT_TRANSMISSION_STATUS', '2': 22},
    {'1': 'TIMED_OUT_ATTACHMENT_TRANSMISSION_STATUS', '2': 23},
    {'1': 'NOT_ENOUGH_SPACE_ATTACHMENT_TRANSMISSION_STATUS', '2': 24},
    {
      '1': 'UNSUPPORTED_ATTACHMENT_TYPE_ATTACHMENT_TRANSMISSION_STATUS',
      '2': 25
    },
    {'1': 'FAILED_UNKNOWN_REMOTE_RESPONSE_TRANSMISSION_STATUS', '2': 26},
    {
      '1':
          'NO_RESPONSE_FRAME_CONNECTION_CLOSED_LOST_CONNECTIVITY_TRANSMISSION_STATUS',
      '2': 27,
      '3': {'1': true},
    },
    {'1': 'NO_RESPONSE_FRAME_CONNECTION_CLOSED_TRANSMISSION_STATUS', '2': 28},
    {'1': 'LOST_CONNECTIVITY_TRANSMISSION_STATUS', '2': 29},
    {'1': 'FAILED_DISALLOWED_MEDIUM', '2': 30},
  ],
};

/// Descriptor for `AttachmentTransmissionStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List attachmentTransmissionStatusDescriptor = $convert.base64Decode(
    'ChxBdHRhY2htZW50VHJhbnNtaXNzaW9uU3RhdHVzEioKJlVOS05PV05fQVRUQUNITUVOVF9UUk'
    'FOU01JU1NJT05fU1RBVFVTEAASKwonQ09NUExFVEVfQVRUQUNITUVOVF9UUkFOU01JU1NJT05f'
    'U1RBVFVTEAESKwonQ0FOQ0VMRURfQVRUQUNITUVOVF9UUkFOU01JU1NJT05fU1RBVFVTEAISKQ'
    'olRkFJTEVEX0FUVEFDSE1FTlRfVFJBTlNNSVNTSU9OX1NUQVRVUxADEhsKE1JFSkVDVEVEX0FU'
    'VEFDSE1FTlQQBBoCCAESHAoUVElNRURfT1VUX0FUVEFDSE1FTlQQBRoCCAESNAosQVdBSVRJTk'
    'dfUkVNT1RFX0FDQ0VQVEFOQ0VfRkFJTEVEX0FUVEFDSE1FTlQQBhoCCAESIwobTk9UX0VOT1VH'
    'SF9TUEFDRV9BVFRBQ0hNRU5UEAcaAggBEioKIkZBSUxFRF9OT19UUkFOU0ZFUl9VUERBVEVfQ0'
    'FMTEJBQ0sQCBoCCAESJAocTUVESUFfVU5BVkFJTEFCTEVfQVRUQUNITUVOVBAJGgIIARIuCiZV'
    'TlNVUFBPUlRFRF9BVFRBQ0hNRU5UX1RZUEVfQVRUQUNITUVOVBAKGgIIARIbChNOT19BVFRBQ0'
    'hNRU5UX0ZPVU5EEAsaAggBEicKH0ZBSUxFRF9OT19TSEFSRV9UQVJHRVRfRU5EUE9JTlQQDBoC'
    'CAESIgoaRkFJTEVEX1BBSVJFRF9LRVlIQU5EU0hBS0UQDRoCCAESHgoWRkFJTEVEX05VTExfQ0'
    '9OTkVDVElPThAOGgIIARIZChFGQUlMRURfTk9fUEFZTE9BRBAPGgIIARIhChlGQUlMRURfV1JJ'
    'VEVfSU5UUk9EVUNUSU9OEBAaAggBEiYKHkZBSUxFRF9VTktOT1dOX1JFTU9URV9SRVNQT05TRR'
    'ARGgIIARIoCiRGQUlMRURfTlVMTF9DT05ORUNUSU9OX0lOSVRfT1VUR09JTkcQEhInCiNGQUlM'
    'RURfTlVMTF9DT05ORUNUSU9OX0RJU0NPTk5FQ1RFRBATEjAKKEZBSUxFRF9OVUxMX0NPTk5FQ1'
    'RJT05fTE9TVF9DT05ORUNUSVZJVFkQFBoCCAESJgoeRkFJTEVEX05VTExfQ09OTkVDVElPTl9G'
    'QUlMVVJFEBUaAggBEisKJ1JFSkVDVEVEX0FUVEFDSE1FTlRfVFJBTlNNSVNTSU9OX1NUQVRVUx'
    'AWEiwKKFRJTUVEX09VVF9BVFRBQ0hNRU5UX1RSQU5TTUlTU0lPTl9TVEFUVVMQFxIzCi9OT1Rf'
    'RU5PVUdIX1NQQUNFX0FUVEFDSE1FTlRfVFJBTlNNSVNTSU9OX1NUQVRVUxAYEj4KOlVOU1VQUE'
    '9SVEVEX0FUVEFDSE1FTlRfVFlQRV9BVFRBQ0hNRU5UX1RSQU5TTUlTU0lPTl9TVEFUVVMQGRI2'
    'CjJGQUlMRURfVU5LTk9XTl9SRU1PVEVfUkVTUE9OU0VfVFJBTlNNSVNTSU9OX1NUQVRVUxAaEl'
    'EKSU5PX1JFU1BPTlNFX0ZSQU1FX0NPTk5FQ1RJT05fQ0xPU0VEX0xPU1RfQ09OTkVDVElWSVRZ'
    'X1RSQU5TTUlTU0lPTl9TVEFUVVMQGxoCCAESOwo3Tk9fUkVTUE9OU0VfRlJBTUVfQ09OTkVDVE'
    'lPTl9DTE9TRURfVFJBTlNNSVNTSU9OX1NUQVRVUxAcEikKJUxPU1RfQ09OTkVDVElWSVRZX1RS'
    'QU5TTUlTU0lPTl9TVEFUVVMQHRIcChhGQUlMRURfRElTQUxMT1dFRF9NRURJVU0QHg==');

@$core.Deprecated('Use connectionLayerStatusDescriptor instead')
const ConnectionLayerStatus$json = {
  '1': 'ConnectionLayerStatus',
  '2': [
    {'1': 'CONNECTION_LAYER_STATUS_UNKNOWN', '2': 0},
    {'1': 'CONNECTION_LAYER_STATUS_SUCCESS', '2': 1},
    {'1': 'CONNECTION_LAYER_STATUS_ERROR', '2': 2},
    {'1': 'CONNECTION_LAYER_STATUS_OUT_OF_ORDER_API_CALL', '2': 3},
    {'1': 'CONNECTION_LAYER_STATUS_ALREADY_HAVE_ACTIVE_STRATEGY', '2': 4},
    {'1': 'CONNECTION_LAYER_STATUS_ALREADY_ADVERTISING', '2': 5},
    {'1': 'CONNECTION_LAYER_STATUS_ALREADY_DISCOVERING', '2': 6},
    {'1': 'CONNECTION_LAYER_STATUS_ALREADY_LISTENING', '2': 7},
    {'1': 'CONNECTION_LAYER_STATUS_END_POINT_IO_ERROR', '2': 8},
    {'1': 'CONNECTION_LAYER_STATUS_END_POINT_UNKNOWN', '2': 9},
    {'1': 'CONNECTION_LAYER_STATUS_CONNECTION_REJECTED', '2': 10},
    {'1': 'CONNECTION_LAYER_STATUS_ALREADY_CONNECTED_TO_END_POINT', '2': 11},
    {'1': 'CONNECTION_LAYER_STATUS_NOT_CONNECTED_TO_END_POINT', '2': 12},
    {'1': 'CONNECTION_LAYER_STATUS_BLUETOOTH_ERROR', '2': 13},
    {'1': 'CONNECTION_LAYER_STATUS_BLE_ERROR', '2': 14},
    {'1': 'CONNECTION_LAYER_STATUS_WIFI_LAN_ERROR', '2': 15},
    {'1': 'CONNECTION_LAYER_STATUS_PAYLOAD_UNKNOWN', '2': 16},
    {'1': 'CONNECTION_LAYER_STATUS_RESET', '2': 17},
    {'1': 'CONNECTION_LAYER_STATUS_TIMEOUT', '2': 18},
  ],
};

/// Descriptor for `ConnectionLayerStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List connectionLayerStatusDescriptor = $convert.base64Decode(
    'ChVDb25uZWN0aW9uTGF5ZXJTdGF0dXMSIwofQ09OTkVDVElPTl9MQVlFUl9TVEFUVVNfVU5LTk'
    '9XThAAEiMKH0NPTk5FQ1RJT05fTEFZRVJfU1RBVFVTX1NVQ0NFU1MQARIhCh1DT05ORUNUSU9O'
    'X0xBWUVSX1NUQVRVU19FUlJPUhACEjEKLUNPTk5FQ1RJT05fTEFZRVJfU1RBVFVTX09VVF9PRl'
    '9PUkRFUl9BUElfQ0FMTBADEjgKNENPTk5FQ1RJT05fTEFZRVJfU1RBVFVTX0FMUkVBRFlfSEFW'
    'RV9BQ1RJVkVfU1RSQVRFR1kQBBIvCitDT05ORUNUSU9OX0xBWUVSX1NUQVRVU19BTFJFQURZX0'
    'FEVkVSVElTSU5HEAUSLworQ09OTkVDVElPTl9MQVlFUl9TVEFUVVNfQUxSRUFEWV9ESVNDT1ZF'
    'UklORxAGEi0KKUNPTk5FQ1RJT05fTEFZRVJfU1RBVFVTX0FMUkVBRFlfTElTVEVOSU5HEAcSLg'
    'oqQ09OTkVDVElPTl9MQVlFUl9TVEFUVVNfRU5EX1BPSU5UX0lPX0VSUk9SEAgSLQopQ09OTkVD'
    'VElPTl9MQVlFUl9TVEFUVVNfRU5EX1BPSU5UX1VOS05PV04QCRIvCitDT05ORUNUSU9OX0xBWU'
    'VSX1NUQVRVU19DT05ORUNUSU9OX1JFSkVDVEVEEAoSOgo2Q09OTkVDVElPTl9MQVlFUl9TVEFU'
    'VVNfQUxSRUFEWV9DT05ORUNURURfVE9fRU5EX1BPSU5UEAsSNgoyQ09OTkVDVElPTl9MQVlFUl'
    '9TVEFUVVNfTk9UX0NPTk5FQ1RFRF9UT19FTkRfUE9JTlQQDBIrCidDT05ORUNUSU9OX0xBWUVS'
    'X1NUQVRVU19CTFVFVE9PVEhfRVJST1IQDRIlCiFDT05ORUNUSU9OX0xBWUVSX1NUQVRVU19CTE'
    'VfRVJST1IQDhIqCiZDT05ORUNUSU9OX0xBWUVSX1NUQVRVU19XSUZJX0xBTl9FUlJPUhAPEisK'
    'J0NPTk5FQ1RJT05fTEFZRVJfU1RBVFVTX1BBWUxPQURfVU5LTk9XThAQEiEKHUNPTk5FQ1RJT0'
    '5fTEFZRVJfU1RBVFVTX1JFU0VUEBESIwofQ09OTkVDVElPTl9MQVlFUl9TVEFUVVNfVElNRU9V'
    'VBAS');

@$core.Deprecated('Use processReceivedAttachmentsStatusDescriptor instead')
const ProcessReceivedAttachmentsStatus$json = {
  '1': 'ProcessReceivedAttachmentsStatus',
  '2': [
    {'1': 'PROCESSING_STATUS_UNKNOWN', '2': 0},
    {'1': 'PROCESSING_STATUS_COMPLETE_PROCESSING_ATTACHMENTS', '2': 1},
    {'1': 'PROCESSING_STATUS_FAILED_MOVING_FILES', '2': 2},
    {'1': 'PROCESSING_STATUS_FAILED_RECEIVING_APK', '2': 3},
    {'1': 'PROCESSING_STATUS_FAILED_RECEIVING_TEXT', '2': 4},
    {'1': 'PROCESSING_STATUS_FAILED_RECEIVING_WIFI_CREDENTIALS', '2': 5},
  ],
};

/// Descriptor for `ProcessReceivedAttachmentsStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List processReceivedAttachmentsStatusDescriptor = $convert.base64Decode(
    'CiBQcm9jZXNzUmVjZWl2ZWRBdHRhY2htZW50c1N0YXR1cxIdChlQUk9DRVNTSU5HX1NUQVRVU1'
    '9VTktOT1dOEAASNQoxUFJPQ0VTU0lOR19TVEFUVVNfQ09NUExFVEVfUFJPQ0VTU0lOR19BVFRB'
    'Q0hNRU5UUxABEikKJVBST0NFU1NJTkdfU1RBVFVTX0ZBSUxFRF9NT1ZJTkdfRklMRVMQAhIqCi'
    'ZQUk9DRVNTSU5HX1NUQVRVU19GQUlMRURfUkVDRUlWSU5HX0FQSxADEisKJ1BST0NFU1NJTkdf'
    'U1RBVFVTX0ZBSUxFRF9SRUNFSVZJTkdfVEVYVBAEEjcKM1BST0NFU1NJTkdfU1RBVFVTX0ZBSU'
    'xFRF9SRUNFSVZJTkdfV0lGSV9DUkVERU5USUFMUxAF');

@$core.Deprecated('Use sessionStatusDescriptor instead')
const SessionStatus$json = {
  '1': 'SessionStatus',
  '2': [
    {'1': 'UNKNOWN_SESSION_STATUS', '2': 0},
    {'1': 'SUCCEEDED_SESSION_STATUS', '2': 1},
    {'1': 'FAILED_SESSION_STATUS', '2': 2},
  ],
};

/// Descriptor for `SessionStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sessionStatusDescriptor = $convert.base64Decode(
    'Cg1TZXNzaW9uU3RhdHVzEhoKFlVOS05PV05fU0VTU0lPTl9TVEFUVVMQABIcChhTVUNDRUVERU'
    'RfU0VTU0lPTl9TVEFUVVMQARIZChVGQUlMRURfU0VTU0lPTl9TVEFUVVMQAg==');

@$core.Deprecated('Use responseToIntroductionDescriptor instead')
const ResponseToIntroduction$json = {
  '1': 'ResponseToIntroduction',
  '2': [
    {'1': 'UNKNOWN_RESPONSE_TO_INTRODUCTION', '2': 0},
    {'1': 'ACCEPT_INTRODUCTION', '2': 1},
    {'1': 'REJECT_INTRODUCTION', '2': 2},
    {'1': 'FAIL_INTRODUCTION', '2': 3},
  ],
};

/// Descriptor for `ResponseToIntroduction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List responseToIntroductionDescriptor = $convert.base64Decode(
    'ChZSZXNwb25zZVRvSW50cm9kdWN0aW9uEiQKIFVOS05PV05fUkVTUE9OU0VfVE9fSU5UUk9EVU'
    'NUSU9OEAASFwoTQUNDRVBUX0lOVFJPRFVDVElPThABEhcKE1JFSkVDVF9JTlRST0RVQ1RJT04Q'
    'AhIVChFGQUlMX0lOVFJPRFVDVElPThAD');

@$core.Deprecated('Use deviceTypeDescriptor instead')
const DeviceType$json = {
  '1': 'DeviceType',
  '2': [
    {'1': 'UNKNOWN_DEVICE_TYPE', '2': 0},
    {'1': 'PHONE', '2': 1},
    {'1': 'TABLET', '2': 2},
    {'1': 'LAPTOP', '2': 3},
    {'1': 'CAR', '2': 4},
    {'1': 'FOLDABLE', '2': 5},
    {'1': 'XR', '2': 6},
  ],
};

/// Descriptor for `DeviceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List deviceTypeDescriptor = $convert.base64Decode(
    'CgpEZXZpY2VUeXBlEhcKE1VOS05PV05fREVWSUNFX1RZUEUQABIJCgVQSE9ORRABEgoKBlRBQk'
    'xFVBACEgoKBkxBUFRPUBADEgcKA0NBUhAEEgwKCEZPTERBQkxFEAUSBgoCWFIQBg==');

@$core.Deprecated('Use oSTypeDescriptor instead')
const OSType$json = {
  '1': 'OSType',
  '2': [
    {'1': 'UNKNOWN_OS_TYPE', '2': 0},
    {'1': 'ANDROID', '2': 1},
    {'1': 'CHROME_OS', '2': 2},
    {'1': 'IOS', '2': 3},
    {'1': 'WINDOWS', '2': 4},
    {'1': 'MACOS', '2': 5},
  ],
};

/// Descriptor for `OSType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List oSTypeDescriptor = $convert.base64Decode(
    'CgZPU1R5cGUSEwoPVU5LTk9XTl9PU19UWVBFEAASCwoHQU5EUk9JRBABEg0KCUNIUk9NRV9PUx'
    'ACEgcKA0lPUxADEgsKB1dJTkRPV1MQBBIJCgVNQUNPUxAF');

@$core.Deprecated('Use deviceRelationshipDescriptor instead')
const DeviceRelationship$json = {
  '1': 'DeviceRelationship',
  '2': [
    {'1': 'UNKNOWN_DEVICE_RELATIONSHIP', '2': 0},
    {'1': 'IS_SELF', '2': 1},
    {'1': 'IS_CONTACT', '2': 2},
    {'1': 'IS_STRANGER', '2': 3},
  ],
};

/// Descriptor for `DeviceRelationship`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List deviceRelationshipDescriptor = $convert.base64Decode(
    'ChJEZXZpY2VSZWxhdGlvbnNoaXASHwobVU5LTk9XTl9ERVZJQ0VfUkVMQVRJT05TSElQEAASCw'
    'oHSVNfU0VMRhABEg4KCklTX0NPTlRBQ1QQAhIPCgtJU19TVFJBTkdFUhAD');

@$core.Deprecated('Use logSourceDescriptor instead')
const LogSource$json = {
  '1': 'LogSource',
  '2': [
    {'1': 'UNSPECIFIED_SOURCE', '2': 0},
    {'1': 'LAB_DEVICES', '2': 1},
    {'1': 'INTERNAL_DEVICES', '2': 2},
    {'1': 'BETA_TESTER_DEVICES', '2': 3},
    {'1': 'OEM_DEVICES', '2': 4},
    {'1': 'DEBUG_DEVICES', '2': 5},
    {'1': 'NEARBY_MODULE_FOOD_DEVICES', '2': 6},
    {'1': 'BETO_DOGFOOD_DEVICES', '2': 7},
    {'1': 'NEARBY_DOGFOOD_DEVICES', '2': 8},
    {'1': 'NEARBY_TEAMFOOD_DEVICES', '2': 9},
  ],
};

/// Descriptor for `LogSource`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List logSourceDescriptor = $convert.base64Decode(
    'CglMb2dTb3VyY2USFgoSVU5TUEVDSUZJRURfU09VUkNFEAASDwoLTEFCX0RFVklDRVMQARIUCh'
    'BJTlRFUk5BTF9ERVZJQ0VTEAISFwoTQkVUQV9URVNURVJfREVWSUNFUxADEg8KC09FTV9ERVZJ'
    'Q0VTEAQSEQoNREVCVUdfREVWSUNFUxAFEh4KGk5FQVJCWV9NT0RVTEVfRk9PRF9ERVZJQ0VTEA'
    'YSGAoUQkVUT19ET0dGT09EX0RFVklDRVMQBxIaChZORUFSQllfRE9HRk9PRF9ERVZJQ0VTEAgS'
    'GwoXTkVBUkJZX1RFQU1GT09EX0RFVklDRVMQCQ==');

@$core.Deprecated('Use serverActionNameDescriptor instead')
const ServerActionName$json = {
  '1': 'ServerActionName',
  '2': [
    {'1': 'UNKNOWN_SERVER_ACTION', '2': 0},
    {'1': 'UPLOAD_CERTIFICATES', '2': 1},
    {'1': 'DOWNLOAD_CERTIFICATES', '2': 2},
    {'1': 'CHECK_REACHABILITY', '2': 3},
    {'1': 'UPLOAD_CONTACTS', '2': 4},
    {'1': 'UPDATE_DEVICE_NAME', '2': 5},
    {'1': 'UPLOAD_SENDER_CERTIFICATES', '2': 6},
    {'1': 'DOWNLOAD_SENDER_CERTIFICATES', '2': 7},
    {'1': 'UPLOAD_CONTACTS_AND_CERTIFICATES', '2': 8},
    {'1': 'LIST_REACHABLE_PHONE_NUMBERS', '2': 9},
    {'1': 'LIST_MY_DEVICES', '2': 10},
    {'1': 'LIST_CONTACT_PEOPLE', '2': 11},
    {'1': 'DOWNLOAD_CERTIFICATES_INFO', '2': 12},
  ],
};

/// Descriptor for `ServerActionName`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List serverActionNameDescriptor = $convert.base64Decode(
    'ChBTZXJ2ZXJBY3Rpb25OYW1lEhkKFVVOS05PV05fU0VSVkVSX0FDVElPThAAEhcKE1VQTE9BRF'
    '9DRVJUSUZJQ0FURVMQARIZChVET1dOTE9BRF9DRVJUSUZJQ0FURVMQAhIWChJDSEVDS19SRUFD'
    'SEFCSUxJVFkQAxITCg9VUExPQURfQ09OVEFDVFMQBBIWChJVUERBVEVfREVWSUNFX05BTUUQBR'
    'IeChpVUExPQURfU0VOREVSX0NFUlRJRklDQVRFUxAGEiAKHERPV05MT0FEX1NFTkRFUl9DRVJU'
    'SUZJQ0FURVMQBxIkCiBVUExPQURfQ09OVEFDVFNfQU5EX0NFUlRJRklDQVRFUxAIEiAKHExJU1'
    'RfUkVBQ0hBQkxFX1BIT05FX05VTUJFUlMQCRITCg9MSVNUX01ZX0RFVklDRVMQChIXChNMSVNU'
    'X0NPTlRBQ1RfUEVPUExFEAsSHgoaRE9XTkxPQURfQ0VSVElGSUNBVEVTX0lORk8QDA==');

@$core.Deprecated('Use serverResponseStateDescriptor instead')
const ServerResponseState$json = {
  '1': 'ServerResponseState',
  '2': [
    {'1': 'UNKNOWN_SERVER_RESPONSE_STATE', '2': 0},
    {'1': 'SERVER_RESPONSE_SUCCESS', '2': 1},
    {'1': 'SERVER_RESPONSE_UNKNOWN_FAILURE', '2': 2},
    {'1': 'SERVER_RESPONSE_STATUS_OTHER_FAILURE', '2': 3},
    {'1': 'SERVER_RESPONSE_STATUS_DEADLINE_EXCEEDED', '2': 4},
    {'1': 'SERVER_RESPONSE_STATUS_PERMISSION_DENIED', '2': 5},
    {'1': 'SERVER_RESPONSE_STATUS_UNAVAILABLE', '2': 6},
    {'1': 'SERVER_RESPONSE_STATUS_UNAUTHENTICATED', '2': 7},
    {'1': 'SERVER_RESPONSE_STATUS_INVALID_ARGUMENT', '2': 9},
    {'1': 'SERVER_RESPONSE_GOOGLE_AUTH_FAILURE', '2': 8},
    {'1': 'SERVER_RESPONSE_NOT_CONNECTED_TO_INTERNET', '2': 10},
  ],
};

/// Descriptor for `ServerResponseState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List serverResponseStateDescriptor = $convert.base64Decode(
    'ChNTZXJ2ZXJSZXNwb25zZVN0YXRlEiEKHVVOS05PV05fU0VSVkVSX1JFU1BPTlNFX1NUQVRFEA'
    'ASGwoXU0VSVkVSX1JFU1BPTlNFX1NVQ0NFU1MQARIjCh9TRVJWRVJfUkVTUE9OU0VfVU5LTk9X'
    'Tl9GQUlMVVJFEAISKAokU0VSVkVSX1JFU1BPTlNFX1NUQVRVU19PVEhFUl9GQUlMVVJFEAMSLA'
    'ooU0VSVkVSX1JFU1BPTlNFX1NUQVRVU19ERUFETElORV9FWENFRURFRBAEEiwKKFNFUlZFUl9S'
    'RVNQT05TRV9TVEFUVVNfUEVSTUlTU0lPTl9ERU5JRUQQBRImCiJTRVJWRVJfUkVTUE9OU0VfU1'
    'RBVFVTX1VOQVZBSUxBQkxFEAYSKgomU0VSVkVSX1JFU1BPTlNFX1NUQVRVU19VTkFVVEhFTlRJ'
    'Q0FURUQQBxIrCidTRVJWRVJfUkVTUE9OU0VfU1RBVFVTX0lOVkFMSURfQVJHVU1FTlQQCRInCi'
    'NTRVJWRVJfUkVTUE9OU0VfR09PR0xFX0FVVEhfRkFJTFVSRRAIEi0KKVNFUlZFUl9SRVNQT05T'
    'RV9OT1RfQ09OTkVDVEVEX1RPX0lOVEVSTkVUEAo=');

@$core.Deprecated('Use syncPurposeDescriptor instead')
const SyncPurpose$json = {
  '1': 'SyncPurpose',
  '2': [
    {'1': 'SYNC_PURPOSE_UNKNOWN', '2': 0},
    {'1': 'SYNC_PURPOSE_ON_DEMAND_SYNC', '2': 1},
    {'1': 'SYNC_PURPOSE_CHIME_NOTIFICATION', '2': 2},
    {'1': 'SYNC_PURPOSE_DAILY_SYNC', '2': 3},
    {'1': 'SYNC_PURPOSE_OPT_IN_FIRST_SYNC', '2': 4},
    {'1': 'SYNC_PURPOSE_CHECK_DEFAULT_OPT_IN', '2': 5},
    {'1': 'SYNC_PURPOSE_NEARBY_SHARE_ENABLED', '2': 6},
    {'1': 'SYNC_PURPOSE_SYNC_AT_FAST_INIT', '2': 7},
    {'1': 'SYNC_PURPOSE_SYNC_AT_DISCOVERY', '2': 8},
    {'1': 'SYNC_PURPOSE_SYNC_AT_LOAD_PRIVATE_CERTIFICATE', '2': 9},
    {'1': 'SYNC_PURPOSE_SYNC_AT_ADVERTISEMENT', '2': 10},
    {'1': 'SYNC_PURPOSE_CONTACT_LIST_CHANGE', '2': 11},
    {'1': 'SYNC_PURPOSE_SHOW_C11N_VIEW', '2': 12},
    {'1': 'SYNC_PURPOSE_REGULAR_CHECK_CONTACT_REACHABILITY', '2': 13},
    {'1': 'SYNC_PURPOSE_VISIBILITY_SELECTED_CONTACT_CHANGE', '2': 14},
    {'1': 'SYNC_PURPOSE_ACCOUNT_CHANGE', '2': 15},
    {'1': 'SYNC_PURPOSE_REGENERATE_CERTIFICATES', '2': 16},
    {'1': 'SYNC_PURPOSE_DEVICE_CONTACTS_CONSENT_CHANGE', '2': 17},
    {'1': 'SYNC_EXHAUST_SALT', '2': 18},
    {'1': 'SYNC_QUICKSHARE_IDENTITY_PROVIDER_QUERY', '2': 19},
  ],
};

/// Descriptor for `SyncPurpose`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List syncPurposeDescriptor = $convert.base64Decode(
    'CgtTeW5jUHVycG9zZRIYChRTWU5DX1BVUlBPU0VfVU5LTk9XThAAEh8KG1NZTkNfUFVSUE9TRV'
    '9PTl9ERU1BTkRfU1lOQxABEiMKH1NZTkNfUFVSUE9TRV9DSElNRV9OT1RJRklDQVRJT04QAhIb'
    'ChdTWU5DX1BVUlBPU0VfREFJTFlfU1lOQxADEiIKHlNZTkNfUFVSUE9TRV9PUFRfSU5fRklSU1'
    'RfU1lOQxAEEiUKIVNZTkNfUFVSUE9TRV9DSEVDS19ERUZBVUxUX09QVF9JThAFEiUKIVNZTkNf'
    'UFVSUE9TRV9ORUFSQllfU0hBUkVfRU5BQkxFRBAGEiIKHlNZTkNfUFVSUE9TRV9TWU5DX0FUX0'
    'ZBU1RfSU5JVBAHEiIKHlNZTkNfUFVSUE9TRV9TWU5DX0FUX0RJU0NPVkVSWRAIEjEKLVNZTkNf'
    'UFVSUE9TRV9TWU5DX0FUX0xPQURfUFJJVkFURV9DRVJUSUZJQ0FURRAJEiYKIlNZTkNfUFVSUE'
    '9TRV9TWU5DX0FUX0FEVkVSVElTRU1FTlQQChIkCiBTWU5DX1BVUlBPU0VfQ09OVEFDVF9MSVNU'
    'X0NIQU5HRRALEh8KG1NZTkNfUFVSUE9TRV9TSE9XX0MxMU5fVklFVxAMEjMKL1NZTkNfUFVSUE'
    '9TRV9SRUdVTEFSX0NIRUNLX0NPTlRBQ1RfUkVBQ0hBQklMSVRZEA0SMwovU1lOQ19QVVJQT1NF'
    'X1ZJU0lCSUxJVFlfU0VMRUNURURfQ09OVEFDVF9DSEFOR0UQDhIfChtTWU5DX1BVUlBPU0VfQU'
    'NDT1VOVF9DSEFOR0UQDxIoCiRTWU5DX1BVUlBPU0VfUkVHRU5FUkFURV9DRVJUSUZJQ0FURVMQ'
    'EBIvCitTWU5DX1BVUlBPU0VfREVWSUNFX0NPTlRBQ1RTX0NPTlNFTlRfQ0hBTkdFEBESFQoRU1'
    'lOQ19FWEhBVVNUX1NBTFQQEhIrCidTWU5DX1FVSUNLU0hBUkVfSURFTlRJVFlfUFJPVklERVJf'
    'UVVFUlkQEw==');

@$core.Deprecated('Use clientRoleDescriptor instead')
const ClientRole$json = {
  '1': 'ClientRole',
  '2': [
    {'1': 'CLIENT_ROLE_UNKNOWN', '2': 0},
    {'1': 'CLIENT_ROLE_SENDER', '2': 1},
    {'1': 'CLIENT_ROLE_RECEIVER', '2': 2},
  ],
};

/// Descriptor for `ClientRole`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List clientRoleDescriptor = $convert.base64Decode(
    'CgpDbGllbnRSb2xlEhcKE0NMSUVOVF9ST0xFX1VOS05PV04QABIWChJDTElFTlRfUk9MRV9TRU'
    '5ERVIQARIYChRDTElFTlRfUk9MRV9SRUNFSVZFUhAC');

@$core.Deprecated('Use scanTypeDescriptor instead')
const ScanType$json = {
  '1': 'ScanType',
  '2': [
    {'1': 'UNKNOWN_SCAN_TYPE', '2': 0},
    {'1': 'FOREGROUND_SCAN', '2': 1},
    {
      '1': 'FOREGROUND_RETRY_SCAN',
      '2': 2,
      '3': {'1': true},
    },
    {'1': 'DIRECT_SHARE_SCAN', '2': 3},
    {'1': 'BACKGROUND_SCAN', '2': 4},
  ],
};

/// Descriptor for `ScanType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List scanTypeDescriptor = $convert.base64Decode(
    'CghTY2FuVHlwZRIVChFVTktOT1dOX1NDQU5fVFlQRRAAEhMKD0ZPUkVHUk9VTkRfU0NBThABEh'
    '0KFUZPUkVHUk9VTkRfUkVUUllfU0NBThACGgIIARIVChFESVJFQ1RfU0hBUkVfU0NBThADEhMK'
    'D0JBQ0tHUk9VTkRfU0NBThAE');

@$core.Deprecated('Use parsingFailedTypeDescriptor instead')
const ParsingFailedType$json = {
  '1': 'ParsingFailedType',
  '2': [
    {'1': 'FAILED_UNKNOWN_TYPE', '2': 0},
    {'1': 'FAILED_PARSE_ADVERTISEMENT', '2': 1},
    {'1': 'FAILED_CONVERT_SHARE_TARGET', '2': 2},
  ],
};

/// Descriptor for `ParsingFailedType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List parsingFailedTypeDescriptor = $convert.base64Decode(
    'ChFQYXJzaW5nRmFpbGVkVHlwZRIXChNGQUlMRURfVU5LTk9XTl9UWVBFEAASHgoaRkFJTEVEX1'
    'BBUlNFX0FEVkVSVElTRU1FTlQQARIfChtGQUlMRURfQ09OVkVSVF9TSEFSRV9UQVJHRVQQAg==');

@$core.Deprecated('Use advertisingModeDescriptor instead')
const AdvertisingMode$json = {
  '1': 'AdvertisingMode',
  '2': [
    {'1': 'UNKNOWN_ADVERTISING_MODE', '2': 0},
    {'1': 'SCREEN_OFF_ADVERTISING_MODE', '2': 1},
    {'1': 'BACKGROUND_ADVERTISING_MODE', '2': 2},
    {'1': 'MIDGROUND_ADVERTISING_MODE', '2': 3},
    {'1': 'FOREGROUND_ADVERTISING_MODE', '2': 4},
    {'1': 'SUSPENDED_ADVERTISING_MODE', '2': 5},
  ],
};

/// Descriptor for `AdvertisingMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List advertisingModeDescriptor = $convert.base64Decode(
    'Cg9BZHZlcnRpc2luZ01vZGUSHAoYVU5LTk9XTl9BRFZFUlRJU0lOR19NT0RFEAASHwobU0NSRU'
    'VOX09GRl9BRFZFUlRJU0lOR19NT0RFEAESHwobQkFDS0dST1VORF9BRFZFUlRJU0lOR19NT0RF'
    'EAISHgoaTUlER1JPVU5EX0FEVkVSVElTSU5HX01PREUQAxIfChtGT1JFR1JPVU5EX0FEVkVSVE'
    'lTSU5HX01PREUQBBIeChpTVVNQRU5ERURfQURWRVJUSVNJTkdfTU9ERRAF');

@$core.Deprecated('Use discoveryModeDescriptor instead')
const DiscoveryMode$json = {
  '1': 'DiscoveryMode',
  '2': [
    {'1': 'UNKNOWN_DISCOVERY_MODE', '2': 0},
    {'1': 'SCREEN_OFF_DISCOVERY_MODE', '2': 1},
    {'1': 'BACKGROUND_DISCOVERY_MODE', '2': 2},
    {'1': 'MIDGROUND_DISCOVERY_MODE', '2': 3},
    {'1': 'FOREGROUND_DISCOVERY_MODE', '2': 4},
    {'1': 'SUSPENDED_DISCOVERY_MODE', '2': 5},
  ],
};

/// Descriptor for `DiscoveryMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List discoveryModeDescriptor = $convert.base64Decode(
    'Cg1EaXNjb3ZlcnlNb2RlEhoKFlVOS05PV05fRElTQ09WRVJZX01PREUQABIdChlTQ1JFRU5fT0'
    'ZGX0RJU0NPVkVSWV9NT0RFEAESHQoZQkFDS0dST1VORF9ESVNDT1ZFUllfTU9ERRACEhwKGE1J'
    'REdST1VORF9ESVNDT1ZFUllfTU9ERRADEh0KGUZPUkVHUk9VTkRfRElTQ09WRVJZX01PREUQBB'
    'IcChhTVVNQRU5ERURfRElTQ09WRVJZX01PREUQBQ==');

@$core.Deprecated('Use activityNameDescriptor instead')
const ActivityName$json = {
  '1': 'ActivityName',
  '2': [
    {'1': 'UNKNOWN_ACTIVITY', '2': 0},
    {'1': 'SHARE_SHEET_ACTIVITY', '2': 1},
    {'1': 'SETTINGS_ACTIVITY', '2': 2},
    {'1': 'RECEIVE_SURFACE_ACTIVITY', '2': 3},
    {'1': 'SETUP_ACTIVITY', '2': 4},
    {'1': 'DEVICE_VISIBILITY_ACTIVITY', '2': 5},
    {'1': 'CONSENTS_ACTIVITY', '2': 6},
    {'1': 'SET_DEVICE_NAME_DIALOG', '2': 7},
    {'1': 'SET_DATA_USAGE_DIALOG', '2': 8},
    {'1': 'QUICK_SETTINGS_ACTIVITY', '2': 9},
    {'1': 'REMOTE_COPY_SHARE_SHEET_ACTIVITY', '2': 10},
    {'1': 'SETUP_WIZARD_ACTIVITY', '2': 11},
    {'1': 'SETTINGS_REVIEW_ACTIVITY', '2': 12},
  ],
};

/// Descriptor for `ActivityName`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List activityNameDescriptor = $convert.base64Decode(
    'CgxBY3Rpdml0eU5hbWUSFAoQVU5LTk9XTl9BQ1RJVklUWRAAEhgKFFNIQVJFX1NIRUVUX0FDVE'
    'lWSVRZEAESFQoRU0VUVElOR1NfQUNUSVZJVFkQAhIcChhSRUNFSVZFX1NVUkZBQ0VfQUNUSVZJ'
    'VFkQAxISCg5TRVRVUF9BQ1RJVklUWRAEEh4KGkRFVklDRV9WSVNJQklMSVRZX0FDVElWSVRZEA'
    'USFQoRQ09OU0VOVFNfQUNUSVZJVFkQBhIaChZTRVRfREVWSUNFX05BTUVfRElBTE9HEAcSGQoV'
    'U0VUX0RBVEFfVVNBR0VfRElBTE9HEAgSGwoXUVVJQ0tfU0VUVElOR1NfQUNUSVZJVFkQCRIkCi'
    'BSRU1PVEVfQ09QWV9TSEFSRV9TSEVFVF9BQ1RJVklUWRAKEhkKFVNFVFVQX1dJWkFSRF9BQ1RJ'
    'VklUWRALEhwKGFNFVFRJTkdTX1JFVklFV19BQ1RJVklUWRAM');

@$core.Deprecated('Use consentTypeDescriptor instead')
const ConsentType$json = {
  '1': 'ConsentType',
  '2': [
    {'1': 'CONSENT_TYPE_UNKNOWN', '2': 0},
    {'1': 'CONSENT_TYPE_C11N', '2': 1},
    {'1': 'CONSENT_TYPE_DEVICE_CONTACT', '2': 2},
  ],
};

/// Descriptor for `ConsentType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List consentTypeDescriptor = $convert.base64Decode(
    'CgtDb25zZW50VHlwZRIYChRDT05TRU5UX1RZUEVfVU5LTk9XThAAEhUKEUNPTlNFTlRfVFlQRV'
    '9DMTFOEAESHwobQ09OU0VOVF9UWVBFX0RFVklDRV9DT05UQUNUEAI=');

@$core.Deprecated('Use consentAcceptanceStatusDescriptor instead')
const ConsentAcceptanceStatus$json = {
  '1': 'ConsentAcceptanceStatus',
  '2': [
    {'1': 'CONSENT_UNKNOWN_ACCEPT_STATUS', '2': 0},
    {'1': 'CONSENT_ACCEPTED', '2': 1},
    {'1': 'CONSENT_DECLINED', '2': 2},
    {'1': 'CONSENT_UNABLE_TO_ENABLE', '2': 3},
  ],
};

/// Descriptor for `ConsentAcceptanceStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List consentAcceptanceStatusDescriptor = $convert.base64Decode(
    'ChdDb25zZW50QWNjZXB0YW5jZVN0YXR1cxIhCh1DT05TRU5UX1VOS05PV05fQUNDRVBUX1NUQV'
    'RVUxAAEhQKEENPTlNFTlRfQUNDRVBURUQQARIUChBDT05TRU5UX0RFQ0xJTkVEEAISHAoYQ09O'
    'U0VOVF9VTkFCTEVfVE9fRU5BQkxFEAM=');

@$core.Deprecated('Use apkSourceDescriptor instead')
const ApkSource$json = {
  '1': 'ApkSource',
  '2': [
    {'1': 'UNKNOWN_APK_SOURCE', '2': 0},
    {'1': 'APK_FROM_SD_CARD', '2': 1},
    {'1': 'INSTALLED_APP', '2': 2},
  ],
};

/// Descriptor for `ApkSource`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List apkSourceDescriptor = $convert.base64Decode(
    'CglBcGtTb3VyY2USFgoSVU5LTk9XTl9BUEtfU09VUkNFEAASFAoQQVBLX0ZST01fU0RfQ0FSRB'
    'ABEhEKDUlOU1RBTExFRF9BUFAQAg==');

@$core.Deprecated('Use installAPKStatusDescriptor instead')
const InstallAPKStatus$json = {
  '1': 'InstallAPKStatus',
  '2': [
    {'1': 'UNKNOWN_INSTALL_APK_STATUS', '2': 0},
    {'1': 'FAIL_INSTALLATION', '2': 1},
    {'1': 'SUCCESS_INSTALLATION', '2': 2},
  ],
};

/// Descriptor for `InstallAPKStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List installAPKStatusDescriptor = $convert.base64Decode(
    'ChBJbnN0YWxsQVBLU3RhdHVzEh4KGlVOS05PV05fSU5TVEFMTF9BUEtfU1RBVFVTEAASFQoRRk'
    'FJTF9JTlNUQUxMQVRJT04QARIYChRTVUNDRVNTX0lOU1RBTExBVElPThAC');

@$core.Deprecated('Use verifyAPKStatusDescriptor instead')
const VerifyAPKStatus$json = {
  '1': 'VerifyAPKStatus',
  '2': [
    {'1': 'UNKNOWN_VERIFY_APK_STATUS', '2': 0},
    {'1': 'NOT_INSTALLABLE', '2': 1},
    {'1': 'INSTALLABLE', '2': 2},
    {'1': 'ALREADY_INSTALLED', '2': 3},
  ],
};

/// Descriptor for `VerifyAPKStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List verifyAPKStatusDescriptor = $convert.base64Decode(
    'Cg9WZXJpZnlBUEtTdGF0dXMSHQoZVU5LTk9XTl9WRVJJRllfQVBLX1NUQVRVUxAAEhMKD05PVF'
    '9JTlNUQUxMQUJMRRABEg8KC0lOU1RBTExBQkxFEAISFQoRQUxSRUFEWV9JTlNUQUxMRUQQAw==');

@$core.Deprecated('Use showNotificationStatusDescriptor instead')
const ShowNotificationStatus$json = {
  '1': 'ShowNotificationStatus',
  '2': [
    {'1': 'UNKNOWN_SHOW_NOTIFICATION_STATUS', '2': 0},
    {'1': 'SHOW', '2': 1},
    {'1': 'NOT_SHOW', '2': 2},
  ],
};

/// Descriptor for `ShowNotificationStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List showNotificationStatusDescriptor =
    $convert.base64Decode(
        'ChZTaG93Tm90aWZpY2F0aW9uU3RhdHVzEiQKIFVOS05PV05fU0hPV19OT1RJRklDQVRJT05fU1'
        'RBVFVTEAASCAoEU0hPVxABEgwKCE5PVF9TSE9XEAI=');

@$core.Deprecated('Use permissionRequestResultDescriptor instead')
const PermissionRequestResult$json = {
  '1': 'PermissionRequestResult',
  '2': [
    {'1': 'PERMISSION_UNKNOWN_REQUEST_RESULT', '2': 0},
    {'1': 'PERMISSION_GRANTED', '2': 1},
    {'1': 'PERMISSION_REJECTED', '2': 2},
    {'1': 'PERMISSION_UNABLE_TO_GRANT', '2': 3},
  ],
};

/// Descriptor for `PermissionRequestResult`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List permissionRequestResultDescriptor = $convert.base64Decode(
    'ChdQZXJtaXNzaW9uUmVxdWVzdFJlc3VsdBIlCiFQRVJNSVNTSU9OX1VOS05PV05fUkVRVUVTVF'
    '9SRVNVTFQQABIWChJQRVJNSVNTSU9OX0dSQU5URUQQARIXChNQRVJNSVNTSU9OX1JFSkVDVEVE'
    'EAISHgoaUEVSTUlTU0lPTl9VTkFCTEVfVE9fR1JBTlQQAw==');

@$core.Deprecated('Use permissionRequestTypeDescriptor instead')
const PermissionRequestType$json = {
  '1': 'PermissionRequestType',
  '2': [
    {'1': 'PERMISSION_UNKNOWN_TYPE', '2': 0},
    {'1': 'PERMISSION_AIRPLANE_MODE_OFF', '2': 1},
    {'1': 'PERMISSION_WIFI', '2': 2},
    {'1': 'PERMISSION_BLUETOOTH', '2': 3},
    {'1': 'PERMISSION_LOCATION', '2': 4},
    {'1': 'PERMISSION_WIFI_HOTSPOT', '2': 5},
  ],
};

/// Descriptor for `PermissionRequestType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List permissionRequestTypeDescriptor = $convert.base64Decode(
    'ChVQZXJtaXNzaW9uUmVxdWVzdFR5cGUSGwoXUEVSTUlTU0lPTl9VTktOT1dOX1RZUEUQABIgCh'
    'xQRVJNSVNTSU9OX0FJUlBMQU5FX01PREVfT0ZGEAESEwoPUEVSTUlTU0lPTl9XSUZJEAISGAoU'
    'UEVSTUlTU0lPTl9CTFVFVE9PVEgQAxIXChNQRVJNSVNTSU9OX0xPQ0FUSU9OEAQSGwoXUEVSTU'
    'lTU0lPTl9XSUZJX0hPVFNQT1QQBQ==');

@$core.Deprecated('Use sharingUseCaseDescriptor instead')
const SharingUseCase$json = {
  '1': 'SharingUseCase',
  '2': [
    {'1': 'USE_CASE_UNKNOWN', '2': 0},
    {'1': 'USE_CASE_NEARBY_SHARE', '2': 1},
    {'1': 'USE_CASE_REMOTE_COPY_PASTE', '2': 2},
    {'1': 'USE_CASE_WIFI_CREDENTIAL', '2': 3},
    {'1': 'USE_CASE_APP_SHARE', '2': 4},
    {'1': 'USE_CASE_QUICK_SETTING_FILE_SHARE', '2': 5},
    {'1': 'USE_CASE_SETUP_WIZARD', '2': 6},
    {
      '1': 'USE_CASE_NEARBY_SHARE_WITH_QR_CODE',
      '2': 7,
      '3': {'1': true},
    },
    {'1': 'USE_CASE_REDIRECTED_FROM_BLUETOOTH_SHARE', '2': 8},
  ],
};

/// Descriptor for `SharingUseCase`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sharingUseCaseDescriptor = $convert.base64Decode(
    'Cg5TaGFyaW5nVXNlQ2FzZRIUChBVU0VfQ0FTRV9VTktOT1dOEAASGQoVVVNFX0NBU0VfTkVBUk'
    'JZX1NIQVJFEAESHgoaVVNFX0NBU0VfUkVNT1RFX0NPUFlfUEFTVEUQAhIcChhVU0VfQ0FTRV9X'
    'SUZJX0NSRURFTlRJQUwQAxIWChJVU0VfQ0FTRV9BUFBfU0hBUkUQBBIlCiFVU0VfQ0FTRV9RVU'
    'lDS19TRVRUSU5HX0ZJTEVfU0hBUkUQBRIZChVVU0VfQ0FTRV9TRVRVUF9XSVpBUkQQBhIqCiJV'
    'U0VfQ0FTRV9ORUFSQllfU0hBUkVfV0lUSF9RUl9DT0RFEAcaAggBEiwKKFVTRV9DQVNFX1JFRE'
    'lSRUNURURfRlJPTV9CTFVFVE9PVEhfU0hBUkUQCA==');

@$core.Deprecated('Use appCrashReasonDescriptor instead')
const AppCrashReason$json = {
  '1': 'AppCrashReason',
  '2': [
    {'1': 'APP_CRASH_REASON_UNKNOWN', '2': 0},
  ],
};

/// Descriptor for `AppCrashReason`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List appCrashReasonDescriptor = $convert.base64Decode(
    'Cg5BcHBDcmFzaFJlYXNvbhIcChhBUFBfQ1JBU0hfUkVBU09OX1VOS05PV04QAA==');

@$core.Deprecated('Use attachmentSourceTypeDescriptor instead')
const AttachmentSourceType$json = {
  '1': 'AttachmentSourceType',
  '2': [
    {'1': 'ATTACHMENT_SOURCE_UNKNOWN', '2': 0},
    {'1': 'ATTACHMENT_SOURCE_CONTEXT_MENU', '2': 1},
    {'1': 'ATTACHMENT_SOURCE_DRAG_AND_DROP', '2': 2},
    {'1': 'ATTACHMENT_SOURCE_SELECT_FILES_BUTTON', '2': 3},
    {'1': 'ATTACHMENT_SOURCE_PASTE', '2': 4},
    {'1': 'ATTACHMENT_SOURCE_SELECT_FOLDERS_BUTTON', '2': 5},
    {'1': 'ATTACHMENT_SOURCE_SHARE_ACTIVATION', '2': 6},
  ],
};

/// Descriptor for `AttachmentSourceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List attachmentSourceTypeDescriptor = $convert.base64Decode(
    'ChRBdHRhY2htZW50U291cmNlVHlwZRIdChlBVFRBQ0hNRU5UX1NPVVJDRV9VTktOT1dOEAASIg'
    'oeQVRUQUNITUVOVF9TT1VSQ0VfQ09OVEVYVF9NRU5VEAESIwofQVRUQUNITUVOVF9TT1VSQ0Vf'
    'RFJBR19BTkRfRFJPUBACEikKJUFUVEFDSE1FTlRfU09VUkNFX1NFTEVDVF9GSUxFU19CVVRUT0'
    '4QAxIbChdBVFRBQ0hNRU5UX1NPVVJDRV9QQVNURRAEEisKJ0FUVEFDSE1FTlRfU09VUkNFX1NF'
    'TEVDVF9GT0xERVJTX0JVVFRPThAFEiYKIkFUVEFDSE1FTlRfU09VUkNFX1NIQVJFX0FDVElWQV'
    'RJT04QBg==');

@$core.Deprecated('Use preferencesActionDescriptor instead')
const PreferencesAction$json = {
  '1': 'PreferencesAction',
  '2': [
    {'1': 'PREFERENCES_ACTION_UNKNOWN', '2': 0},
    {'1': 'PREFERENCES_ACTION_NO_ACTION', '2': 1},
    {'1': 'PREFERENCES_ACTION_LOAD_PREFERENCES', '2': 2},
    {'1': 'PREFERENCES_ACTION_SAVE_PREFERENCESS', '2': 3},
    {'1': 'PREFERENCES_ACTION_ATTEMPT_LOAD', '2': 4},
    {'1': 'PREFERENCES_ACTION_RESTORE_FROM_BACKUP', '2': 5},
    {'1': 'PREFERENCES_ACTION_CREATE_PREFERENCES_PATH', '2': 6},
    {'1': 'PREFERENCES_ACTION_MAKE_PREFERENCES_BACKUP_FILE', '2': 7},
    {'1': 'PREFERENCES_ACTION_CHECK_IF_PREFERENCES_PATH_EXISTS', '2': 8},
    {
      '1': 'PREFERENCES_ACTION_CHECK_IF_PREFERENCES_INPUT_STREAM_STATUS',
      '2': 9
    },
    {'1': 'PREFERENCES_ACTION_CHECK_IF_PREFERENCES_FILE_IS_CORRUPTED', '2': 10},
    {
      '1': 'PREFERENCES_ACTION_CHECK_IF_PREFERENCES_BACKUP_FILE_EXISTS',
      '2': 11
    },
  ],
};

/// Descriptor for `PreferencesAction`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List preferencesActionDescriptor = $convert.base64Decode(
    'ChFQcmVmZXJlbmNlc0FjdGlvbhIeChpQUkVGRVJFTkNFU19BQ1RJT05fVU5LTk9XThAAEiAKHF'
    'BSRUZFUkVOQ0VTX0FDVElPTl9OT19BQ1RJT04QARInCiNQUkVGRVJFTkNFU19BQ1RJT05fTE9B'
    'RF9QUkVGRVJFTkNFUxACEigKJFBSRUZFUkVOQ0VTX0FDVElPTl9TQVZFX1BSRUZFUkVOQ0VTUx'
    'ADEiMKH1BSRUZFUkVOQ0VTX0FDVElPTl9BVFRFTVBUX0xPQUQQBBIqCiZQUkVGRVJFTkNFU19B'
    'Q1RJT05fUkVTVE9SRV9GUk9NX0JBQ0tVUBAFEi4KKlBSRUZFUkVOQ0VTX0FDVElPTl9DUkVBVE'
    'VfUFJFRkVSRU5DRVNfUEFUSBAGEjMKL1BSRUZFUkVOQ0VTX0FDVElPTl9NQUtFX1BSRUZFUkVO'
    'Q0VTX0JBQ0tVUF9GSUxFEAcSNwozUFJFRkVSRU5DRVNfQUNUSU9OX0NIRUNLX0lGX1BSRUZFUk'
    'VOQ0VTX1BBVEhfRVhJU1RTEAgSPwo7UFJFRkVSRU5DRVNfQUNUSU9OX0NIRUNLX0lGX1BSRUZF'
    'UkVOQ0VTX0lOUFVUX1NUUkVBTV9TVEFUVVMQCRI9CjlQUkVGRVJFTkNFU19BQ1RJT05fQ0hFQ0'
    'tfSUZfUFJFRkVSRU5DRVNfRklMRV9JU19DT1JSVVBURUQQChI+CjpQUkVGRVJFTkNFU19BQ1RJ'
    'T05fQ0hFQ0tfSUZfUFJFRkVSRU5DRVNfQkFDS1VQX0ZJTEVfRVhJU1RTEAs=');

@$core.Deprecated('Use preferencesActionStatusDescriptor instead')
const PreferencesActionStatus$json = {
  '1': 'PreferencesActionStatus',
  '2': [
    {'1': 'PREFERENCES_ACTION_STATUS_UNKNOWN', '2': 0},
    {'1': 'PREFERENCES_ACTION_STATUS_SUCCESS', '2': 1},
    {'1': 'PREFERENCES_ACTION_STATUS_FAIL', '2': 2},
  ],
};

/// Descriptor for `PreferencesActionStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List preferencesActionStatusDescriptor = $convert.base64Decode(
    'ChdQcmVmZXJlbmNlc0FjdGlvblN0YXR1cxIlCiFQUkVGRVJFTkNFU19BQ1RJT05fU1RBVFVTX1'
    'VOS05PV04QABIlCiFQUkVGRVJFTkNFU19BQ1RJT05fU1RBVFVTX1NVQ0NFU1MQARIiCh5QUkVG'
    'RVJFTkNFU19BQ1RJT05fU1RBVFVTX0ZBSUwQAg==');

@$core.Deprecated('Use fastInitStateDescriptor instead')
const FastInitState$json = {
  '1': 'FastInitState',
  '2': [
    {'1': 'FAST_INIT_UNKNOWN_STATE', '2': 0},
    {'1': 'FAST_INIT_CLOSE_STATE', '2': 1},
    {'1': 'FAST_INIT_FAR_STATE', '2': 2},
    {'1': 'FAST_INIT_LOST_STATE', '2': 3},
  ],
};

/// Descriptor for `FastInitState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List fastInitStateDescriptor = $convert.base64Decode(
    'Cg1GYXN0SW5pdFN0YXRlEhsKF0ZBU1RfSU5JVF9VTktOT1dOX1NUQVRFEAASGQoVRkFTVF9JTk'
    'lUX0NMT1NFX1NUQVRFEAESFwoTRkFTVF9JTklUX0ZBUl9TVEFURRACEhgKFEZBU1RfSU5JVF9M'
    'T1NUX1NUQVRFEAM=');

@$core.Deprecated('Use fastInitTypeDescriptor instead')
const FastInitType$json = {
  '1': 'FastInitType',
  '2': [
    {'1': 'FAST_INIT_UNKNOWN_TYPE', '2': 0},
    {'1': 'FAST_INIT_NOTIFY_TYPE', '2': 1},
    {'1': 'FAST_INIT_SILENT_TYPE', '2': 2},
  ],
};

/// Descriptor for `FastInitType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List fastInitTypeDescriptor = $convert.base64Decode(
    'CgxGYXN0SW5pdFR5cGUSGgoWRkFTVF9JTklUX1VOS05PV05fVFlQRRAAEhkKFUZBU1RfSU5JVF'
    '9OT1RJRllfVFlQRRABEhkKFUZBU1RfSU5JVF9TSUxFTlRfVFlQRRAC');

@$core.Deprecated('Use desktopNotificationDescriptor instead')
const DesktopNotification$json = {
  '1': 'DesktopNotification',
  '2': [
    {'1': 'DESKTOP_NOTIFICATION_UNKNOWN', '2': 0},
    {'1': 'DESKTOP_NOTIFICATION_CONNECTING', '2': 1},
    {'1': 'DESKTOP_NOTIFICATION_PROGRESS', '2': 2},
    {'1': 'DESKTOP_NOTIFICATION_ACCEPT', '2': 3},
    {'1': 'DESKTOP_NOTIFICATION_RECEIVED', '2': 4},
    {'1': 'DESKTOP_NOTIFICATION_ERROR', '2': 5},
  ],
};

/// Descriptor for `DesktopNotification`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List desktopNotificationDescriptor = $convert.base64Decode(
    'ChNEZXNrdG9wTm90aWZpY2F0aW9uEiAKHERFU0tUT1BfTk9USUZJQ0FUSU9OX1VOS05PV04QAB'
    'IjCh9ERVNLVE9QX05PVElGSUNBVElPTl9DT05ORUNUSU5HEAESIQodREVTS1RPUF9OT1RJRklD'
    'QVRJT05fUFJPR1JFU1MQAhIfChtERVNLVE9QX05PVElGSUNBVElPTl9BQ0NFUFQQAxIhCh1ERV'
    'NLVE9QX05PVElGSUNBVElPTl9SRUNFSVZFRBAEEh4KGkRFU0tUT1BfTk9USUZJQ0FUSU9OX0VS'
    'Uk9SEAU=');

@$core.Deprecated('Use desktopTransferEventTypeDescriptor instead')
const DesktopTransferEventType$json = {
  '1': 'DesktopTransferEventType',
  '2': [
    {'1': 'DESKTOP_TRANSFER_EVENT_TYPE_UNKNOWN', '2': 0},
    {'1': 'DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_ACCEPT', '2': 1},
    {'1': 'DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_PROGRESS', '2': 2},
    {'1': 'DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_RECEIVED', '2': 3},
    {'1': 'DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_ERROR', '2': 4},
    {'1': 'DESKTOP_TRANSFER_EVENT_SEND_TYPE_START', '2': 5},
    {'1': 'DESKTOP_TRANSFER_EVENT_SEND_TYPE_SELECT_A_DEVICE', '2': 6},
    {'1': 'DESKTOP_TRANSFER_EVENT_SEND_TYPE_PROGRESS', '2': 7},
    {'1': 'DESKTOP_TRANSFER_EVENT_SEND_TYPE_SENT', '2': 8},
    {'1': 'DESKTOP_TRANSFER_EVENT_SEND_TYPE_ERROR', '2': 9},
  ],
};

/// Descriptor for `DesktopTransferEventType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List desktopTransferEventTypeDescriptor = $convert.base64Decode(
    'ChhEZXNrdG9wVHJhbnNmZXJFdmVudFR5cGUSJwojREVTS1RPUF9UUkFOU0ZFUl9FVkVOVF9UWV'
    'BFX1VOS05PV04QABIuCipERVNLVE9QX1RSQU5TRkVSX0VWRU5UX1JFQ0VJVkVfVFlQRV9BQ0NF'
    'UFQQARIwCixERVNLVE9QX1RSQU5TRkVSX0VWRU5UX1JFQ0VJVkVfVFlQRV9QUk9HUkVTUxACEj'
    'AKLERFU0tUT1BfVFJBTlNGRVJfRVZFTlRfUkVDRUlWRV9UWVBFX1JFQ0VJVkVEEAMSLQopREVT'
    'S1RPUF9UUkFOU0ZFUl9FVkVOVF9SRUNFSVZFX1RZUEVfRVJST1IQBBIqCiZERVNLVE9QX1RSQU'
    '5TRkVSX0VWRU5UX1NFTkRfVFlQRV9TVEFSVBAFEjQKMERFU0tUT1BfVFJBTlNGRVJfRVZFTlRf'
    'U0VORF9UWVBFX1NFTEVDVF9BX0RFVklDRRAGEi0KKURFU0tUT1BfVFJBTlNGRVJfRVZFTlRfU0'
    'VORF9UWVBFX1BST0dSRVNTEAcSKQolREVTS1RPUF9UUkFOU0ZFUl9FVkVOVF9TRU5EX1RZUEVf'
    'U0VOVBAIEioKJkRFU0tUT1BfVFJBTlNGRVJfRVZFTlRfU0VORF9UWVBFX0VSUk9SEAk=');

@$core.Deprecated('Use decryptCertificateFailureStatusDescriptor instead')
const DecryptCertificateFailureStatus$json = {
  '1': 'DecryptCertificateFailureStatus',
  '2': [
    {'1': 'DECRYPT_CERT_UNKNOWN_FAILURE', '2': 0},
    {'1': 'DECRYPT_CERT_NO_SUCH_ALGORITHM_FAILURE', '2': 1},
    {'1': 'DECRYPT_CERT_NO_SUCH_PADDING_FAILURE', '2': 2},
    {'1': 'DECRYPT_CERT_INVALID_KEY_FAILURE', '2': 3},
    {'1': 'DECRYPT_CERT_INVALID_ALGORITHM_PARAMETER_FAILURE', '2': 4},
    {'1': 'DECRYPT_CERT_ILLEGAL_BLOCK_SIZE_FAILURE', '2': 5},
    {'1': 'DECRYPT_CERT_BAD_PADDING_FAILURE', '2': 6},
  ],
};

/// Descriptor for `DecryptCertificateFailureStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List decryptCertificateFailureStatusDescriptor = $convert.base64Decode(
    'Ch9EZWNyeXB0Q2VydGlmaWNhdGVGYWlsdXJlU3RhdHVzEiAKHERFQ1JZUFRfQ0VSVF9VTktOT1'
    'dOX0ZBSUxVUkUQABIqCiZERUNSWVBUX0NFUlRfTk9fU1VDSF9BTEdPUklUSE1fRkFJTFVSRRAB'
    'EigKJERFQ1JZUFRfQ0VSVF9OT19TVUNIX1BBRERJTkdfRkFJTFVSRRACEiQKIERFQ1JZUFRfQ0'
    'VSVF9JTlZBTElEX0tFWV9GQUlMVVJFEAMSNAowREVDUllQVF9DRVJUX0lOVkFMSURfQUxHT1JJ'
    'VEhNX1BBUkFNRVRFUl9GQUlMVVJFEAQSKwonREVDUllQVF9DRVJUX0lMTEVHQUxfQkxPQ0tfU0'
    'laRV9GQUlMVVJFEAUSJAogREVDUllQVF9DRVJUX0JBRF9QQURESU5HX0ZBSUxVUkUQBg==');

@$core.Deprecated('Use contactAccessDescriptor instead')
const ContactAccess$json = {
  '1': 'ContactAccess',
  '2': [
    {'1': 'CONTACT_ACCESS_UNKNOWN', '2': 0},
    {'1': 'CONTACT_ACCESS_NO_CONTACT_UPLOADED', '2': 1},
    {'1': 'CONTACT_ACCESS_ONLY_UPLOAD_GOOGLE_CONTACT', '2': 2},
    {'1': 'CONTACT_ACCESS_UPLOAD_CONTACT_FOR_DEVICE_CONTACT_CONSENT', '2': 3},
    {'1': 'CONTACT_ACCESS_UPLOAD_CONTACT_FOR_QUICK_SHARE_CONSENT', '2': 4},
  ],
};

/// Descriptor for `ContactAccess`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List contactAccessDescriptor = $convert.base64Decode(
    'Cg1Db250YWN0QWNjZXNzEhoKFkNPTlRBQ1RfQUNDRVNTX1VOS05PV04QABImCiJDT05UQUNUX0'
    'FDQ0VTU19OT19DT05UQUNUX1VQTE9BREVEEAESLQopQ09OVEFDVF9BQ0NFU1NfT05MWV9VUExP'
    'QURfR09PR0xFX0NPTlRBQ1QQAhI8CjhDT05UQUNUX0FDQ0VTU19VUExPQURfQ09OVEFDVF9GT1'
    'JfREVWSUNFX0NPTlRBQ1RfQ09OU0VOVBADEjkKNUNPTlRBQ1RfQUNDRVNTX1VQTE9BRF9DT05U'
    'QUNUX0ZPUl9RVUlDS19TSEFSRV9DT05TRU5UEAQ=');

@$core.Deprecated('Use identityVerificationDescriptor instead')
const IdentityVerification$json = {
  '1': 'IdentityVerification',
  '2': [
    {'1': 'IDENTITY_VERIFICATION_UNKNOWN', '2': 0},
    {'1': 'IDENTITY_VERIFICATION_NO_PHONE_NUMBER_VERIFIED', '2': 1},
    {
      '1': 'IDENTITY_VERIFICATION_PHONE_NUMBER_VERIFIED_NOT_LINKED_TO_GAIA',
      '2': 2
    },
    {
      '1': 'IDENTITY_VERIFICATION_PHONE_NUMBER_VERIFIED_LINKED_TO_QS_GAIA',
      '2': 3
    },
  ],
};

/// Descriptor for `IdentityVerification`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List identityVerificationDescriptor = $convert.base64Decode(
    'ChRJZGVudGl0eVZlcmlmaWNhdGlvbhIhCh1JREVOVElUWV9WRVJJRklDQVRJT05fVU5LTk9XTh'
    'AAEjIKLklERU5USVRZX1ZFUklGSUNBVElPTl9OT19QSE9ORV9OVU1CRVJfVkVSSUZJRUQQARJC'
    'Cj5JREVOVElUWV9WRVJJRklDQVRJT05fUEhPTkVfTlVNQkVSX1ZFUklGSUVEX05PVF9MSU5LRU'
    'RfVE9fR0FJQRACEkEKPUlERU5USVRZX1ZFUklGSUNBVElPTl9QSE9ORV9OVU1CRVJfVkVSSUZJ'
    'RURfTElOS0VEX1RPX1FTX0dBSUEQAw==');

@$core.Deprecated('Use buttonStatusDescriptor instead')
const ButtonStatus$json = {
  '1': 'ButtonStatus',
  '2': [
    {'1': 'BUTTON_STATUS_UNKNOWN', '2': 0},
    {'1': 'BUTTON_STATUS_CLICK_ACCEPT', '2': 1},
    {'1': 'BUTTON_STATUS_CLICK_REJECT', '2': 2},
    {'1': 'BUTTON_STATUS_IGNORE', '2': 3},
  ],
};

/// Descriptor for `ButtonStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List buttonStatusDescriptor = $convert.base64Decode(
    'CgxCdXR0b25TdGF0dXMSGQoVQlVUVE9OX1NUQVRVU19VTktOT1dOEAASHgoaQlVUVE9OX1NUQV'
    'RVU19DTElDS19BQ0NFUFQQARIeChpCVVRUT05fU1RBVFVTX0NMSUNLX1JFSkVDVBACEhgKFEJV'
    'VFRPTl9TVEFUVVNfSUdOT1JFEAM=');

@$core.Deprecated('Use cloudCreateSharingResultDescriptor instead')
const CloudCreateSharingResult$json = {
  '1': 'CloudCreateSharingResult',
  '2': [
    {'1': 'CLOUD_CREATE_SHARING_RESULT_UNKNOWN', '2': 0},
    {'1': 'CLOUD_CREATE_SHARING_RESULT_SUCCESS', '2': 1},
    {'1': 'CLOUD_CREATE_SHARING_RESULT_SIGN_IN_REQUIRE', '2': 2},
    {'1': 'CLOUD_CREATE_SHARING_RESULT_ALREADY_EXIST', '2': 3},
    {'1': 'CLOUD_CREATE_SHARING_RESULT_ALREADY_STARTED', '2': 4},
    {'1': 'CLOUD_CREATE_SHARING_RESULT_NETWORK_ERROR', '2': 5},
    {'1': 'CLOUD_CREATE_SHARING_RESULT_INVALID_ARGUMENT', '2': 6},
    {'1': 'CLOUD_CREATE_SHARING_RESULT_REMOTE_ERROR', '2': 7},
    {'1': 'CLOUD_CREATE_SHARING_RESULT_FILE_LIMIT_EXCEED_COUNT', '2': 8},
    {'1': 'CLOUD_CREATE_SHARING_RESULT_FILE_LIMIT_EXCEED_SIZE', '2': 9},
    {'1': 'CLOUD_CREATE_SHARING_RESULT_SUCCESS_NO_NOTIFICATION', '2': 10},
  ],
};

/// Descriptor for `CloudCreateSharingResult`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cloudCreateSharingResultDescriptor = $convert.base64Decode(
    'ChhDbG91ZENyZWF0ZVNoYXJpbmdSZXN1bHQSJwojQ0xPVURfQ1JFQVRFX1NIQVJJTkdfUkVTVU'
    'xUX1VOS05PV04QABInCiNDTE9VRF9DUkVBVEVfU0hBUklOR19SRVNVTFRfU1VDQ0VTUxABEi8K'
    'K0NMT1VEX0NSRUFURV9TSEFSSU5HX1JFU1VMVF9TSUdOX0lOX1JFUVVJUkUQAhItCilDTE9VRF'
    '9DUkVBVEVfU0hBUklOR19SRVNVTFRfQUxSRUFEWV9FWElTVBADEi8KK0NMT1VEX0NSRUFURV9T'
    'SEFSSU5HX1JFU1VMVF9BTFJFQURZX1NUQVJURUQQBBItCilDTE9VRF9DUkVBVEVfU0hBUklOR1'
    '9SRVNVTFRfTkVUV09SS19FUlJPUhAFEjAKLENMT1VEX0NSRUFURV9TSEFSSU5HX1JFU1VMVF9J'
    'TlZBTElEX0FSR1VNRU5UEAYSLAooQ0xPVURfQ1JFQVRFX1NIQVJJTkdfUkVTVUxUX1JFTU9URV'
    '9FUlJPUhAHEjcKM0NMT1VEX0NSRUFURV9TSEFSSU5HX1JFU1VMVF9GSUxFX0xJTUlUX0VYQ0VF'
    'RF9DT1VOVBAIEjYKMkNMT1VEX0NSRUFURV9TSEFSSU5HX1JFU1VMVF9GSUxFX0xJTUlUX0VYQ0'
    'VFRF9TSVpFEAkSNwozQ0xPVURfQ1JFQVRFX1NIQVJJTkdfUkVTVUxUX1NVQ0NFU1NfTk9fTk9U'
    'SUZJQ0FUSU9OEAo=');

@$core.Deprecated('Use cloudRegisterReceiverResultDescriptor instead')
const CloudRegisterReceiverResult$json = {
  '1': 'CloudRegisterReceiverResult',
  '2': [
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_UNKNOWN', '2': 0},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_SUCCESS', '2': 1},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_INVALID_ARGUMENT', '2': 2},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_DEADLINE_EXCEEDED', '2': 3},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_INTERNAL', '2': 4},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_RESOURCE_EXHAUSTED', '2': 5},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_UNAVAILABLE', '2': 6},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_PERMISSION_DENIED', '2': 7},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_NOT_FOUND', '2': 8},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_ALREADY_EXISTS', '2': 9},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_UNAUTHENTICATED', '2': 10},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_CANCELLED', '2': 11},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_FAILED_PRECONDITION', '2': 12},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_ABORTED', '2': 13},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_OUT_OF_RANGE', '2': 14},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_UNIMPLEMENTED', '2': 15},
    {'1': 'CLOUD_REGISTER_RECEIVER_RESULT_DATA_LOSS', '2': 16},
  ],
};

/// Descriptor for `CloudRegisterReceiverResult`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cloudRegisterReceiverResultDescriptor = $convert.base64Decode(
    'ChtDbG91ZFJlZ2lzdGVyUmVjZWl2ZXJSZXN1bHQSKgomQ0xPVURfUkVHSVNURVJfUkVDRUlWRV'
    'JfUkVTVUxUX1VOS05PV04QABIqCiZDTE9VRF9SRUdJU1RFUl9SRUNFSVZFUl9SRVNVTFRfU1VD'
    'Q0VTUxABEjMKL0NMT1VEX1JFR0lTVEVSX1JFQ0VJVkVSX1JFU1VMVF9JTlZBTElEX0FSR1VNRU'
    '5UEAISNAowQ0xPVURfUkVHSVNURVJfUkVDRUlWRVJfUkVTVUxUX0RFQURMSU5FX0VYQ0VFREVE'
    'EAMSKwonQ0xPVURfUkVHSVNURVJfUkVDRUlWRVJfUkVTVUxUX0lOVEVSTkFMEAQSNQoxQ0xPVU'
    'RfUkVHSVNURVJfUkVDRUlWRVJfUkVTVUxUX1JFU09VUkNFX0VYSEFVU1RFRBAFEi4KKkNMT1VE'
    'X1JFR0lTVEVSX1JFQ0VJVkVSX1JFU1VMVF9VTkFWQUlMQUJMRRAGEjQKMENMT1VEX1JFR0lTVE'
    'VSX1JFQ0VJVkVSX1JFU1VMVF9QRVJNSVNTSU9OX0RFTklFRBAHEiwKKENMT1VEX1JFR0lTVEVS'
    'X1JFQ0VJVkVSX1JFU1VMVF9OT1RfRk9VTkQQCBIxCi1DTE9VRF9SRUdJU1RFUl9SRUNFSVZFUl'
    '9SRVNVTFRfQUxSRUFEWV9FWElTVFMQCRIyCi5DTE9VRF9SRUdJU1RFUl9SRUNFSVZFUl9SRVNV'
    'TFRfVU5BVVRIRU5USUNBVEVEEAoSLAooQ0xPVURfUkVHSVNURVJfUkVDRUlWRVJfUkVTVUxUX0'
    'NBTkNFTExFRBALEjYKMkNMT1VEX1JFR0lTVEVSX1JFQ0VJVkVSX1JFU1VMVF9GQUlMRURfUFJF'
    'Q09ORElUSU9OEAwSKgomQ0xPVURfUkVHSVNURVJfUkVDRUlWRVJfUkVTVUxUX0FCT1JURUQQDR'
    'IvCitDTE9VRF9SRUdJU1RFUl9SRUNFSVZFUl9SRVNVTFRfT1VUX09GX1JBTkdFEA4SMAosQ0xP'
    'VURfUkVHSVNURVJfUkVDRUlWRVJfUkVTVUxUX1VOSU1QTEVNRU5URUQQDxIsCihDTE9VRF9SRU'
    'dJU1RFUl9SRUNFSVZFUl9SRVNVTFRfREFUQV9MT1NTEBA=');

@$core.Deprecated('Use cloudActionTypeDescriptor instead')
const CloudActionType$json = {
  '1': 'CloudActionType',
  '2': [
    {'1': 'CLOUD_ACTION_TYPE_UNKNOWN', '2': 0},
    {'1': 'CLOUD_ACTION_TYPE_NORMAL', '2': 1},
    {'1': 'CLOUD_ACTION_TYPE_RETRY', '2': 2},
  ],
};

/// Descriptor for `CloudActionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cloudActionTypeDescriptor = $convert.base64Decode(
    'Cg9DbG91ZEFjdGlvblR5cGUSHQoZQ0xPVURfQUNUSU9OX1RZUEVfVU5LTk9XThAAEhwKGENMT1'
    'VEX0FDVElPTl9UWVBFX05PUk1BTBABEhsKF0NMT1VEX0FDVElPTl9UWVBFX1JFVFJZEAI=');
