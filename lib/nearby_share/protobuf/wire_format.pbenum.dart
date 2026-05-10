// This is a generated file - do not edit.
//
// Generated from wire_format.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class FileMetadata_Type extends $pb.ProtobufEnum {
  static const FileMetadata_Type UNKNOWN =
      FileMetadata_Type._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const FileMetadata_Type IMAGE =
      FileMetadata_Type._(1, _omitEnumNames ? '' : 'IMAGE');
  static const FileMetadata_Type VIDEO =
      FileMetadata_Type._(2, _omitEnumNames ? '' : 'VIDEO');
  static const FileMetadata_Type ANDROID_APP =
      FileMetadata_Type._(3, _omitEnumNames ? '' : 'ANDROID_APP');
  static const FileMetadata_Type AUDIO =
      FileMetadata_Type._(4, _omitEnumNames ? '' : 'AUDIO');
  static const FileMetadata_Type DOCUMENT =
      FileMetadata_Type._(5, _omitEnumNames ? '' : 'DOCUMENT');
  static const FileMetadata_Type CONTACT_CARD =
      FileMetadata_Type._(6, _omitEnumNames ? '' : 'CONTACT_CARD');

  static const $core.List<FileMetadata_Type> values = <FileMetadata_Type>[
    UNKNOWN,
    IMAGE,
    VIDEO,
    ANDROID_APP,
    AUDIO,
    DOCUMENT,
    CONTACT_CARD,
  ];

  static final $core.List<FileMetadata_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static FileMetadata_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FileMetadata_Type._(super.value, super.name);
}

class TextMetadata_Type extends $pb.ProtobufEnum {
  static const TextMetadata_Type UNKNOWN =
      TextMetadata_Type._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const TextMetadata_Type TEXT =
      TextMetadata_Type._(1, _omitEnumNames ? '' : 'TEXT');

  /// Open with browsers.
  static const TextMetadata_Type URL =
      TextMetadata_Type._(2, _omitEnumNames ? '' : 'URL');

  /// Open with map apps.
  static const TextMetadata_Type ADDRESS =
      TextMetadata_Type._(3, _omitEnumNames ? '' : 'ADDRESS');

  /// Dial.
  static const TextMetadata_Type PHONE_NUMBER =
      TextMetadata_Type._(4, _omitEnumNames ? '' : 'PHONE_NUMBER');

  static const $core.List<TextMetadata_Type> values = <TextMetadata_Type>[
    UNKNOWN,
    TEXT,
    URL,
    ADDRESS,
    PHONE_NUMBER,
  ];

  static final $core.List<TextMetadata_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static TextMetadata_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TextMetadata_Type._(super.value, super.name);
}

class WifiCredentialsMetadata_SecurityType extends $pb.ProtobufEnum {
  static const WifiCredentialsMetadata_SecurityType UNKNOWN_SECURITY_TYPE =
      WifiCredentialsMetadata_SecurityType._(
          0, _omitEnumNames ? '' : 'UNKNOWN_SECURITY_TYPE');
  static const WifiCredentialsMetadata_SecurityType OPEN =
      WifiCredentialsMetadata_SecurityType._(1, _omitEnumNames ? '' : 'OPEN');
  static const WifiCredentialsMetadata_SecurityType WPA_PSK =
      WifiCredentialsMetadata_SecurityType._(
          2, _omitEnumNames ? '' : 'WPA_PSK');
  static const WifiCredentialsMetadata_SecurityType WEP =
      WifiCredentialsMetadata_SecurityType._(3, _omitEnumNames ? '' : 'WEP');
  static const WifiCredentialsMetadata_SecurityType SAE =
      WifiCredentialsMetadata_SecurityType._(4, _omitEnumNames ? '' : 'SAE');

  static const $core.List<WifiCredentialsMetadata_SecurityType> values =
      <WifiCredentialsMetadata_SecurityType>[
    UNKNOWN_SECURITY_TYPE,
    OPEN,
    WPA_PSK,
    WEP,
    SAE,
  ];

  static final $core.List<WifiCredentialsMetadata_SecurityType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static WifiCredentialsMetadata_SecurityType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const WifiCredentialsMetadata_SecurityType._(super.value, super.name);
}

class Frame_Version extends $pb.ProtobufEnum {
  static const Frame_Version UNKNOWN_VERSION =
      Frame_Version._(0, _omitEnumNames ? '' : 'UNKNOWN_VERSION');
  static const Frame_Version V1 =
      Frame_Version._(1, _omitEnumNames ? '' : 'V1');

  static const $core.List<Frame_Version> values = <Frame_Version>[
    UNKNOWN_VERSION,
    V1,
  ];

