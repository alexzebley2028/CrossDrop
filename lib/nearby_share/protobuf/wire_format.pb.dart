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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'proto/sharing_enums.pbenum.dart' as $0;
import 'wire_format.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'wire_format.pbenum.dart';

/// File metadata. Does not include the actual bytes of the file.
/// NEXT_ID=10
class FileMetadata extends $pb.GeneratedMessage {
  factory FileMetadata({
    $core.String? name,
    FileMetadata_Type? type,
    $fixnum.Int64? payloadId,
    $fixnum.Int64? size,
    $core.String? mimeType,
    $fixnum.Int64? id,
    $core.String? parentFolder,
    $fixnum.Int64? attachmentHash,
    $core.bool? isSensitiveContent,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    if (payloadId != null) result.payloadId = payloadId;
    if (size != null) result.size = size;
    if (mimeType != null) result.mimeType = mimeType;
    if (id != null) result.id = id;
    if (parentFolder != null) result.parentFolder = parentFolder;
    if (attachmentHash != null) result.attachmentHash = attachmentHash;
    if (isSensitiveContent != null)
      result.isSensitiveContent = isSensitiveContent;
    return result;
  }

  FileMetadata._();

  factory FileMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FileMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FileMetadata',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aE<FileMetadata_Type>(2, _omitFieldNames ? '' : 'type',
        defaultOrMaker: FileMetadata_Type.UNKNOWN,
        enumValues: FileMetadata_Type.values)
    ..aInt64(3, _omitFieldNames ? '' : 'payloadId')
    ..aInt64(4, _omitFieldNames ? '' : 'size')
    ..a<$core.String>(5, _omitFieldNames ? '' : 'mimeType', $pb.PbFieldType.OS,
        defaultOrMaker: 'application/octet-stream')
    ..aInt64(6, _omitFieldNames ? '' : 'id')
    ..aOS(7, _omitFieldNames ? '' : 'parentFolder')
    ..aInt64(8, _omitFieldNames ? '' : 'attachmentHash')
    ..aOB(9, _omitFieldNames ? '' : 'isSensitiveContent')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileMetadata copyWith(void Function(FileMetadata) updates) =>
      super.copyWith((message) => updates(message as FileMetadata))
          as FileMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileMetadata create() => FileMetadata._();
  @$core.override
  FileMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FileMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FileMetadata>(create);
  static FileMetadata? _defaultInstance;

