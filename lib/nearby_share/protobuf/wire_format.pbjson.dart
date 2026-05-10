// This is a generated file - do not edit.
//
// Generated from wire_format.proto.

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

@$core.Deprecated('Use fileMetadataDescriptor instead')
const FileMetadata$json = {
  '1': 'FileMetadata',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.nearby.sharing.service.proto.FileMetadata.Type',
      '7': 'UNKNOWN',
      '10': 'type'
    },
    {'1': 'payload_id', '3': 3, '4': 1, '5': 3, '10': 'payloadId'},
    {'1': 'size', '3': 4, '4': 1, '5': 3, '10': 'size'},
    {
      '1': 'mime_type',
      '3': 5,
      '4': 1,
      '5': 9,
      '7': 'application/octet-stream',
      '10': 'mimeType'
    },
    {'1': 'id', '3': 6, '4': 1, '5': 3, '10': 'id'},
    {'1': 'parent_folder', '3': 7, '4': 1, '5': 9, '10': 'parentFolder'},
    {'1': 'attachment_hash', '3': 8, '4': 1, '5': 3, '10': 'attachmentHash'},
    {
      '1': 'is_sensitive_content',
      '3': 9,
      '4': 1,
      '5': 8,
      '10': 'isSensitiveContent'
    },
  ],
  '4': [FileMetadata_Type$json],
};

@$core.Deprecated('Use fileMetadataDescriptor instead')
const FileMetadata_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'IMAGE', '2': 1},
    {'1': 'VIDEO', '2': 2},
    {'1': 'ANDROID_APP', '2': 3},
    {'1': 'AUDIO', '2': 4},
    {'1': 'DOCUMENT', '2': 5},
    {'1': 'CONTACT_CARD', '2': 6},
  ],
};

/// Descriptor for `FileMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileMetadataDescriptor = $convert.base64Decode(
    'CgxGaWxlTWV0YWRhdGESEgoEbmFtZRgBIAEoCVIEbmFtZRJMCgR0eXBlGAIgASgOMi8ubmVhcm'
    'J5LnNoYXJpbmcuc2VydmljZS5wcm90by5GaWxlTWV0YWRhdGEuVHlwZToHVU5LTk9XTlIEdHlw'
    'ZRIdCgpwYXlsb2FkX2lkGAMgASgDUglwYXlsb2FkSWQSEgoEc2l6ZRgEIAEoA1IEc2l6ZRI1Cg'
    'ltaW1lX3R5cGUYBSABKAk6GGFwcGxpY2F0aW9uL29jdGV0LXN0cmVhbVIIbWltZVR5cGUSDgoC'
    'aWQYBiABKANSAmlkEiMKDXBhcmVudF9mb2xkZXIYByABKAlSDHBhcmVudEZvbGRlchInCg9hdH'
    'RhY2htZW50X2hhc2gYCCABKANSDmF0dGFjaG1lbnRIYXNoEjAKFGlzX3NlbnNpdGl2ZV9jb250'
    'ZW50GAkgASgIUhJpc1NlbnNpdGl2ZUNvbnRlbnQiZQoEVHlwZRILCgdVTktOT1dOEAASCQoFSU'
    '1BR0UQARIJCgVWSURFTxACEg8KC0FORFJPSURfQVBQEAMSCQoFQVVESU8QBBIMCghET0NVTUVO'
    'VBAFEhAKDENPTlRBQ1RfQ0FSRBAG');

@$core.Deprecated('Use textMetadataDescriptor instead')
const TextMetadata$json = {
  '1': 'TextMetadata',
  '2': [
    {'1': 'text_title', '3': 2, '4': 1, '5': 9, '10': 'textTitle'},
    {
      '1': 'type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.nearby.sharing.service.proto.TextMetadata.Type',
      '7': 'UNKNOWN',
      '10': 'type'
    },
    {'1': 'payload_id', '3': 4, '4': 1, '5': 3, '10': 'payloadId'},
    {'1': 'size', '3': 5, '4': 1, '5': 3, '10': 'size'},
    {'1': 'id', '3': 6, '4': 1, '5': 3, '10': 'id'},
    {'1': 'is_sensitive_text', '3': 7, '4': 1, '5': 8, '10': 'isSensitiveText'},
  ],
  '4': [TextMetadata_Type$json],
};

@$core.Deprecated('Use textMetadataDescriptor instead')
const TextMetadata_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'TEXT', '2': 1},
    {'1': 'URL', '2': 2},
    {'1': 'ADDRESS', '2': 3},
    {'1': 'PHONE_NUMBER', '2': 4},
  ],
};

/// Descriptor for `TextMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textMetadataDescriptor = $convert.base64Decode(
    'CgxUZXh0TWV0YWRhdGESHQoKdGV4dF90aXRsZRgCIAEoCVIJdGV4dFRpdGxlEkwKBHR5cGUYAy'
    'ABKA4yLy5uZWFyYnkuc2hhcmluZy5zZXJ2aWNlLnByb3RvLlRleHRNZXRhZGF0YS5UeXBlOgdV'
    'TktOT1dOUgR0eXBlEh0KCnBheWxvYWRfaWQYBCABKANSCXBheWxvYWRJZBISCgRzaXplGAUgAS'
    'gDUgRzaXplEg4KAmlkGAYgASgDUgJpZBIqChFpc19zZW5zaXRpdmVfdGV4dBgHIAEoCFIPaXNT'
    'ZW5zaXRpdmVUZXh0IkUKBFR5cGUSCwoHVU5LTk9XThAAEggKBFRFWFQQARIHCgNVUkwQAhILCg'
    'dBRERSRVNTEAMSEAoMUEhPTkVfTlVNQkVSEAQ=');