  static final $core.List<Frame_Version?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static Frame_Version? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Frame_Version._(super.value, super.name);
}

class V1Frame_FrameType extends $pb.ProtobufEnum {
  static const V1Frame_FrameType UNKNOWN_FRAME_TYPE =
      V1Frame_FrameType._(0, _omitEnumNames ? '' : 'UNKNOWN_FRAME_TYPE');
  static const V1Frame_FrameType INTRODUCTION =
      V1Frame_FrameType._(1, _omitEnumNames ? '' : 'INTRODUCTION');
  static const V1Frame_FrameType RESPONSE =
      V1Frame_FrameType._(2, _omitEnumNames ? '' : 'RESPONSE');
  static const V1Frame_FrameType PAIRED_KEY_ENCRYPTION =
      V1Frame_FrameType._(3, _omitEnumNames ? '' : 'PAIRED_KEY_ENCRYPTION');
  static const V1Frame_FrameType PAIRED_KEY_RESULT =
      V1Frame_FrameType._(4, _omitEnumNames ? '' : 'PAIRED_KEY_RESULT');

  /// No longer used.
  static const V1Frame_FrameType CERTIFICATE_INFO =
      V1Frame_FrameType._(5, _omitEnumNames ? '' : 'CERTIFICATE_INFO');
  static const V1Frame_FrameType CANCEL =
      V1Frame_FrameType._(6, _omitEnumNames ? '' : 'CANCEL');

  /// No longer used.
  static const V1Frame_FrameType PROGRESS_UPDATE =
      V1Frame_FrameType._(7, _omitEnumNames ? '' : 'PROGRESS_UPDATE');
  static const V1Frame_FrameType BINDINGS =
      V1Frame_FrameType._(8, _omitEnumNames ? '' : 'BINDINGS');

  static const $core.List<V1Frame_FrameType> values = <V1Frame_FrameType>[
    UNKNOWN_FRAME_TYPE,
    INTRODUCTION,
    RESPONSE,
    PAIRED_KEY_ENCRYPTION,
    PAIRED_KEY_RESULT,
    CERTIFICATE_INFO,
    CANCEL,
    PROGRESS_UPDATE,
    BINDINGS,
  ];

  static final $core.List<V1Frame_FrameType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 8);
  static V1Frame_FrameType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const V1Frame_FrameType._(super.value, super.name);
}

class IntroductionFrame_SharingUseCase extends $pb.ProtobufEnum {
  static const IntroductionFrame_SharingUseCase UNKNOWN =
      IntroductionFrame_SharingUseCase._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const IntroductionFrame_SharingUseCase NEARBY_SHARE =
      IntroductionFrame_SharingUseCase._(
          1, _omitEnumNames ? '' : 'NEARBY_SHARE');
  static const IntroductionFrame_SharingUseCase REMOTE_COPY =
      IntroductionFrame_SharingUseCase._(
          2, _omitEnumNames ? '' : 'REMOTE_COPY');
  static const IntroductionFrame_SharingUseCase TAP_TO_SHARE =
      IntroductionFrame_SharingUseCase._(
          9, _omitEnumNames ? '' : 'TAP_TO_SHARE');

  static const $core.List<IntroductionFrame_SharingUseCase> values =
      <IntroductionFrame_SharingUseCase>[
    UNKNOWN,
    NEARBY_SHARE,
    REMOTE_COPY,
    TAP_TO_SHARE,
  ];

  static final $core.Map<$core.int, IntroductionFrame_SharingUseCase> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static IntroductionFrame_SharingUseCase? valueOf($core.int value) =>
      _byValue[value];

  const IntroductionFrame_SharingUseCase._(super.value, super.name);
}

class BindingRequest_Type extends $pb.ProtobufEnum {
  static const BindingRequest_Type UNKNOWN =
      BindingRequest_Type._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const BindingRequest_Type FILESYNC =
      BindingRequest_Type._(1, _omitEnumNames ? '' : 'FILESYNC');

  static const $core.List<BindingRequest_Type> values = <BindingRequest_Type>[
    UNKNOWN,
    FILESYNC,
  ];

  static final $core.List<BindingRequest_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static BindingRequest_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BindingRequest_Type._(super.value, super.name);
}

class BindingResponse_Status extends $pb.ProtobufEnum {
  static const BindingResponse_Status UNKNOWN =
      BindingResponse_Status._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const BindingResponse_Status SUCCESS =
      BindingResponse_Status._(1, _omitEnumNames ? '' : 'SUCCESS');
  static const BindingResponse_Status FAILURE =
      BindingResponse_Status._(2, _omitEnumNames ? '' : 'FAILURE');