  /// The human readable name of this file (eg. 'Cookbook.pdf').
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// The type of file (eg. 'IMAGE' from 'dog.jpg'). Specifying a type helps
  /// provide a richer experience on the receiving side.
  @$pb.TagNumber(2)
  FileMetadata_Type get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(FileMetadata_Type value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  /// The FILE payload id that will be sent as a follow up containing the actual
  /// bytes of the file.
  @$pb.TagNumber(3)
  $fixnum.Int64 get payloadId => $_getI64(2);
  @$pb.TagNumber(3)
  set payloadId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPayloadId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayloadId() => $_clearField(3);

  /// The total size of the file.
  @$pb.TagNumber(4)
  $fixnum.Int64 get size => $_getI64(3);
  @$pb.TagNumber(4)
  set size($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearSize() => $_clearField(4);

  /// The mimeType of file (eg. 'image/jpeg' from 'dog.jpg'). Specifying a
  /// mimeType helps provide a richer experience on receiving side.
  @$pb.TagNumber(5)
  $core.String get mimeType => $_getS(4, 'application/octet-stream');
  @$pb.TagNumber(5)
  set mimeType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMimeType() => $_has(4);
  @$pb.TagNumber(5)
  void clearMimeType() => $_clearField(5);

  /// A uuid for the attachment. Should be unique across all attachments.
  @$pb.TagNumber(6)
  $fixnum.Int64 get id => $_getI64(5);
  @$pb.TagNumber(6)
  set id($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasId() => $_has(5);
  @$pb.TagNumber(6)
  void clearId() => $_clearField(6);

  /// The parent folder.
  @$pb.TagNumber(7)
  $core.String get parentFolder => $_getSZ(6);
  @$pb.TagNumber(7)
  set parentFolder($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasParentFolder() => $_has(6);
  @$pb.TagNumber(7)
  void clearParentFolder() => $_clearField(7);

  /// A stable identifier for the attachment. Used for receiver to identify same
  /// attachment from different transfers.
  @$pb.TagNumber(8)
  $fixnum.Int64 get attachmentHash => $_getI64(7);
  @$pb.TagNumber(8)
  set attachmentHash($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAttachmentHash() => $_has(7);
  @$pb.TagNumber(8)
  void clearAttachmentHash() => $_clearField(8);

  /// True, if image in file attachment is sensitive
  @$pb.TagNumber(9)
  $core.bool get isSensitiveContent => $_getBF(8);
  @$pb.TagNumber(9)
  set isSensitiveContent($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasIsSensitiveContent() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsSensitiveContent() => $_clearField(9);
}

/// NEXT_ID=8
class TextMetadata extends $pb.GeneratedMessage {
  factory TextMetadata({
    $core.String? textTitle,
    TextMetadata_Type? type,
    $fixnum.Int64? payloadId,
    $fixnum.Int64? size,
    $fixnum.Int64? id,
    $core.bool? isSensitiveText,
  }) {
    final result = create();
    if (textTitle != null) result.textTitle = textTitle;
    if (type != null) result.type = type;
    if (payloadId != null) result.payloadId = payloadId;
    if (size != null) result.size = size;
    if (id != null) result.id = id;
    if (isSensitiveText != null) result.isSensitiveText = isSensitiveText;
    return result;
  }

  TextMetadata._();

  factory TextMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextMetadata',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'textTitle')
    ..aE<TextMetadata_Type>(3, _omitFieldNames ? '' : 'type',
        defaultOrMaker: TextMetadata_Type.UNKNOWN,
        enumValues: TextMetadata_Type.values)
    ..aInt64(4, _omitFieldNames ? '' : 'payloadId')
    ..aInt64(5, _omitFieldNames ? '' : 'size')
    ..aInt64(6, _omitFieldNames ? '' : 'id')
    ..aOB(7, _omitFieldNames ? '' : 'isSensitiveText')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextMetadata copyWith(void Function(TextMetadata) updates) =>
      super.copyWith((message) => updates(message as TextMetadata))
          as TextMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextMetadata create() => TextMetadata._();
  @$core.override
  TextMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TextMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextMetadata>(create);
  static TextMetadata? _defaultInstance;

  /// The title of the text content.
  @$pb.TagNumber(2)
  $core.String get textTitle => $_getSZ(0);
  @$pb.TagNumber(2)
  set textTitle($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasTextTitle() => $_has(0);
  @$pb.TagNumber(2)
  void clearTextTitle() => $_clearField(2);

  /// The type of text (phone number, url, address, or plain text).
  @$pb.TagNumber(3)
  TextMetadata_Type get type => $_getN(1);
  @$pb.TagNumber(3)
  set type(TextMetadata_Type value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  /// The BYTE payload id that will be sent as a follow up containing the actual
  /// bytes of the text.
  @$pb.TagNumber(4)
  $fixnum.Int64 get payloadId => $_getI64(2);
  @$pb.TagNumber(4)
  set payloadId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(4)
  $core.bool hasPayloadId() => $_has(2);
  @$pb.TagNumber(4)
  void clearPayloadId() => $_clearField(4);

  /// The size of the text content.
  @$pb.TagNumber(5)
  $fixnum.Int64 get size => $_getI64(3);
  @$pb.TagNumber(5)
  set size($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(5)
  $core.bool hasSize() => $_has(3);
  @$pb.TagNumber(5)
  void clearSize() => $_clearField(5);

  /// A uuid for the attachment. Should be unique across all attachments.
  @$pb.TagNumber(6)
  $fixnum.Int64 get id => $_getI64(4);
  @$pb.TagNumber(6)
  set id($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(6)
  $core.bool hasId() => $_has(4);
  @$pb.TagNumber(6)
  void clearId() => $_clearField(6);

  /// True if text is sensitive, e.g. password
  @$pb.TagNumber(7)
  $core.bool get isSensitiveText => $_getBF(5);
  @$pb.TagNumber(7)
  set isSensitiveText($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(7)
  $core.bool hasIsSensitiveText() => $_has(5);
  @$pb.TagNumber(7)
  void clearIsSensitiveText() => $_clearField(7);
}

/// NEXT_ID=6
class WifiCredentialsMetadata extends $pb.GeneratedMessage {
  factory WifiCredentialsMetadata({
    $core.String? ssid,
    WifiCredentialsMetadata_SecurityType? securityType,
    $fixnum.Int64? payloadId,
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (ssid != null) result.ssid = ssid;
    if (securityType != null) result.securityType = securityType;
    if (payloadId != null) result.payloadId = payloadId;
    if (id != null) result.id = id;
    return result;
  }

  WifiCredentialsMetadata._();

  factory WifiCredentialsMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WifiCredentialsMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WifiCredentialsMetadata',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'ssid')
    ..aE<WifiCredentialsMetadata_SecurityType>(
        3, _omitFieldNames ? '' : 'securityType',
        defaultOrMaker:
            WifiCredentialsMetadata_SecurityType.UNKNOWN_SECURITY_TYPE,
        enumValues: WifiCredentialsMetadata_SecurityType.values)
    ..aInt64(4, _omitFieldNames ? '' : 'payloadId')
    ..aInt64(5, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WifiCredentialsMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WifiCredentialsMetadata copyWith(
          void Function(WifiCredentialsMetadata) updates) =>
      super.copyWith((message) => updates(message as WifiCredentialsMetadata))
          as WifiCredentialsMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WifiCredentialsMetadata create() => WifiCredentialsMetadata._();
  @$core.override
  WifiCredentialsMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WifiCredentialsMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WifiCredentialsMetadata>(create);
  static WifiCredentialsMetadata? _defaultInstance;

  /// The Wifi network name. This will be sent in introduction.
  @$pb.TagNumber(2)
  $core.String get ssid => $_getSZ(0);
  @$pb.TagNumber(2)
  set ssid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasSsid() => $_has(0);
  @$pb.TagNumber(2)
  void clearSsid() => $_clearField(2);

  /// The security type of network (OPEN, WPA_PSK, WEP).
  @$pb.TagNumber(3)
  WifiCredentialsMetadata_SecurityType get securityType => $_getN(1);
  @$pb.TagNumber(3)
  set securityType(WifiCredentialsMetadata_SecurityType value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSecurityType() => $_has(1);
  @$pb.TagNumber(3)
  void clearSecurityType() => $_clearField(3);

  /// The BYTE payload id that will be sent as a follow up containing the
  /// password.
  @$pb.TagNumber(4)
  $fixnum.Int64 get payloadId => $_getI64(2);
  @$pb.TagNumber(4)
  set payloadId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(4)
  $core.bool hasPayloadId() => $_has(2);
  @$pb.TagNumber(4)
  void clearPayloadId() => $_clearField(4);

  /// A uuid for the attachment. Should be unique across all attachments.
  @$pb.TagNumber(5)
  $fixnum.Int64 get id => $_getI64(3);
  @$pb.TagNumber(5)
  set id($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(5)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(5)
  void clearId() => $_clearField(5);
}

/// NEXT_ID=8
class AppMetadata extends $pb.GeneratedMessage {
  factory AppMetadata({
    $core.String? appName,
    $fixnum.Int64? size,
    $core.Iterable<$fixnum.Int64>? payloadId,
    $fixnum.Int64? id,
    $core.Iterable<$core.String>? fileName,
    $core.Iterable<$fixnum.Int64>? fileSize,
    $core.String? packageName,
  }) {
    final result = create();
    if (appName != null) result.appName = appName;
    if (size != null) result.size = size;
    if (payloadId != null) result.payloadId.addAll(payloadId);
    if (id != null) result.id = id;
    if (fileName != null) result.fileName.addAll(fileName);
    if (fileSize != null) result.fileSize.addAll(fileSize);
    if (packageName != null) result.packageName = packageName;
    return result;
  }

  AppMetadata._();

  factory AppMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AppMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AppMetadata',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'appName')
    ..aInt64(2, _omitFieldNames ? '' : 'size')
    ..p<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'payloadId', $pb.PbFieldType.K6)
    ..aInt64(4, _omitFieldNames ? '' : 'id')
    ..pPS(5, _omitFieldNames ? '' : 'fileName')
    ..p<$fixnum.Int64>(6, _omitFieldNames ? '' : 'fileSize', $pb.PbFieldType.K6)
    ..aOS(7, _omitFieldNames ? '' : 'packageName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppMetadata copyWith(void Function(AppMetadata) updates) =>
      super.copyWith((message) => updates(message as AppMetadata))
          as AppMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AppMetadata create() => AppMetadata._();
  @$core.override
  AppMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AppMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AppMetadata>(create);
  static AppMetadata? _defaultInstance;

  /// The app name. This will be sent in introduction.
  @$pb.TagNumber(1)
  $core.String get appName => $_getSZ(0);
  @$pb.TagNumber(1)
  set appName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAppName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppName() => $_clearField(1);

  /// The size of the all split of apks.
  @$pb.TagNumber(2)
  $fixnum.Int64 get size => $_getI64(1);
  @$pb.TagNumber(2)
  set size($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => $_clearField(2);

  /// The File payload id that will be sent as a follow up containing the
  /// apk paths.
  @$pb.TagNumber(3)
  $pb.PbList<$fixnum.Int64> get payloadId => $_getList(2);

  /// A uuid for the attachment. Should be unique across all attachments.
  @$pb.TagNumber(4)
  $fixnum.Int64 get id => $_getI64(3);
  @$pb.TagNumber(4)
  set id($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => $_clearField(4);

  /// The name of apk file. This will be sent in introduction.
  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get fileName => $_getList(4);

  /// The size of apk file. This will be sent in introduction.
  @$pb.TagNumber(6)
  $pb.PbList<$fixnum.Int64> get fileSize => $_getList(5);

  /// The package name. This will be sent in introduction.
  @$pb.TagNumber(7)
  $core.String get packageName => $_getSZ(6);
  @$pb.TagNumber(7)
  set packageName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPackageName() => $_has(6);
  @$pb.TagNumber(7)
  void clearPackageName() => $_clearField(7);
}

/// NEXT_ID=5
class StreamMetadata extends $pb.GeneratedMessage {
  factory StreamMetadata({
    $core.String? description,
    $core.String? packageName,
    $fixnum.Int64? payloadId,
    $core.String? attributedAppName,
  }) {
    final result = create();
    if (description != null) result.description = description;
    if (packageName != null) result.packageName = packageName;
    if (payloadId != null) result.payloadId = payloadId;
    if (attributedAppName != null) result.attributedAppName = attributedAppName;
    return result;
  }

  StreamMetadata._();

  factory StreamMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamMetadata',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'description')
    ..aOS(2, _omitFieldNames ? '' : 'packageName')
    ..aInt64(3, _omitFieldNames ? '' : 'payloadId')
    ..aOS(4, _omitFieldNames ? '' : 'attributedAppName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamMetadata copyWith(void Function(StreamMetadata) updates) =>
      super.copyWith((message) => updates(message as StreamMetadata))
          as StreamMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamMetadata create() => StreamMetadata._();
  @$core.override
  StreamMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StreamMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamMetadata>(create);
  static StreamMetadata? _defaultInstance;

  /// A human readable description for the stream.
  @$pb.TagNumber(1)
  $core.String get description => $_getSZ(0);
  @$pb.TagNumber(1)
  set description($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearDescription() => $_clearField(1);

  /// The package name of the sending application.
  @$pb.TagNumber(2)
  $core.String get packageName => $_getSZ(1);
  @$pb.TagNumber(2)
  set packageName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPackageName() => $_has(1);
  @$pb.TagNumber(2)
  void clearPackageName() => $_clearField(2);

  /// The payload type id that will be sent as a followup containing the
  /// ParcelFileDescriptor.
  @$pb.TagNumber(3)
  $fixnum.Int64 get payloadId => $_getI64(2);
  @$pb.TagNumber(3)
  set payloadId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPayloadId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayloadId() => $_clearField(3);

  /// The human-readable name of the package that should be displayed as
  /// attribution if no other information is available (i.e. the package is not
  /// installed locally yet).
  @$pb.TagNumber(4)
  $core.String get attributedAppName => $_getSZ(3);
  @$pb.TagNumber(4)
  set attributedAppName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAttributedAppName() => $_has(3);
  @$pb.TagNumber(4)
  void clearAttributedAppName() => $_clearField(4);
}

/// A frame used when sending messages over the wire.
/// NEXT_ID=3
class Frame extends $pb.GeneratedMessage {
  factory Frame({
    Frame_Version? version,
    V1Frame? v1,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (v1 != null) result.v1 = v1;
    return result;
  }

  Frame._();

  factory Frame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Frame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Frame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aE<Frame_Version>(1, _omitFieldNames ? '' : 'version',
        enumValues: Frame_Version.values)
    ..aOM<V1Frame>(2, _omitFieldNames ? '' : 'v1', subBuilder: V1Frame.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Frame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Frame copyWith(void Function(Frame) updates) =>
      super.copyWith((message) => updates(message as Frame)) as Frame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Frame create() => Frame._();
  @$core.override
  Frame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Frame getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Frame>(create);
  static Frame? _defaultInstance;

  @$pb.TagNumber(1)
  Frame_Version get version => $_getN(0);
  @$pb.TagNumber(1)
  set version(Frame_Version value) => $_setField(1, value);
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

/// NEXT_ID=9
class V1Frame extends $pb.GeneratedMessage {
  factory V1Frame({
    V1Frame_FrameType? type,
    IntroductionFrame? introduction,
    ConnectionResponseFrame? connectionResponse,
    PairedKeyEncryptionFrame? pairedKeyEncryption,
    PairedKeyResultFrame? pairedKeyResult,
    @$core.Deprecated('This field is deprecated.')
    CertificateInfoFrame? certificateInfo,
    @$core.Deprecated('This field is deprecated.')
    ProgressUpdateFrame? progressUpdate,
    BindingFrame? bindings,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (introduction != null) result.introduction = introduction;
    if (connectionResponse != null)
      result.connectionResponse = connectionResponse;
    if (pairedKeyEncryption != null)
      result.pairedKeyEncryption = pairedKeyEncryption;
    if (pairedKeyResult != null) result.pairedKeyResult = pairedKeyResult;
    if (certificateInfo != null) result.certificateInfo = certificateInfo;
    if (progressUpdate != null) result.progressUpdate = progressUpdate;
    if (bindings != null) result.bindings = bindings;
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
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aE<V1Frame_FrameType>(1, _omitFieldNames ? '' : 'type',
        enumValues: V1Frame_FrameType.values)
    ..aOM<IntroductionFrame>(2, _omitFieldNames ? '' : 'introduction',
        subBuilder: IntroductionFrame.create)
    ..aOM<ConnectionResponseFrame>(
        3, _omitFieldNames ? '' : 'connectionResponse',
        subBuilder: ConnectionResponseFrame.create)
    ..aOM<PairedKeyEncryptionFrame>(
        4, _omitFieldNames ? '' : 'pairedKeyEncryption',
        subBuilder: PairedKeyEncryptionFrame.create)
    ..aOM<PairedKeyResultFrame>(5, _omitFieldNames ? '' : 'pairedKeyResult',
        subBuilder: PairedKeyResultFrame.create)
    ..aOM<CertificateInfoFrame>(6, _omitFieldNames ? '' : 'certificateInfo',
        subBuilder: CertificateInfoFrame.create)
    ..aOM<ProgressUpdateFrame>(7, _omitFieldNames ? '' : 'progressUpdate',
        subBuilder: ProgressUpdateFrame.create)
    ..aOM<BindingFrame>(8, _omitFieldNames ? '' : 'bindings',
        subBuilder: BindingFrame.create)
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

  /// At most one of the following fields will be set.
  @$pb.TagNumber(2)
  IntroductionFrame get introduction => $_getN(1);
  @$pb.TagNumber(2)
  set introduction(IntroductionFrame value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasIntroduction() => $_has(1);
  @$pb.TagNumber(2)
  void clearIntroduction() => $_clearField(2);
  @$pb.TagNumber(2)
  IntroductionFrame ensureIntroduction() => $_ensure(1);

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
  PairedKeyEncryptionFrame get pairedKeyEncryption => $_getN(3);
  @$pb.TagNumber(4)
  set pairedKeyEncryption(PairedKeyEncryptionFrame value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPairedKeyEncryption() => $_has(3);
  @$pb.TagNumber(4)
  void clearPairedKeyEncryption() => $_clearField(4);
  @$pb.TagNumber(4)
  PairedKeyEncryptionFrame ensurePairedKeyEncryption() => $_ensure(3);

  @$pb.TagNumber(5)
  PairedKeyResultFrame get pairedKeyResult => $_getN(4);
  @$pb.TagNumber(5)
  set pairedKeyResult(PairedKeyResultFrame value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPairedKeyResult() => $_has(4);
  @$pb.TagNumber(5)
  void clearPairedKeyResult() => $_clearField(5);
  @$pb.TagNumber(5)
  PairedKeyResultFrame ensurePairedKeyResult() => $_ensure(4);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  CertificateInfoFrame get certificateInfo => $_getN(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set certificateInfo(CertificateInfoFrame value) => $_setField(6, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasCertificateInfo() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearCertificateInfo() => $_clearField(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  CertificateInfoFrame ensureCertificateInfo() => $_ensure(5);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  ProgressUpdateFrame get progressUpdate => $_getN(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  set progressUpdate(ProgressUpdateFrame value) => $_setField(7, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  $core.bool hasProgressUpdate() => $_has(6);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  void clearProgressUpdate() => $_clearField(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  ProgressUpdateFrame ensureProgressUpdate() => $_ensure(6);

  @$pb.TagNumber(8)
  BindingFrame get bindings => $_getN(7);
  @$pb.TagNumber(8)
  set bindings(BindingFrame value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasBindings() => $_has(7);
  @$pb.TagNumber(8)
  void clearBindings() => $_clearField(8);
  @$pb.TagNumber(8)
  BindingFrame ensureBindings() => $_ensure(7);
}

/// An introduction packet sent by the sending side. Contains a list of files
/// they'd like to share.
/// NEXT_ID=10
class IntroductionFrame extends $pb.GeneratedMessage {
  factory IntroductionFrame({
    $core.Iterable<FileMetadata>? fileMetadata,
    $core.Iterable<TextMetadata>? textMetadata,
    $core.String? requiredPackage,
    $core.Iterable<WifiCredentialsMetadata>? wifiCredentialsMetadata,
    $core.Iterable<AppMetadata>? appMetadata,
    $core.bool? startTransfer,
    $core.Iterable<StreamMetadata>? streamMetadata,
    IntroductionFrame_SharingUseCase? useCase,
    $core.Iterable<$fixnum.Int64>? previewPayloadIds,
  }) {
    final result = create();
    if (fileMetadata != null) result.fileMetadata.addAll(fileMetadata);
    if (textMetadata != null) result.textMetadata.addAll(textMetadata);
    if (requiredPackage != null) result.requiredPackage = requiredPackage;
    if (wifiCredentialsMetadata != null)
      result.wifiCredentialsMetadata.addAll(wifiCredentialsMetadata);
    if (appMetadata != null) result.appMetadata.addAll(appMetadata);
    if (startTransfer != null) result.startTransfer = startTransfer;
    if (streamMetadata != null) result.streamMetadata.addAll(streamMetadata);
    if (useCase != null) result.useCase = useCase;
    if (previewPayloadIds != null)
      result.previewPayloadIds.addAll(previewPayloadIds);
    return result;
  }

  IntroductionFrame._();

  factory IntroductionFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IntroductionFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IntroductionFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..pPM<FileMetadata>(1, _omitFieldNames ? '' : 'fileMetadata',
        subBuilder: FileMetadata.create)
    ..pPM<TextMetadata>(2, _omitFieldNames ? '' : 'textMetadata',
        subBuilder: TextMetadata.create)
    ..aOS(3, _omitFieldNames ? '' : 'requiredPackage')
    ..pPM<WifiCredentialsMetadata>(
        4, _omitFieldNames ? '' : 'wifiCredentialsMetadata',
        subBuilder: WifiCredentialsMetadata.create)
    ..pPM<AppMetadata>(5, _omitFieldNames ? '' : 'appMetadata',
        subBuilder: AppMetadata.create)
    ..aOB(6, _omitFieldNames ? '' : 'startTransfer')
    ..pPM<StreamMetadata>(7, _omitFieldNames ? '' : 'streamMetadata',
        subBuilder: StreamMetadata.create)
    ..aE<IntroductionFrame_SharingUseCase>(8, _omitFieldNames ? '' : 'useCase',
        enumValues: IntroductionFrame_SharingUseCase.values)
    ..p<$fixnum.Int64>(
        9, _omitFieldNames ? '' : 'previewPayloadIds', $pb.PbFieldType.P6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IntroductionFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IntroductionFrame copyWith(void Function(IntroductionFrame) updates) =>
      super.copyWith((message) => updates(message as IntroductionFrame))
          as IntroductionFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IntroductionFrame create() => IntroductionFrame._();
  @$core.override
  IntroductionFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IntroductionFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IntroductionFrame>(create);
  static IntroductionFrame? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<FileMetadata> get fileMetadata => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<TextMetadata> get textMetadata => $_getList(1);

  /// The required app package to open the content. May be null.
  @$pb.TagNumber(3)
  $core.String get requiredPackage => $_getSZ(2);
  @$pb.TagNumber(3)
  set requiredPackage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRequiredPackage() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequiredPackage() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<WifiCredentialsMetadata> get wifiCredentialsMetadata =>
      $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<AppMetadata> get appMetadata => $_getList(4);

  @$pb.TagNumber(6)
  $core.bool get startTransfer => $_getBF(5);
  @$pb.TagNumber(6)
  set startTransfer($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStartTransfer() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartTransfer() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<StreamMetadata> get streamMetadata => $_getList(6);

  @$pb.TagNumber(8)
  IntroductionFrame_SharingUseCase get useCase => $_getN(7);
  @$pb.TagNumber(8)
  set useCase(IntroductionFrame_SharingUseCase value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasUseCase() => $_has(7);
  @$pb.TagNumber(8)
  void clearUseCase() => $_clearField(8);

  @$pb.TagNumber(9)
  $pb.PbList<$fixnum.Int64> get previewPayloadIds => $_getList(8);
}

/// A progress update packet sent by the sending side. Contains transfer progress
/// value. NEXT_ID=3
class ProgressUpdateFrame extends $pb.GeneratedMessage {
  factory ProgressUpdateFrame({
    $core.double? progress,
    $core.bool? startTransfer,
  }) {
    final result = create();
    if (progress != null) result.progress = progress;
    if (startTransfer != null) result.startTransfer = startTransfer;
    return result;
  }

  ProgressUpdateFrame._();

  factory ProgressUpdateFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProgressUpdateFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProgressUpdateFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'progress', fieldType: $pb.PbFieldType.OF)
    ..aOB(2, _omitFieldNames ? '' : 'startTransfer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProgressUpdateFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProgressUpdateFrame copyWith(void Function(ProgressUpdateFrame) updates) =>
      super.copyWith((message) => updates(message as ProgressUpdateFrame))
          as ProgressUpdateFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProgressUpdateFrame create() => ProgressUpdateFrame._();
  @$core.override
  ProgressUpdateFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProgressUpdateFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProgressUpdateFrame>(create);
  static ProgressUpdateFrame? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get progress => $_getN(0);
  @$pb.TagNumber(1)
  set progress($core.double value) => $_setFloat(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProgress() => $_has(0);
  @$pb.TagNumber(1)
  void clearProgress() => $_clearField(1);

  /// True, if the receiver should start bandwidth upgrade and receiving the
  /// payloads.
  @$pb.TagNumber(2)
  $core.bool get startTransfer => $_getBF(1);
  @$pb.TagNumber(2)
  set startTransfer($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartTransfer() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTransfer() => $_clearField(2);
}

enum BindingFrame_Content { bindingRequest, bindingResponse, notSet }

/// Messages used to create pair bindings between devices.
/// An initiator device requests a new bindingId from the BE using the
/// InitiateBinding rpc.  This new bindingId is passed to the peer device using
/// a BindingRequest frame.  The peer device will use this bindingId to call
/// JoinBinding rpc.  If successful, the peer device is response with a
/// BindingResponse frame with status of SUCCESS.
class BindingFrame extends $pb.GeneratedMessage {
  factory BindingFrame({
    BindingRequest? bindingRequest,
    BindingResponse? bindingResponse,
  }) {
    final result = create();
    if (bindingRequest != null) result.bindingRequest = bindingRequest;
    if (bindingResponse != null) result.bindingResponse = bindingResponse;
    return result;
  }

  BindingFrame._();

  factory BindingFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BindingFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, BindingFrame_Content>
      _BindingFrame_ContentByTag = {
    1: BindingFrame_Content.bindingRequest,
    2: BindingFrame_Content.bindingResponse,
    0: BindingFrame_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BindingFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<BindingRequest>(1, _omitFieldNames ? '' : 'bindingRequest',
        subBuilder: BindingRequest.create)
    ..aOM<BindingResponse>(2, _omitFieldNames ? '' : 'bindingResponse',
        subBuilder: BindingResponse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindingFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindingFrame copyWith(void Function(BindingFrame) updates) =>
      super.copyWith((message) => updates(message as BindingFrame))
          as BindingFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BindingFrame create() => BindingFrame._();
  @$core.override
  BindingFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BindingFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BindingFrame>(create);
  static BindingFrame? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  BindingFrame_Content whichContent() =>
      _BindingFrame_ContentByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearContent() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  BindingRequest get bindingRequest => $_getN(0);
  @$pb.TagNumber(1)
  set bindingRequest(BindingRequest value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBindingRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearBindingRequest() => $_clearField(1);
  @$pb.TagNumber(1)
  BindingRequest ensureBindingRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  BindingResponse get bindingResponse => $_getN(1);
  @$pb.TagNumber(2)
  set bindingResponse(BindingResponse value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBindingResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearBindingResponse() => $_clearField(2);
  @$pb.TagNumber(2)
  BindingResponse ensureBindingResponse() => $_ensure(1);
}

class BindingRequest extends $pb.GeneratedMessage {
  factory BindingRequest({
    $core.String? bindingId,
    BindingRequest_Type? type,
  }) {
    final result = create();
    if (bindingId != null) result.bindingId = bindingId;
    if (type != null) result.type = type;
    return result;
  }

  BindingRequest._();

  factory BindingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BindingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BindingRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'bindingId')
    ..aE<BindingRequest_Type>(2, _omitFieldNames ? '' : 'type',
        enumValues: BindingRequest_Type.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindingRequest copyWith(void Function(BindingRequest) updates) =>
      super.copyWith((message) => updates(message as BindingRequest))
          as BindingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BindingRequest create() => BindingRequest._();
  @$core.override
  BindingRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BindingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BindingRequest>(create);
  static BindingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bindingId => $_getSZ(0);
  @$pb.TagNumber(1)
  set bindingId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBindingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBindingId() => $_clearField(1);

  @$pb.TagNumber(2)
  BindingRequest_Type get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(BindingRequest_Type value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);
}

class BindingResponse extends $pb.GeneratedMessage {
  factory BindingResponse({
    BindingResponse_Status? status,
  }) {
    final result = create();
    if (status != null) result.status = status;
    return result;
  }

  BindingResponse._();

  factory BindingResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BindingResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BindingResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aE<BindingResponse_Status>(1, _omitFieldNames ? '' : 'status',
        enumValues: BindingResponse_Status.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindingResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindingResponse copyWith(void Function(BindingResponse) updates) =>
      super.copyWith((message) => updates(message as BindingResponse))
          as BindingResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BindingResponse create() => BindingResponse._();
  @$core.override
  BindingResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BindingResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BindingResponse>(create);
  static BindingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  BindingResponse_Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(BindingResponse_Status value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);
}

/// A response packet sent by the receiving side. Accepts or rejects the list of
/// files.
/// NEXT_ID=4
class ConnectionResponseFrame extends $pb.GeneratedMessage {
  factory ConnectionResponseFrame({
    ConnectionResponseFrame_Status? status,
    $core.Iterable<$core.MapEntry<$fixnum.Int64, AttachmentDetails>>?
        attachmentDetails,
    $core.Iterable<StreamMetadata>? streamMetadata,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (attachmentDetails != null)
      result.attachmentDetails.addEntries(attachmentDetails);
    if (streamMetadata != null) result.streamMetadata.addAll(streamMetadata);
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
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aE<ConnectionResponseFrame_Status>(1, _omitFieldNames ? '' : 'status',
        enumValues: ConnectionResponseFrame_Status.values)
    ..m<$fixnum.Int64, AttachmentDetails>(
        2, _omitFieldNames ? '' : 'attachmentDetails',
        entryClassName: 'ConnectionResponseFrame.AttachmentDetailsEntry',
        keyFieldType: $pb.PbFieldType.O6,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: AttachmentDetails.create,
        valueDefaultOrMaker: AttachmentDetails.getDefault,
        packageName: const $pb.PackageName('nearby.sharing.service.proto'))
    ..pPM<StreamMetadata>(3, _omitFieldNames ? '' : 'streamMetadata',
        subBuilder: StreamMetadata.create)
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

  /// The receiving side's response.
  @$pb.TagNumber(1)
  ConnectionResponseFrame_Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(ConnectionResponseFrame_Status value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  /// Key is attachment hash, value is the details of attachment.
  @$pb.TagNumber(2)
  $pb.PbMap<$fixnum.Int64, AttachmentDetails> get attachmentDetails =>
      $_getMap(1);

  /// In the case of a stream attachments, the other side of the pipe.
  /// Both sender and receiver should validate matching counts.
  @$pb.TagNumber(3)
  $pb.PbList<StreamMetadata> get streamMetadata => $_getList(2);
}

/// Attachment details that sent in ConnectionResponseFrame.
/// NEXT_ID=3
class AttachmentDetails extends $pb.GeneratedMessage {
  factory AttachmentDetails({
    AttachmentDetails_Type? type,
    FileAttachmentDetails? fileAttachmentDetails,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (fileAttachmentDetails != null)
      result.fileAttachmentDetails = fileAttachmentDetails;
    return result;
  }

  AttachmentDetails._();

  factory AttachmentDetails.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AttachmentDetails.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AttachmentDetails',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aE<AttachmentDetails_Type>(1, _omitFieldNames ? '' : 'type',
        enumValues: AttachmentDetails_Type.values)
    ..aOM<FileAttachmentDetails>(
        2, _omitFieldNames ? '' : 'fileAttachmentDetails',
        subBuilder: FileAttachmentDetails.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AttachmentDetails clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AttachmentDetails copyWith(void Function(AttachmentDetails) updates) =>
      super.copyWith((message) => updates(message as AttachmentDetails))
          as AttachmentDetails;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AttachmentDetails create() => AttachmentDetails._();
  @$core.override
  AttachmentDetails createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AttachmentDetails getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AttachmentDetails>(create);
  static AttachmentDetails? _defaultInstance;

  /// The attachment family type.
  @$pb.TagNumber(1)
  AttachmentDetails_Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(AttachmentDetails_Type value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  /// This field is only for FILE type.
  @$pb.TagNumber(2)
  FileAttachmentDetails get fileAttachmentDetails => $_getN(1);
  @$pb.TagNumber(2)
  set fileAttachmentDetails(FileAttachmentDetails value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFileAttachmentDetails() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileAttachmentDetails() => $_clearField(2);
  @$pb.TagNumber(2)
  FileAttachmentDetails ensureFileAttachmentDetails() => $_ensure(1);
}

/// File attachment details included in ConnectionResponseFrame.
/// NEXT_ID=3
class FileAttachmentDetails extends $pb.GeneratedMessage {
  factory FileAttachmentDetails({
    $fixnum.Int64? receiverExistingFileSize,
    $core.Iterable<$core.MapEntry<$fixnum.Int64, PayloadsDetails>>?
        attachmentHashPayloads,
  }) {
    final result = create();
    if (receiverExistingFileSize != null)
      result.receiverExistingFileSize = receiverExistingFileSize;
    if (attachmentHashPayloads != null)
      result.attachmentHashPayloads.addEntries(attachmentHashPayloads);
    return result;
  }

  FileAttachmentDetails._();

  factory FileAttachmentDetails.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FileAttachmentDetails.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FileAttachmentDetails',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'receiverExistingFileSize')
    ..m<$fixnum.Int64, PayloadsDetails>(
        2, _omitFieldNames ? '' : 'attachmentHashPayloads',
        entryClassName: 'FileAttachmentDetails.AttachmentHashPayloadsEntry',
        keyFieldType: $pb.PbFieldType.O6,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: PayloadsDetails.create,
        valueDefaultOrMaker: PayloadsDetails.getDefault,
        packageName: const $pb.PackageName('nearby.sharing.service.proto'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileAttachmentDetails clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FileAttachmentDetails copyWith(
          void Function(FileAttachmentDetails) updates) =>
      super.copyWith((message) => updates(message as FileAttachmentDetails))
          as FileAttachmentDetails;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileAttachmentDetails create() => FileAttachmentDetails._();
  @$core.override
  FileAttachmentDetails createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FileAttachmentDetails getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FileAttachmentDetails>(create);
  static FileAttachmentDetails? _defaultInstance;

  /// Existing local file size on receiver side.
  @$pb.TagNumber(1)
  $fixnum.Int64 get receiverExistingFileSize => $_getI64(0);
  @$pb.TagNumber(1)
  set receiverExistingFileSize($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReceiverExistingFileSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearReceiverExistingFileSize() => $_clearField(1);

  /// The key is attachment hash, a stable identifier for the attachment.
  /// Value is list of payload details transferred for the attachment.
  @$pb.TagNumber(2)
  $pb.PbMap<$fixnum.Int64, PayloadsDetails> get attachmentHashPayloads =>
      $_getMap(1);
}

/// NEXT_ID=2
class PayloadsDetails extends $pb.GeneratedMessage {
  factory PayloadsDetails({
    $core.Iterable<PayloadDetails>? payloadDetails,
  }) {
    final result = create();
    if (payloadDetails != null) result.payloadDetails.addAll(payloadDetails);
    return result;
  }

  PayloadsDetails._();

  factory PayloadsDetails.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayloadsDetails.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayloadsDetails',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..pPM<PayloadDetails>(1, _omitFieldNames ? '' : 'payloadDetails',
        subBuilder: PayloadDetails.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayloadsDetails clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayloadsDetails copyWith(void Function(PayloadsDetails) updates) =>
      super.copyWith((message) => updates(message as PayloadsDetails))
          as PayloadsDetails;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayloadsDetails create() => PayloadsDetails._();
  @$core.override
  PayloadsDetails createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayloadsDetails getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayloadsDetails>(create);
  static PayloadsDetails? _defaultInstance;

  /// The list should be sorted by creation timestamp.
  @$pb.TagNumber(1)
  $pb.PbList<PayloadDetails> get payloadDetails => $_getList(0);
}

/// Metadata of a payload file created by Nearby Connections.
/// NEXT_ID=4
class PayloadDetails extends $pb.GeneratedMessage {
  factory PayloadDetails({
    $fixnum.Int64? id,
    $fixnum.Int64? creationTimestampMillis,
    $fixnum.Int64? size,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (creationTimestampMillis != null)
      result.creationTimestampMillis = creationTimestampMillis;
    if (size != null) result.size = size;
    return result;
  }

  PayloadDetails._();

  factory PayloadDetails.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayloadDetails.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayloadDetails',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'creationTimestampMillis')
    ..aInt64(3, _omitFieldNames ? '' : 'size')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayloadDetails clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayloadDetails copyWith(void Function(PayloadDetails) updates) =>
      super.copyWith((message) => updates(message as PayloadDetails))
          as PayloadDetails;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayloadDetails create() => PayloadDetails._();
  @$core.override
  PayloadDetails createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayloadDetails getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayloadDetails>(create);
  static PayloadDetails? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get creationTimestampMillis => $_getI64(1);
  @$pb.TagNumber(2)
  set creationTimestampMillis($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreationTimestampMillis() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreationTimestampMillis() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(2);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearSize() => $_clearField(3);
}

/// A paired key encryption packet sent between devices, contains signed data.
/// NEXT_ID=5
class PairedKeyEncryptionFrame extends $pb.GeneratedMessage {
  factory PairedKeyEncryptionFrame({
    $core.List<$core.int>? signedData,
    $core.List<$core.int>? secretIdHash,
    $core.List<$core.int>? optionalSignedData,
    $core.List<$core.int>? qrCodeHandshakeData,
  }) {
    final result = create();
    if (signedData != null) result.signedData = signedData;
    if (secretIdHash != null) result.secretIdHash = secretIdHash;
    if (optionalSignedData != null)
      result.optionalSignedData = optionalSignedData;
    if (qrCodeHandshakeData != null)
      result.qrCodeHandshakeData = qrCodeHandshakeData;
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
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signedData', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'secretIdHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'optionalSignedData', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'qrCodeHandshakeData', $pb.PbFieldType.OY)
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

  /// The encrypted data in byte array format.
  @$pb.TagNumber(1)
  $core.List<$core.int> get signedData => $_getN(0);
  @$pb.TagNumber(1)
  set signedData($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignedData() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignedData() => $_clearField(1);

  /// The hash of a certificate id.
  @$pb.TagNumber(2)
  $core.List<$core.int> get secretIdHash => $_getN(1);
  @$pb.TagNumber(2)
  set secretIdHash($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSecretIdHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecretIdHash() => $_clearField(2);

  /// An optional encrypted data in byte array format.
  @$pb.TagNumber(3)
  $core.List<$core.int> get optionalSignedData => $_getN(2);
  @$pb.TagNumber(3)
  set optionalSignedData($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOptionalSignedData() => $_has(2);
  @$pb.TagNumber(3)
  void clearOptionalSignedData() => $_clearField(3);

  /// An optional QR code handshake data in a byte array format.
  /// For incoming connection contains a signature of the UKEY2
  /// token, created with the sender's private key.
  /// For outgoing connection contains an HKDF of the connection token and of the
  /// UKEY2 token
  @$pb.TagNumber(4)
  $core.List<$core.int> get qrCodeHandshakeData => $_getN(3);
  @$pb.TagNumber(4)
  set qrCodeHandshakeData($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQrCodeHandshakeData() => $_has(3);
  @$pb.TagNumber(4)
  void clearQrCodeHandshakeData() => $_clearField(4);
}

/// A paired key verification result packet sent between devices.
/// NEXT_ID=3
class PairedKeyResultFrame extends $pb.GeneratedMessage {
  factory PairedKeyResultFrame({
    PairedKeyResultFrame_Status? status,
    $0.OSType? osType,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (osType != null) result.osType = osType;
    return result;
  }

  PairedKeyResultFrame._();

  factory PairedKeyResultFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairedKeyResultFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairedKeyResultFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aE<PairedKeyResultFrame_Status>(1, _omitFieldNames ? '' : 'status',
        enumValues: PairedKeyResultFrame_Status.values)
    ..aE<$0.OSType>(2, _omitFieldNames ? '' : 'osType',
        enumValues: $0.OSType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairedKeyResultFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairedKeyResultFrame copyWith(void Function(PairedKeyResultFrame) updates) =>
      super.copyWith((message) => updates(message as PairedKeyResultFrame))
          as PairedKeyResultFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairedKeyResultFrame create() => PairedKeyResultFrame._();
  @$core.override
  PairedKeyResultFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PairedKeyResultFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairedKeyResultFrame>(create);
  static PairedKeyResultFrame? _defaultInstance;

  /// The verification result.
  @$pb.TagNumber(1)
  PairedKeyResultFrame_Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(PairedKeyResultFrame_Status value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  /// OS type.
  @$pb.TagNumber(2)
  $0.OSType get osType => $_getN(1);
  @$pb.TagNumber(2)
  set osType($0.OSType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOsType() => $_has(1);
  @$pb.TagNumber(2)
  void clearOsType() => $_clearField(2);
}

/// A package containing certificate info to be shared to remote device offline.
/// NEXT_ID=2
class CertificateInfoFrame extends $pb.GeneratedMessage {
  factory CertificateInfoFrame({
    $core.Iterable<PublicCertificate>? publicCertificate,
  }) {
    final result = create();
    if (publicCertificate != null)
      result.publicCertificate.addAll(publicCertificate);
    return result;
  }

  CertificateInfoFrame._();

  factory CertificateInfoFrame.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CertificateInfoFrame.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CertificateInfoFrame',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..pPM<PublicCertificate>(1, _omitFieldNames ? '' : 'publicCertificate',
        subBuilder: PublicCertificate.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CertificateInfoFrame clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CertificateInfoFrame copyWith(void Function(CertificateInfoFrame) updates) =>
      super.copyWith((message) => updates(message as CertificateInfoFrame))
          as CertificateInfoFrame;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CertificateInfoFrame create() => CertificateInfoFrame._();
  @$core.override
  CertificateInfoFrame createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CertificateInfoFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CertificateInfoFrame>(create);
  static CertificateInfoFrame? _defaultInstance;

  /// The public certificates to be shared with remote devices.
  @$pb.TagNumber(1)
  $pb.PbList<PublicCertificate> get publicCertificate => $_getList(0);
}

/// A public certificate from the local device.
/// NEXT_ID=8
class PublicCertificate extends $pb.GeneratedMessage {
  factory PublicCertificate({
    $core.List<$core.int>? secretId,
    $core.List<$core.int>? authenticityKey,
    $core.List<$core.int>? publicKey,
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
    $core.List<$core.int>? encryptedMetadataBytes,
    $core.List<$core.int>? metadataEncryptionKeyTag,
  }) {
    final result = create();
    if (secretId != null) result.secretId = secretId;
    if (authenticityKey != null) result.authenticityKey = authenticityKey;
    if (publicKey != null) result.publicKey = publicKey;
    if (startTime != null) result.startTime = startTime;
    if (endTime != null) result.endTime = endTime;
    if (encryptedMetadataBytes != null)
      result.encryptedMetadataBytes = encryptedMetadataBytes;
    if (metadataEncryptionKeyTag != null)
      result.metadataEncryptionKeyTag = metadataEncryptionKeyTag;
    return result;
  }

  PublicCertificate._();

  factory PublicCertificate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PublicCertificate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PublicCertificate',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'secretId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'authenticityKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..aInt64(4, _omitFieldNames ? '' : 'startTime')
    ..aInt64(5, _omitFieldNames ? '' : 'endTime')
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'encryptedMetadataBytes', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(7,
        _omitFieldNames ? '' : 'metadataEncryptionKeyTag', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublicCertificate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublicCertificate copyWith(void Function(PublicCertificate) updates) =>
      super.copyWith((message) => updates(message as PublicCertificate))
          as PublicCertificate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublicCertificate create() => PublicCertificate._();
  @$core.override
  PublicCertificate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PublicCertificate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PublicCertificate>(create);
  static PublicCertificate? _defaultInstance;

  /// The unique id of the public certificate.
  @$pb.TagNumber(1)
  $core.List<$core.int> get secretId => $_getN(0);
  @$pb.TagNumber(1)
  set secretId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSecretId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecretId() => $_clearField(1);

  /// A bytes representation of a Secret Key owned by contact, to decrypt the
  /// metadata_key stored within the advertisement.
  @$pb.TagNumber(2)
  $core.List<$core.int> get authenticityKey => $_getN(1);
  @$pb.TagNumber(2)
  set authenticityKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAuthenticityKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthenticityKey() => $_clearField(2);

  /// A bytes representation a public key of X509Certificate, owned by contact,
  /// to decrypt encrypted UKEY2 (from Nearby Connections API) as a hand shake in
  /// contact verification phase.
  @$pb.TagNumber(3)
  $core.List<$core.int> get publicKey => $_getN(2);
  @$pb.TagNumber(3)
  set publicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicKey() => $_clearField(3);

  /// The time in millis from epoch when this certificate becomes effective.
  @$pb.TagNumber(4)
  $fixnum.Int64 get startTime => $_getI64(3);
  @$pb.TagNumber(4)
  set startTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStartTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartTime() => $_clearField(4);

  /// The time in millis from epoch when this certificate expires.
  @$pb.TagNumber(5)
  $fixnum.Int64 get endTime => $_getI64(4);
  @$pb.TagNumber(5)
  set endTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEndTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndTime() => $_clearField(5);

  /// The encrypted metadata in bytes, contains personal information of the
  /// device/user who created this certificate. Needs to be decrypted into bytes,
  /// and converted back to EncryptedMetadata object to access fields.
  @$pb.TagNumber(6)
  $core.List<$core.int> get encryptedMetadataBytes => $_getN(5);
  @$pb.TagNumber(6)
  set encryptedMetadataBytes($core.List<$core.int> value) =>
      $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEncryptedMetadataBytes() => $_has(5);
  @$pb.TagNumber(6)
  void clearEncryptedMetadataBytes() => $_clearField(6);

  /// The tag for verifying metadata_encryption_key.
  @$pb.TagNumber(7)
  $core.List<$core.int> get metadataEncryptionKeyTag => $_getN(6);
  @$pb.TagNumber(7)
  set metadataEncryptionKeyTag($core.List<$core.int> value) =>
      $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMetadataEncryptionKeyTag() => $_has(6);
  @$pb.TagNumber(7)
  void clearMetadataEncryptionKeyTag() => $_clearField(7);
}

/// NEXT_ID=3
class WifiCredentials extends $pb.GeneratedMessage {
  factory WifiCredentials({
    $core.String? password,
    $core.bool? hiddenSsid,
  }) {
    final result = create();
    if (password != null) result.password = password;
    if (hiddenSsid != null) result.hiddenSsid = hiddenSsid;
    return result;
  }

  WifiCredentials._();

  factory WifiCredentials.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WifiCredentials.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WifiCredentials',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'password')
    ..aOB(2, _omitFieldNames ? '' : 'hiddenSsid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WifiCredentials clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WifiCredentials copyWith(void Function(WifiCredentials) updates) =>
      super.copyWith((message) => updates(message as WifiCredentials))
          as WifiCredentials;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WifiCredentials create() => WifiCredentials._();
  @$core.override
  WifiCredentials createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WifiCredentials getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WifiCredentials>(create);
  static WifiCredentials? _defaultInstance;

  /// Wi-Fi password.
  @$pb.TagNumber(1)
  $core.String get password => $_getSZ(0);
  @$pb.TagNumber(1)
  set password($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassword() => $_clearField(1);

  /// True if the network is a hidden network that is not broadcasting its SSID.
  /// Default is false.
  @$pb.TagNumber(2)
  $core.bool get hiddenSsid => $_getBF(1);
  @$pb.TagNumber(2)
  set hiddenSsid($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHiddenSsid() => $_has(1);
  @$pb.TagNumber(2)
  void clearHiddenSsid() => $_clearField(2);
}

/// NEXT_ID=2
class StreamDetails extends $pb.GeneratedMessage {
  factory StreamDetails({
    $core.List<$core.int>? inputStreamParcelFileDescriptorBytes,
  }) {
    final result = create();
    if (inputStreamParcelFileDescriptorBytes != null)
      result.inputStreamParcelFileDescriptorBytes =
          inputStreamParcelFileDescriptorBytes;
    return result;
  }

  StreamDetails._();

  factory StreamDetails.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamDetails.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamDetails',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'nearby.sharing.service.proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        _omitFieldNames ? '' : 'inputStreamParcelFileDescriptorBytes',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamDetails clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamDetails copyWith(void Function(StreamDetails) updates) =>
      super.copyWith((message) => updates(message as StreamDetails))
          as StreamDetails;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamDetails create() => StreamDetails._();
  @$core.override
  StreamDetails createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StreamDetails getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamDetails>(create);
  static StreamDetails? _defaultInstance;

  /// Serialized ParcelFileDescriptor for input stream (for the receiver).
  @$pb.TagNumber(1)
  $core.List<$core.int> get inputStreamParcelFileDescriptorBytes => $_getN(0);
  @$pb.TagNumber(1)
  set inputStreamParcelFileDescriptorBytes($core.List<$core.int> value) =>
      $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInputStreamParcelFileDescriptorBytes() => $_has(0);
  @$pb.TagNumber(1)
  void clearInputStreamParcelFileDescriptorBytes() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