@$core.Deprecated('Use wifiCredentialsMetadataDescriptor instead')
const WifiCredentialsMetadata$json = {
  '1': 'WifiCredentialsMetadata',
  '2': [
    {'1': 'ssid', '3': 2, '4': 1, '5': 9, '10': 'ssid'},
    {
      '1': 'security_type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.nearby.sharing.service.proto.WifiCredentialsMetadata.SecurityType',
      '7': 'UNKNOWN_SECURITY_TYPE',
      '10': 'securityType'
    },
    {'1': 'payload_id', '3': 4, '4': 1, '5': 3, '10': 'payloadId'},
    {'1': 'id', '3': 5, '4': 1, '5': 3, '10': 'id'},
  ],
  '4': [WifiCredentialsMetadata_SecurityType$json],
};

@$core.Deprecated('Use wifiCredentialsMetadataDescriptor instead')
const WifiCredentialsMetadata_SecurityType$json = {
  '1': 'SecurityType',
  '2': [
    {'1': 'UNKNOWN_SECURITY_TYPE', '2': 0},
    {'1': 'OPEN', '2': 1},
    {'1': 'WPA_PSK', '2': 2},
    {'1': 'WEP', '2': 3},
    {'1': 'SAE', '2': 4},
  ],
};

/// Descriptor for `WifiCredentialsMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wifiCredentialsMetadataDescriptor = $convert.base64Decode(
    'ChdXaWZpQ3JlZGVudGlhbHNNZXRhZGF0YRISCgRzc2lkGAIgASgJUgRzc2lkEn4KDXNlY3VyaX'
    'R5X3R5cGUYAyABKA4yQi5uZWFyYnkuc2hhcmluZy5zZXJ2aWNlLnByb3RvLldpZmlDcmVkZW50'
    'aWFsc01ldGFkYXRhLlNlY3VyaXR5VHlwZToVVU5LTk9XTl9TRUNVUklUWV9UWVBFUgxzZWN1cm'
    'l0eVR5cGUSHQoKcGF5bG9hZF9pZBgEIAEoA1IJcGF5bG9hZElkEg4KAmlkGAUgASgDUgJpZCJS'
    'CgxTZWN1cml0eVR5cGUSGQoVVU5LTk9XTl9TRUNVUklUWV9UWVBFEAASCAoET1BFThABEgsKB1'
    'dQQV9QU0sQAhIHCgNXRVAQAxIHCgNTQUUQBA==');

@$core.Deprecated('Use appMetadataDescriptor instead')
const AppMetadata$json = {
  '1': 'AppMetadata',
  '2': [
    {'1': 'app_name', '3': 1, '4': 1, '5': 9, '10': 'appName'},
    {'1': 'size', '3': 2, '4': 1, '5': 3, '10': 'size'},
    {
      '1': 'payload_id',
      '3': 3,
      '4': 3,
      '5': 3,
      '8': {'2': true},
      '10': 'payloadId',
    },
    {'1': 'id', '3': 4, '4': 1, '5': 3, '10': 'id'},
    {'1': 'file_name', '3': 5, '4': 3, '5': 9, '10': 'fileName'},
    {
      '1': 'file_size',
      '3': 6,
      '4': 3,
      '5': 3,
      '8': {'2': true},
      '10': 'fileSize',
    },
    {'1': 'package_name', '3': 7, '4': 1, '5': 9, '10': 'packageName'},
  ],
};

/// Descriptor for `AppMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appMetadataDescriptor = $convert.base64Decode(
    'CgtBcHBNZXRhZGF0YRIZCghhcHBfbmFtZRgBIAEoCVIHYXBwTmFtZRISCgRzaXplGAIgASgDUg'
    'RzaXplEiEKCnBheWxvYWRfaWQYAyADKANCAhABUglwYXlsb2FkSWQSDgoCaWQYBCABKANSAmlk'
    'EhsKCWZpbGVfbmFtZRgFIAMoCVIIZmlsZU5hbWUSHwoJZmlsZV9zaXplGAYgAygDQgIQAVIIZm'
    'lsZVNpemUSIQoMcGFja2FnZV9uYW1lGAcgASgJUgtwYWNrYWdlTmFtZQ==');

@$core.Deprecated('Use streamMetadataDescriptor instead')
const StreamMetadata$json = {
  '1': 'StreamMetadata',
  '2': [
    {'1': 'description', '3': 1, '4': 1, '5': 9, '10': 'description'},
    {'1': 'package_name', '3': 2, '4': 1, '5': 9, '10': 'packageName'},
    {'1': 'payload_id', '3': 3, '4': 1, '5': 3, '10': 'payloadId'},
    {
      '1': 'attributed_app_name',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'attributedAppName'
    },
  ],
};

/// Descriptor for `StreamMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamMetadataDescriptor = $convert.base64Decode(
    'Cg5TdHJlYW1NZXRhZGF0YRIgCgtkZXNjcmlwdGlvbhgBIAEoCVILZGVzY3JpcHRpb24SIQoMcG'
    'Fja2FnZV9uYW1lGAIgASgJUgtwYWNrYWdlTmFtZRIdCgpwYXlsb2FkX2lkGAMgASgDUglwYXls'
    'b2FkSWQSLgoTYXR0cmlidXRlZF9hcHBfbmFtZRgEIAEoCVIRYXR0cmlidXRlZEFwcE5hbWU=');