  static const $core.List<BindingResponse_Status> values =
      <BindingResponse_Status>[
    UNKNOWN,
    SUCCESS,
    FAILURE,
  ];

  static final $core.List<BindingResponse_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static BindingResponse_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BindingResponse_Status._(super.value, super.name);
}

class ConnectionResponseFrame_Status extends $pb.ProtobufEnum {
  static const ConnectionResponseFrame_Status UNKNOWN =
      ConnectionResponseFrame_Status._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const ConnectionResponseFrame_Status ACCEPT =
      ConnectionResponseFrame_Status._(1, _omitEnumNames ? '' : 'ACCEPT');
  static const ConnectionResponseFrame_Status REJECT =
      ConnectionResponseFrame_Status._(2, _omitEnumNames ? '' : 'REJECT');
  static const ConnectionResponseFrame_Status NOT_ENOUGH_SPACE =
      ConnectionResponseFrame_Status._(
          3, _omitEnumNames ? '' : 'NOT_ENOUGH_SPACE');
  static const ConnectionResponseFrame_Status UNSUPPORTED_ATTACHMENT_TYPE =
      ConnectionResponseFrame_Status._(
          4, _omitEnumNames ? '' : 'UNSUPPORTED_ATTACHMENT_TYPE');
  static const ConnectionResponseFrame_Status TIMED_OUT =
      ConnectionResponseFrame_Status._(5, _omitEnumNames ? '' : 'TIMED_OUT');

  static const $core.List<ConnectionResponseFrame_Status> values =
      <ConnectionResponseFrame_Status>[
    UNKNOWN,
    ACCEPT,
    REJECT,
    NOT_ENOUGH_SPACE,
    UNSUPPORTED_ATTACHMENT_TYPE,
    TIMED_OUT,
  ];

  static final $core.List<ConnectionResponseFrame_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static ConnectionResponseFrame_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ConnectionResponseFrame_Status._(super.value, super.name);
}

/// LINT.IfChange
class AttachmentDetails_Type extends $pb.ProtobufEnum {
  static const AttachmentDetails_Type UNKNOWN =
      AttachmentDetails_Type._(0, _omitEnumNames ? '' : 'UNKNOWN');

  /// Represents FileAttachment.
  static const AttachmentDetails_Type FILE =
      AttachmentDetails_Type._(1, _omitEnumNames ? '' : 'FILE');

  /// Represents TextAttachment.
  static const AttachmentDetails_Type TEXT =
      AttachmentDetails_Type._(2, _omitEnumNames ? '' : 'TEXT');

  /// Represents WifiCredentialsAttachment.
  static const AttachmentDetails_Type WIFI_CREDENTIALS =
      AttachmentDetails_Type._(3, _omitEnumNames ? '' : 'WIFI_CREDENTIALS');

  /// Represents AppAttachment.
  static const AttachmentDetails_Type APP =
      AttachmentDetails_Type._(4, _omitEnumNames ? '' : 'APP');

  /// Represents StreamAttachment.
  static const AttachmentDetails_Type STREAM =
      AttachmentDetails_Type._(5, _omitEnumNames ? '' : 'STREAM');

  static const $core.List<AttachmentDetails_Type> values =
      <AttachmentDetails_Type>[
    UNKNOWN,
    FILE,
    TEXT,
    WIFI_CREDENTIALS,
    APP,
    STREAM,
  ];

  static final $core.List<AttachmentDetails_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static AttachmentDetails_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AttachmentDetails_Type._(super.value, super.name);
}

class PairedKeyResultFrame_Status extends $pb.ProtobufEnum {
  static const PairedKeyResultFrame_Status UNKNOWN =
      PairedKeyResultFrame_Status._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const PairedKeyResultFrame_Status SUCCESS =
      PairedKeyResultFrame_Status._(1, _omitEnumNames ? '' : 'SUCCESS');
  static const PairedKeyResultFrame_Status FAIL =
      PairedKeyResultFrame_Status._(2, _omitEnumNames ? '' : 'FAIL');
  static const PairedKeyResultFrame_Status UNABLE =
      PairedKeyResultFrame_Status._(3, _omitEnumNames ? '' : 'UNABLE');

  static const $core.List<PairedKeyResultFrame_Status> values =
      <PairedKeyResultFrame_Status>[
    UNKNOWN,
    SUCCESS,
    FAIL,
    UNABLE,
  ];

  static final $core.List<PairedKeyResultFrame_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static PairedKeyResultFrame_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PairedKeyResultFrame_Status._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
