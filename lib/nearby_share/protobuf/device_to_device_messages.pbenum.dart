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

/// Type of curve
class Curve extends $pb.ProtobufEnum {
  static const Curve ED_25519 = Curve._(1, _omitEnumNames ? '' : 'ED_25519');

  static const $core.List<Curve> values = <Curve>[
    ED_25519,
  ];

  static final $core.Map<$core.int, Curve> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Curve? valueOf($core.int value) => _byValue[value];

  const Curve._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