@$core.Deprecated('Use frameDescriptor instead')
const Frame$json = {
  '1': 'Frame',
  '2': [
    {
      '1': 'version',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.nearby.sharing.service.proto.Frame.Version',
      '10': 'version'
    },
    {
      '1': 'v1',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.nearby.sharing.service.proto.V1Frame',
      '10': 'v1'
    },
  ],
  '4': [Frame_Version$json],
};

@$core.Deprecated('Use frameDescriptor instead')
const Frame_Version$json = {
  '1': 'Version',
  '2': [
    {'1': 'UNKNOWN_VERSION', '2': 0},
    {'1': 'V1', '2': 1},
  ],
};

/// Descriptor for `Frame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frameDescriptor = $convert.base64Decode(
    'CgVGcmFtZRJFCgd2ZXJzaW9uGAEgASgOMisubmVhcmJ5LnNoYXJpbmcuc2VydmljZS5wcm90by'
    '5GcmFtZS5WZXJzaW9uUgd2ZXJzaW9uEjUKAnYxGAIgASgLMiUubmVhcmJ5LnNoYXJpbmcuc2Vy'
    'dmljZS5wcm90by5WMUZyYW1lUgJ2MSImCgdWZXJzaW9uEhMKD1VOS05PV05fVkVSU0lPThAAEg'
    'YKAlYxEAE=');

@$core.Deprecated('Use v1FrameDescriptor instead')
const V1Frame$json = {
  '1': 'V1Frame',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.nearby.sharing.service.proto.V1Frame.FrameType',
      '10': 'type'
    },
    {
      '1': 'introduction',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.nearby.sharing.service.proto.IntroductionFrame',
      '10': 'introduction'
    },
    {
      '1': 'connection_response',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.nearby.sharing.service.proto.ConnectionResponseFrame',
      '10': 'connectionResponse'
    },
    {
      '1': 'paired_key_encryption',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.nearby.sharing.service.proto.PairedKeyEncryptionFrame',
      '10': 'pairedKeyEncryption'
    },
    {
      '1': 'paired_key_result',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.nearby.sharing.service.proto.PairedKeyResultFrame',
      '10': 'pairedKeyResult'
    },
    {
      '1': 'certificate_info',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.nearby.sharing.service.proto.CertificateInfoFrame',
      '8': {'3': true},
      '10': 'certificateInfo',
    },
    {
      '1': 'progress_update',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.nearby.sharing.service.proto.ProgressUpdateFrame',
      '8': {'3': true},
      '10': 'progressUpdate',
    },
    {
      '1': 'bindings',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.nearby.sharing.service.proto.BindingFrame',
      '10': 'bindings'
    },
  ],
  '4': [V1Frame_FrameType$json],
};

@$core.Deprecated('Use v1FrameDescriptor instead')
const V1Frame_FrameType$json = {
  '1': 'FrameType',
  '2': [
    {'1': 'UNKNOWN_FRAME_TYPE', '2': 0},
    {'1': 'INTRODUCTION', '2': 1},
    {'1': 'RESPONSE', '2': 2},
    {'1': 'PAIRED_KEY_ENCRYPTION', '2': 3},
    {'1': 'PAIRED_KEY_RESULT', '2': 4},
    {'1': 'CERTIFICATE_INFO', '2': 5},
    {'1': 'CANCEL', '2': 6},
    {'1': 'PROGRESS_UPDATE', '2': 7},
    {'1': 'BINDINGS', '2': 8},
  ],
};

/// Descriptor for `V1Frame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List v1FrameDescriptor = $convert.base64Decode(
    'CgdWMUZyYW1lEkMKBHR5cGUYASABKA4yLy5uZWFyYnkuc2hhcmluZy5zZXJ2aWNlLnByb3RvLl'
    'YxRnJhbWUuRnJhbWVUeXBlUgR0eXBlElMKDGludHJvZHVjdGlvbhgCIAEoCzIvLm5lYXJieS5z'
    'aGFyaW5nLnNlcnZpY2UucHJvdG8uSW50cm9kdWN0aW9uRnJhbWVSDGludHJvZHVjdGlvbhJmCh'
    'Njb25uZWN0aW9uX3Jlc3BvbnNlGAMgASgLMjUubmVhcmJ5LnNoYXJpbmcuc2VydmljZS5wcm90'
    'by5Db25uZWN0aW9uUmVzcG9uc2VGcmFtZVISY29ubmVjdGlvblJlc3BvbnNlEmoKFXBhaXJlZF'
    '9rZXlfZW5jcnlwdGlvbhgEIAEoCzI2Lm5lYXJieS5zaGFyaW5nLnNlcnZpY2UucHJvdG8uUGFp'
    'cmVkS2V5RW5jcnlwdGlvbkZyYW1lUhNwYWlyZWRLZXlFbmNyeXB0aW9uEl4KEXBhaXJlZF9rZX'
    'lfcmVzdWx0GAUgASgLMjIubmVhcmJ5LnNoYXJpbmcuc2VydmljZS5wcm90by5QYWlyZWRLZXlS'
    'ZXN1bHRGcmFtZVIPcGFpcmVkS2V5UmVzdWx0EmEKEGNlcnRpZmljYXRlX2luZm8YBiABKAsyMi'
    '5uZWFyYnkuc2hhcmluZy5zZXJ2aWNlLnByb3RvLkNlcnRpZmljYXRlSW5mb0ZyYW1lQgIYAVIP'
    'Y2VydGlmaWNhdGVJbmZvEl4KD3Byb2dyZXNzX3VwZGF0ZRgHIAEoCzIxLm5lYXJieS5zaGFyaW'
    '5nLnNlcnZpY2UucHJvdG8uUHJvZ3Jlc3NVcGRhdGVGcmFtZUICGAFSDnByb2dyZXNzVXBkYXRl'
    'EkYKCGJpbmRpbmdzGAggASgLMioubmVhcmJ5LnNoYXJpbmcuc2VydmljZS5wcm90by5CaW5kaW'
    '5nRnJhbWVSCGJpbmRpbmdzIroBCglGcmFtZVR5cGUSFgoSVU5LTk9XTl9GUkFNRV9UWVBFEAAS'
    'EAoMSU5UUk9EVUNUSU9OEAESDAoIUkVTUE9OU0UQAhIZChVQQUlSRURfS0VZX0VOQ1JZUFRJT0'
    '4QAxIVChFQQUlSRURfS0VZX1JFU1VMVBAEEhQKEENFUlRJRklDQVRFX0lORk8QBRIKCgZDQU5D'
    'RUwQBhITCg9QUk9HUkVTU19VUERBVEUQBxIMCghCSU5ESU5HUxAI');

@$core.Deprecated('Use introductionFrameDescriptor instead')
const IntroductionFrame$json = {
  '1': 'IntroductionFrame',
  '2': [
    {
      '1': 'file_metadata',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.nearby.sharing.service.proto.FileMetadata',
      '10': 'fileMetadata'
    },
    {
      '1': 'text_metadata',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.nearby.sharing.service.proto.TextMetadata',
      '10': 'textMetadata'
    },
    {'1': 'required_package', '3': 3, '4': 1, '5': 9, '10': 'requiredPackage'},
    {
      '1': 'wifi_credentials_metadata',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.nearby.sharing.service.proto.WifiCredentialsMetadata',
      '10': 'wifiCredentialsMetadata'
    },
    {
      '1': 'app_metadata',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.nearby.sharing.service.proto.AppMetadata',
      '10': 'appMetadata'
    },
    {'1': 'start_transfer', '3': 6, '4': 1, '5': 8, '10': 'startTransfer'},
    {
      '1': 'stream_metadata',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.nearby.sharing.service.proto.StreamMetadata',
      '10': 'streamMetadata'
    },
    {
      '1': 'use_case',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.nearby.sharing.service.proto.IntroductionFrame.SharingUseCase',
      '10': 'useCase'
    },
    {
      '1': 'preview_payload_ids',
      '3': 9,
      '4': 3,
      '5': 3,
      '10': 'previewPayloadIds'
    },
  ],
  '4': [IntroductionFrame_SharingUseCase$json],
};

@$core.Deprecated('Use introductionFrameDescriptor instead')
const IntroductionFrame_SharingUseCase$json = {
  '1': 'SharingUseCase',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'NEARBY_SHARE', '2': 1},
    {'1': 'REMOTE_COPY', '2': 2},
    {'1': 'TAP_TO_SHARE', '2': 9},
  ],
};

/// Descriptor for `IntroductionFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List introductionFrameDescriptor = $convert.base64Decode(
    'ChFJbnRyb2R1Y3Rpb25GcmFtZRJPCg1maWxlX21ldGFkYXRhGAEgAygLMioubmVhcmJ5LnNoYX'
    'Jpbmcuc2VydmljZS5wcm90by5GaWxlTWV0YWRhdGFSDGZpbGVNZXRhZGF0YRJPCg10ZXh0X21l'
    'dGFkYXRhGAIgAygLMioubmVhcmJ5LnNoYXJpbmcuc2VydmljZS5wcm90by5UZXh0TWV0YWRhdG'
    'FSDHRleHRNZXRhZGF0YRIpChByZXF1aXJlZF9wYWNrYWdlGAMgASgJUg9yZXF1aXJlZFBhY2th'
    'Z2UScQoZd2lmaV9jcmVkZW50aWFsc19tZXRhZGF0YRgEIAMoCzI1Lm5lYXJieS5zaGFyaW5nLn'
    'NlcnZpY2UucHJvdG8uV2lmaUNyZWRlbnRpYWxzTWV0YWRhdGFSF3dpZmlDcmVkZW50aWFsc01l'
    'dGFkYXRhEkwKDGFwcF9tZXRhZGF0YRgFIAMoCzIpLm5lYXJieS5zaGFyaW5nLnNlcnZpY2UucH'
    'JvdG8uQXBwTWV0YWRhdGFSC2FwcE1ldGFkYXRhEiUKDnN0YXJ0X3RyYW5zZmVyGAYgASgIUg1z'
    'dGFydFRyYW5zZmVyElUKD3N0cmVhbV9tZXRhZGF0YRgHIAMoCzIsLm5lYXJieS5zaGFyaW5nLn'
    'NlcnZpY2UucHJvdG8uU3RyZWFtTWV0YWRhdGFSDnN0cmVhbU1ldGFkYXRhElkKCHVzZV9jYXNl'
    'GAggASgOMj4ubmVhcmJ5LnNoYXJpbmcuc2VydmljZS5wcm90by5JbnRyb2R1Y3Rpb25GcmFtZS'
    '5TaGFyaW5nVXNlQ2FzZVIHdXNlQ2FzZRIuChNwcmV2aWV3X3BheWxvYWRfaWRzGAkgAygDUhFw'
    'cmV2aWV3UGF5bG9hZElkcyJSCg5TaGFyaW5nVXNlQ2FzZRILCgdVTktOT1dOEAASEAoMTkVBUk'
    'JZX1NIQVJFEAESDwoLUkVNT1RFX0NPUFkQAhIQCgxUQVBfVE9fU0hBUkUQCQ==');

@$core.Deprecated('Use progressUpdateFrameDescriptor instead')
const ProgressUpdateFrame$json = {
  '1': 'ProgressUpdateFrame',
  '2': [
    {'1': 'progress', '3': 1, '4': 1, '5': 2, '10': 'progress'},
    {'1': 'start_transfer', '3': 2, '4': 1, '5': 8, '10': 'startTransfer'},
  ],
};

/// Descriptor for `ProgressUpdateFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List progressUpdateFrameDescriptor = $convert.base64Decode(
    'ChNQcm9ncmVzc1VwZGF0ZUZyYW1lEhoKCHByb2dyZXNzGAEgASgCUghwcm9ncmVzcxIlCg5zdG'
    'FydF90cmFuc2ZlchgCIAEoCFINc3RhcnRUcmFuc2Zlcg==');

@$core.Deprecated('Use bindingFrameDescriptor instead')
const BindingFrame$json = {
  '1': 'BindingFrame',
  '2': [
    {
      '1': 'binding_request',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.nearby.sharing.service.proto.BindingRequest',
      '9': 0,
      '10': 'bindingRequest'
    },
    {
      '1': 'binding_response',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.nearby.sharing.service.proto.BindingResponse',
      '9': 0,
      '10': 'bindingResponse'
    },
  ],
  '8': [
    {'1': 'content'},
  ],
};

/// Descriptor for `BindingFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bindingFrameDescriptor = $convert.base64Decode(
    'CgxCaW5kaW5nRnJhbWUSVwoPYmluZGluZ19yZXF1ZXN0GAEgASgLMiwubmVhcmJ5LnNoYXJpbm'
    'cuc2VydmljZS5wcm90by5CaW5kaW5nUmVxdWVzdEgAUg5iaW5kaW5nUmVxdWVzdBJaChBiaW5k'
    'aW5nX3Jlc3BvbnNlGAIgASgLMi0ubmVhcmJ5LnNoYXJpbmcuc2VydmljZS5wcm90by5CaW5kaW'
    '5nUmVzcG9uc2VIAFIPYmluZGluZ1Jlc3BvbnNlQgkKB2NvbnRlbnQ=');

@$core.Deprecated('Use bindingRequestDescriptor instead')
const BindingRequest$json = {
  '1': 'BindingRequest',
  '2': [
    {'1': 'binding_id', '3': 1, '4': 1, '5': 9, '10': 'bindingId'},
    {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.nearby.sharing.service.proto.BindingRequest.Type',
      '10': 'type'
    },
  ],
  '4': [BindingRequest_Type$json],
};

@$core.Deprecated('Use bindingRequestDescriptor instead')
const BindingRequest_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'FILESYNC', '2': 1},
  ],
};

/// Descriptor for `BindingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bindingRequestDescriptor = $convert.base64Decode(
    'Cg5CaW5kaW5nUmVxdWVzdBIdCgpiaW5kaW5nX2lkGAEgASgJUgliaW5kaW5nSWQSRQoEdHlwZR'
    'gCIAEoDjIxLm5lYXJieS5zaGFyaW5nLnNlcnZpY2UucHJvdG8uQmluZGluZ1JlcXVlc3QuVHlw'
    'ZVIEdHlwZSIhCgRUeXBlEgsKB1VOS05PV04QABIMCghGSUxFU1lOQxAB');

@$core.Deprecated('Use bindingResponseDescriptor instead')
const BindingResponse$json = {
  '1': 'BindingResponse',
  '2': [
    {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.nearby.sharing.service.proto.BindingResponse.Status',
      '10': 'status'
    },
  ],
  '4': [BindingResponse_Status$json],
};

@$core.Deprecated('Use bindingResponseDescriptor instead')
const BindingResponse_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'SUCCESS', '2': 1},
    {'1': 'FAILURE', '2': 2},
  ],
};

/// Descriptor for `BindingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bindingResponseDescriptor = $convert.base64Decode(
    'Cg9CaW5kaW5nUmVzcG9uc2USTAoGc3RhdHVzGAEgASgOMjQubmVhcmJ5LnNoYXJpbmcuc2Vydm'
    'ljZS5wcm90by5CaW5kaW5nUmVzcG9uc2UuU3RhdHVzUgZzdGF0dXMiLwoGU3RhdHVzEgsKB1VO'
    'S05PV04QABILCgdTVUNDRVNTEAESCwoHRkFJTFVSRRAC');

@$core.Deprecated('Use connectionResponseFrameDescriptor instead')
const ConnectionResponseFrame$json = {
  '1': 'ConnectionResponseFrame',
  '2': [
    {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.nearby.sharing.service.proto.ConnectionResponseFrame.Status',
      '10': 'status'
    },
    {
      '1': 'attachment_details',
      '3': 2,
      '4': 3,
      '5': 11,
      '6':
          '.nearby.sharing.service.proto.ConnectionResponseFrame.AttachmentDetailsEntry',
      '10': 'attachmentDetails'
    },
    {
      '1': 'stream_metadata',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.nearby.sharing.service.proto.StreamMetadata',
      '10': 'streamMetadata'
    },
  ],
  '3': [ConnectionResponseFrame_AttachmentDetailsEntry$json],
  '4': [ConnectionResponseFrame_Status$json],
};

@$core.Deprecated('Use connectionResponseFrameDescriptor instead')
const ConnectionResponseFrame_AttachmentDetailsEntry$json = {
  '1': 'AttachmentDetailsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 3, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.nearby.sharing.service.proto.AttachmentDetails',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use connectionResponseFrameDescriptor instead')
const ConnectionResponseFrame_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'ACCEPT', '2': 1},
    {'1': 'REJECT', '2': 2},
    {'1': 'NOT_ENOUGH_SPACE', '2': 3},
    {'1': 'UNSUPPORTED_ATTACHMENT_TYPE', '2': 4},
    {'1': 'TIMED_OUT', '2': 5},
  ],
};

/// Descriptor for `ConnectionResponseFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectionResponseFrameDescriptor = $convert.base64Decode(
    'ChdDb25uZWN0aW9uUmVzcG9uc2VGcmFtZRJUCgZzdGF0dXMYASABKA4yPC5uZWFyYnkuc2hhcm'
    'luZy5zZXJ2aWNlLnByb3RvLkNvbm5lY3Rpb25SZXNwb25zZUZyYW1lLlN0YXR1c1IGc3RhdHVz'
    'EnsKEmF0dGFjaG1lbnRfZGV0YWlscxgCIAMoCzJMLm5lYXJieS5zaGFyaW5nLnNlcnZpY2UucH'
    'JvdG8uQ29ubmVjdGlvblJlc3BvbnNlRnJhbWUuQXR0YWNobWVudERldGFpbHNFbnRyeVIRYXR0'
    'YWNobWVudERldGFpbHMSVQoPc3RyZWFtX21ldGFkYXRhGAMgAygLMiwubmVhcmJ5LnNoYXJpbm'
    'cuc2VydmljZS5wcm90by5TdHJlYW1NZXRhZGF0YVIOc3RyZWFtTWV0YWRhdGEadQoWQXR0YWNo'
    'bWVudERldGFpbHNFbnRyeRIQCgNrZXkYASABKANSA2tleRJFCgV2YWx1ZRgCIAEoCzIvLm5lYX'
    'JieS5zaGFyaW5nLnNlcnZpY2UucHJvdG8uQXR0YWNobWVudERldGFpbHNSBXZhbHVlOgI4ASJz'
    'CgZTdGF0dXMSCwoHVU5LTk9XThAAEgoKBkFDQ0VQVBABEgoKBlJFSkVDVBACEhQKEE5PVF9FTk'
    '9VR0hfU1BBQ0UQAxIfChtVTlNVUFBPUlRFRF9BVFRBQ0hNRU5UX1RZUEUQBBINCglUSU1FRF9P'
    'VVQQBQ==');

@$core.Deprecated('Use attachmentDetailsDescriptor instead')
const AttachmentDetails$json = {
  '1': 'AttachmentDetails',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.nearby.sharing.service.proto.AttachmentDetails.Type',
      '10': 'type'
    },
    {
      '1': 'file_attachment_details',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.nearby.sharing.service.proto.FileAttachmentDetails',
      '10': 'fileAttachmentDetails'
    },
  ],
  '4': [AttachmentDetails_Type$json],
};

@$core.Deprecated('Use attachmentDetailsDescriptor instead')
const AttachmentDetails_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'FILE', '2': 1},
    {'1': 'TEXT', '2': 2},
    {'1': 'WIFI_CREDENTIALS', '2': 3},
    {'1': 'APP', '2': 4},
    {'1': 'STREAM', '2': 5},
  ],
};

/// Descriptor for `AttachmentDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attachmentDetailsDescriptor = $convert.base64Decode(
    'ChFBdHRhY2htZW50RGV0YWlscxJICgR0eXBlGAEgASgOMjQubmVhcmJ5LnNoYXJpbmcuc2Vydm'
    'ljZS5wcm90by5BdHRhY2htZW50RGV0YWlscy5UeXBlUgR0eXBlEmsKF2ZpbGVfYXR0YWNobWVu'
    'dF9kZXRhaWxzGAIgASgLMjMubmVhcmJ5LnNoYXJpbmcuc2VydmljZS5wcm90by5GaWxlQXR0YW'
    'NobWVudERldGFpbHNSFWZpbGVBdHRhY2htZW50RGV0YWlscyJSCgRUeXBlEgsKB1VOS05PV04Q'
    'ABIICgRGSUxFEAESCAoEVEVYVBACEhQKEFdJRklfQ1JFREVOVElBTFMQAxIHCgNBUFAQBBIKCg'
    'ZTVFJFQU0QBQ==');

@$core.Deprecated('Use fileAttachmentDetailsDescriptor instead')
const FileAttachmentDetails$json = {
  '1': 'FileAttachmentDetails',
  '2': [
    {
      '1': 'receiver_existing_file_size',
      '3': 1,
      '4': 1,
      '5': 3,
      '10': 'receiverExistingFileSize'
    },
    {
      '1': 'attachment_hash_payloads',
      '3': 2,
      '4': 3,
      '5': 11,
      '6':
          '.nearby.sharing.service.proto.FileAttachmentDetails.AttachmentHashPayloadsEntry',
      '10': 'attachmentHashPayloads'
    },
  ],
  '3': [FileAttachmentDetails_AttachmentHashPayloadsEntry$json],
};

@$core.Deprecated('Use fileAttachmentDetailsDescriptor instead')
const FileAttachmentDetails_AttachmentHashPayloadsEntry$json = {
  '1': 'AttachmentHashPayloadsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 3, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.nearby.sharing.service.proto.PayloadsDetails',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `FileAttachmentDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileAttachmentDetailsDescriptor = $convert.base64Decode(
    'ChVGaWxlQXR0YWNobWVudERldGFpbHMSPQobcmVjZWl2ZXJfZXhpc3RpbmdfZmlsZV9zaXplGA'
    'EgASgDUhhyZWNlaXZlckV4aXN0aW5nRmlsZVNpemUSiQEKGGF0dGFjaG1lbnRfaGFzaF9wYXls'
    'b2FkcxgCIAMoCzJPLm5lYXJieS5zaGFyaW5nLnNlcnZpY2UucHJvdG8uRmlsZUF0dGFjaG1lbn'
    'REZXRhaWxzLkF0dGFjaG1lbnRIYXNoUGF5bG9hZHNFbnRyeVIWYXR0YWNobWVudEhhc2hQYXls'
    'b2Fkcxp4ChtBdHRhY2htZW50SGFzaFBheWxvYWRzRW50cnkSEAoDa2V5GAEgASgDUgNrZXkSQw'
    'oFdmFsdWUYAiABKAsyLS5uZWFyYnkuc2hhcmluZy5zZXJ2aWNlLnByb3RvLlBheWxvYWRzRGV0'
    'YWlsc1IFdmFsdWU6AjgB');

@$core.Deprecated('Use payloadsDetailsDescriptor instead')
const PayloadsDetails$json = {
  '1': 'PayloadsDetails',
  '2': [
    {
      '1': 'payload_details',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.nearby.sharing.service.proto.PayloadDetails',
      '10': 'payloadDetails'
    },
  ],
};

/// Descriptor for `PayloadsDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payloadsDetailsDescriptor = $convert.base64Decode(
    'Cg9QYXlsb2Fkc0RldGFpbHMSVQoPcGF5bG9hZF9kZXRhaWxzGAEgAygLMiwubmVhcmJ5LnNoYX'
    'Jpbmcuc2VydmljZS5wcm90by5QYXlsb2FkRGV0YWlsc1IOcGF5bG9hZERldGFpbHM=');

@$core.Deprecated('Use payloadDetailsDescriptor instead')
const PayloadDetails$json = {
  '1': 'PayloadDetails',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {
      '1': 'creation_timestamp_millis',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'creationTimestampMillis'
    },
    {'1': 'size', '3': 3, '4': 1, '5': 3, '10': 'size'},
  ],
};

/// Descriptor for `PayloadDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payloadDetailsDescriptor = $convert.base64Decode(
    'Cg5QYXlsb2FkRGV0YWlscxIOCgJpZBgBIAEoA1ICaWQSOgoZY3JlYXRpb25fdGltZXN0YW1wX2'
    '1pbGxpcxgCIAEoA1IXY3JlYXRpb25UaW1lc3RhbXBNaWxsaXMSEgoEc2l6ZRgDIAEoA1IEc2l6'
    'ZQ==');

@$core.Deprecated('Use pairedKeyEncryptionFrameDescriptor instead')
const PairedKeyEncryptionFrame$json = {
  '1': 'PairedKeyEncryptionFrame',
  '2': [
    {'1': 'signed_data', '3': 1, '4': 1, '5': 12, '10': 'signedData'},
    {'1': 'secret_id_hash', '3': 2, '4': 1, '5': 12, '10': 'secretIdHash'},
    {
      '1': 'optional_signed_data',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'optionalSignedData'
    },
    {
      '1': 'qr_code_handshake_data',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'qrCodeHandshakeData'
    },
  ],
};

/// Descriptor for `PairedKeyEncryptionFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairedKeyEncryptionFrameDescriptor = $convert.base64Decode(
    'ChhQYWlyZWRLZXlFbmNyeXB0aW9uRnJhbWUSHwoLc2lnbmVkX2RhdGEYASABKAxSCnNpZ25lZE'
    'RhdGESJAoOc2VjcmV0X2lkX2hhc2gYAiABKAxSDHNlY3JldElkSGFzaBIwChRvcHRpb25hbF9z'
    'aWduZWRfZGF0YRgDIAEoDFISb3B0aW9uYWxTaWduZWREYXRhEjMKFnFyX2NvZGVfaGFuZHNoYW'
    'tlX2RhdGEYBCABKAxSE3FyQ29kZUhhbmRzaGFrZURhdGE=');

@$core.Deprecated('Use pairedKeyResultFrameDescriptor instead')
const PairedKeyResultFrame$json = {
  '1': 'PairedKeyResultFrame',
  '2': [
    {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.nearby.sharing.service.proto.PairedKeyResultFrame.Status',
      '10': 'status'
    },
    {
      '1': 'os_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.location.nearby.proto.sharing.OSType',
      '10': 'osType'
    },
  ],
  '4': [PairedKeyResultFrame_Status$json],
};

@$core.Deprecated('Use pairedKeyResultFrameDescriptor instead')
const PairedKeyResultFrame_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'SUCCESS', '2': 1},
    {'1': 'FAIL', '2': 2},
    {'1': 'UNABLE', '2': 3},
  ],
};

/// Descriptor for `PairedKeyResultFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairedKeyResultFrameDescriptor = $convert.base64Decode(
    'ChRQYWlyZWRLZXlSZXN1bHRGcmFtZRJRCgZzdGF0dXMYASABKA4yOS5uZWFyYnkuc2hhcmluZy'
    '5zZXJ2aWNlLnByb3RvLlBhaXJlZEtleVJlc3VsdEZyYW1lLlN0YXR1c1IGc3RhdHVzEj4KB29z'
    'X3R5cGUYAiABKA4yJS5sb2NhdGlvbi5uZWFyYnkucHJvdG8uc2hhcmluZy5PU1R5cGVSBm9zVH'
    'lwZSI4CgZTdGF0dXMSCwoHVU5LTk9XThAAEgsKB1NVQ0NFU1MQARIICgRGQUlMEAISCgoGVU5B'
    'QkxFEAM=');

@$core.Deprecated('Use certificateInfoFrameDescriptor instead')
const CertificateInfoFrame$json = {
  '1': 'CertificateInfoFrame',
  '2': [
    {
      '1': 'public_certificate',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.nearby.sharing.service.proto.PublicCertificate',
      '10': 'publicCertificate'
    },
  ],
};

/// Descriptor for `CertificateInfoFrame`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List certificateInfoFrameDescriptor = $convert.base64Decode(
    'ChRDZXJ0aWZpY2F0ZUluZm9GcmFtZRJeChJwdWJsaWNfY2VydGlmaWNhdGUYASADKAsyLy5uZW'
    'FyYnkuc2hhcmluZy5zZXJ2aWNlLnByb3RvLlB1YmxpY0NlcnRpZmljYXRlUhFwdWJsaWNDZXJ0'
    'aWZpY2F0ZQ==');

@$core.Deprecated('Use publicCertificateDescriptor instead')
const PublicCertificate$json = {
  '1': 'PublicCertificate',
  '2': [
    {'1': 'secret_id', '3': 1, '4': 1, '5': 12, '10': 'secretId'},
    {'1': 'authenticity_key', '3': 2, '4': 1, '5': 12, '10': 'authenticityKey'},
    {'1': 'public_key', '3': 3, '4': 1, '5': 12, '10': 'publicKey'},
    {'1': 'start_time', '3': 4, '4': 1, '5': 3, '10': 'startTime'},
    {'1': 'end_time', '3': 5, '4': 1, '5': 3, '10': 'endTime'},
    {
      '1': 'encrypted_metadata_bytes',
      '3': 6,
      '4': 1,
      '5': 12,
      '10': 'encryptedMetadataBytes'
    },
    {
      '1': 'metadata_encryption_key_tag',
      '3': 7,
      '4': 1,
      '5': 12,
      '10': 'metadataEncryptionKeyTag'
    },
  ],
};

/// Descriptor for `PublicCertificate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publicCertificateDescriptor = $convert.base64Decode(
    'ChFQdWJsaWNDZXJ0aWZpY2F0ZRIbCglzZWNyZXRfaWQYASABKAxSCHNlY3JldElkEikKEGF1dG'
    'hlbnRpY2l0eV9rZXkYAiABKAxSD2F1dGhlbnRpY2l0eUtleRIdCgpwdWJsaWNfa2V5GAMgASgM'
    'UglwdWJsaWNLZXkSHQoKc3RhcnRfdGltZRgEIAEoA1IJc3RhcnRUaW1lEhkKCGVuZF90aW1lGA'
    'UgASgDUgdlbmRUaW1lEjgKGGVuY3J5cHRlZF9tZXRhZGF0YV9ieXRlcxgGIAEoDFIWZW5jcnlw'
    'dGVkTWV0YWRhdGFCeXRlcxI9ChttZXRhZGF0YV9lbmNyeXB0aW9uX2tleV90YWcYByABKAxSGG'
    '1ldGFkYXRhRW5jcnlwdGlvbktleVRhZw==');

@$core.Deprecated('Use wifiCredentialsDescriptor instead')
const WifiCredentials$json = {
  '1': 'WifiCredentials',
  '2': [
    {'1': 'password', '3': 1, '4': 1, '5': 9, '10': 'password'},
    {
      '1': 'hidden_ssid',
      '3': 2,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'hiddenSsid'
    },
  ],
};

/// Descriptor for `WifiCredentials`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wifiCredentialsDescriptor = $convert.base64Decode(
    'Cg9XaWZpQ3JlZGVudGlhbHMSGgoIcGFzc3dvcmQYASABKAlSCHBhc3N3b3JkEiYKC2hpZGRlbl'
    '9zc2lkGAIgASgIOgVmYWxzZVIKaGlkZGVuU3NpZA==');

@$core.Deprecated('Use streamDetailsDescriptor instead')
const StreamDetails$json = {
  '1': 'StreamDetails',
  '2': [
    {
      '1': 'input_stream_parcel_file_descriptor_bytes',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'inputStreamParcelFileDescriptorBytes'
    },
  ],
};

/// Descriptor for `StreamDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamDetailsDescriptor = $convert.base64Decode(
    'Cg1TdHJlYW1EZXRhaWxzElcKKWlucHV0X3N0cmVhbV9wYXJjZWxfZmlsZV9kZXNjcmlwdG9yX2'
    'J5dGVzGAEgASgMUiRpbnB1dFN0cmVhbVBhcmNlbEZpbGVEZXNjcmlwdG9yQnl0ZXM=');
