// This is a generated file - do not edit.
//
// Generated from proto/sharing_enums.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// We use event based logging (an event object can be constructed and logged
/// immediately when they occur). To obtain session based information (e.g.
/// durations, counting incoming introductions), we use flowId (sender/receiver)
/// in NearbyClearcutLogger (for android, or clearcut_event_logger as the
/// equivalence for Windows) for all events (may exclude settings), and
/// session_id for a pair of events (start and end of a session).
/// Next id: 81
class EventType extends $pb.ProtobufEnum {
  static const EventType UNKNOWN_EVENT_TYPE =
      EventType._(0, _omitEnumNames ? '' : 'UNKNOWN_EVENT_TYPE');

  /// When new users accept agreements (like grant permission to contacts for
  /// CONTACT_ONLY visibility) and are enrolled into Nearby Sharing. This event
  /// is used to count number of new users.
  static const EventType ACCEPT_AGREEMENTS =
      EventType._(1, _omitEnumNames ? '' : 'ACCEPT_AGREEMENTS');

  /// User enables/disables nearby sharing from setting or tile service.
  static const EventType ENABLE_NEARBY_SHARING =
      EventType._(2, _omitEnumNames ? '' : 'ENABLE_NEARBY_SHARING');

  /// User sets visibility preference from setting.
  static const EventType SET_VISIBILITY =
      EventType._(3, _omitEnumNames ? '' : 'SET_VISIBILITY');

  /// Describe attachments immediately when Nearby Sharing is opened by another
  /// app which is used to generate/attach attachments to be shared with other
  /// devices.
  static const EventType DESCRIBE_ATTACHMENTS =
      EventType._(4, _omitEnumNames ? '' : 'DESCRIBE_ATTACHMENTS');

  /// Start of a scanning phase at sender.
  static const EventType SCAN_FOR_SHARE_TARGETS_START =
      EventType._(5, _omitEnumNames ? '' : 'SCAN_FOR_SHARE_TARGETS_START');

  /// End of the scanning phase at sender.
  static const EventType SCAN_FOR_SHARE_TARGETS_END =
      EventType._(6, _omitEnumNames ? '' : 'SCAN_FOR_SHARE_TARGETS_END');

  /// Receiver advertises itself for presence (a pseudo session).
  static const EventType ADVERTISE_DEVICE_PRESENCE_START =
      EventType._(7, _omitEnumNames ? '' : 'ADVERTISE_DEVICE_PRESENCE_START');

  /// End of the advertising phase at receiver.
  static const EventType ADVERTISE_DEVICE_PRESENCE_END =
      EventType._(8, _omitEnumNames ? '' : 'ADVERTISE_DEVICE_PRESENCE_END');

  /// Sender sends a fast initialization to receiver.
  static const EventType SEND_FAST_INITIALIZATION =
      EventType._(9, _omitEnumNames ? '' : 'SEND_FAST_INITIALIZATION');

  /// Receiver receives the fast initialization.
  static const EventType RECEIVE_FAST_INITIALIZATION =
      EventType._(10, _omitEnumNames ? '' : 'RECEIVE_FAST_INITIALIZATION');

  /// Sender discovers a share target.
  static const EventType DISCOVER_SHARE_TARGET =
      EventType._(11, _omitEnumNames ? '' : 'DISCOVER_SHARE_TARGET');

  /// Sender sends introduction (before attachments being sent).
  static const EventType SEND_INTRODUCTION =
      EventType._(12, _omitEnumNames ? '' : 'SEND_INTRODUCTION');

  /// Receiver receives introduction.
  static const EventType RECEIVE_INTRODUCTION =
      EventType._(13, _omitEnumNames ? '' : 'RECEIVE_INTRODUCTION');

  /// Receiver responds to introduction (before attachments being sent).
  /// Actions: Accept, Reject, or (for some reason) Fail.
  static const EventType RESPOND_TO_INTRODUCTION =
      EventType._(14, _omitEnumNames ? '' : 'RESPOND_TO_INTRODUCTION');

  /// Start of the sending attachments phase at sender.
  static const EventType SEND_ATTACHMENTS_START =
      EventType._(15, _omitEnumNames ? '' : 'SEND_ATTACHMENTS_START');

  /// End of sending attachments phase at sender.
  static const EventType SEND_ATTACHMENTS_END =
      EventType._(16, _omitEnumNames ? '' : 'SEND_ATTACHMENTS_END');

  /// Start of the receiving attachments phase at receiver.
  static const EventType RECEIVE_ATTACHMENTS_START =
      EventType._(17, _omitEnumNames ? '' : 'RECEIVE_ATTACHMENTS_START');

  /// End of receiving attachments phase at receiver.
  static const EventType RECEIVE_ATTACHMENTS_END =
      EventType._(18, _omitEnumNames ? '' : 'RECEIVE_ATTACHMENTS_END');

  /// Sender cancels sending attachments.
  static const EventType CANCEL_SENDING_ATTACHMENTS =
      EventType._(19, _omitEnumNames ? '' : 'CANCEL_SENDING_ATTACHMENTS');

  /// Receiver cancels receiving attachments.
  static const EventType CANCEL_RECEIVING_ATTACHMENTS =
      EventType._(20, _omitEnumNames ? '' : 'CANCEL_RECEIVING_ATTACHMENTS');

  /// Receiver opens received attachments.
  static const EventType OPEN_RECEIVED_ATTACHMENTS =
      EventType._(21, _omitEnumNames ? '' : 'OPEN_RECEIVED_ATTACHMENTS');

  /// User opens the setup activity.
  @$core.Deprecated('This enum value is deprecated')
  static const EventType LAUNCH_SETUP_ACTIVITY =
      EventType._(22, _omitEnumNames ? '' : 'LAUNCH_SETUP_ACTIVITY');

  /// User adds a contact.
  static const EventType ADD_CONTACT =
      EventType._(23, _omitEnumNames ? '' : 'ADD_CONTACT');

  /// User removes a contact.
  static const EventType REMOVE_CONTACT =
      EventType._(24, _omitEnumNames ? '' : 'REMOVE_CONTACT');

  /// Local devices all Fast Share server.
  static const EventType FAST_SHARE_SERVER_RESPONSE =
      EventType._(25, _omitEnumNames ? '' : 'FAST_SHARE_SERVER_RESPONSE');

  /// The start of a sending session.
  static const EventType SEND_START =
      EventType._(26, _omitEnumNames ? '' : 'SEND_START');

  /// Receiver accepts a fast initialization.
  static const EventType ACCEPT_FAST_INITIALIZATION =
      EventType._(27, _omitEnumNames ? '' : 'ACCEPT_FAST_INITIALIZATION');

  /// Set data usage preference.
  static const EventType SET_DATA_USAGE =
      EventType._(28, _omitEnumNames ? '' : 'SET_DATA_USAGE');

  /// Receiver dismisses a fast initialization
  static const EventType DISMISS_FAST_INITIALIZATION =
      EventType._(29, _omitEnumNames ? '' : 'DISMISS_FAST_INITIALIZATION');

  /// Cancel connection.
  static const EventType CANCEL_CONNECTION =
      EventType._(30, _omitEnumNames ? '' : 'CANCEL_CONNECTION');

  /// User starts a chimera activity (e.g. ConsentsChimeraActivity,
  /// DeviceVisibilityChimeraActivity...)
  static const EventType LAUNCH_ACTIVITY =
      EventType._(31, _omitEnumNames ? '' : 'LAUNCH_ACTIVITY');

  /// Receiver dismisses a privacy notification.
  static const EventType DISMISS_PRIVACY_NOTIFICATION =
      EventType._(32, _omitEnumNames ? '' : 'DISMISS_PRIVACY_NOTIFICATION');

  /// Receiver taps a privacy notification.
  static const EventType TAP_PRIVACY_NOTIFICATION =
      EventType._(33, _omitEnumNames ? '' : 'TAP_PRIVACY_NOTIFICATION');

  /// Receiver taps a help page.
  static const EventType TAP_HELP =
      EventType._(34, _omitEnumNames ? '' : 'TAP_HELP');

  /// Receiver taps a feedback.
  static const EventType TAP_FEEDBACK =
      EventType._(35, _omitEnumNames ? '' : 'TAP_FEEDBACK');

  /// Receiver adds quick settings tile.
  static const EventType ADD_QUICK_SETTINGS_TILE =
      EventType._(36, _omitEnumNames ? '' : 'ADD_QUICK_SETTINGS_TILE');

  /// Receiver removes quick settings tile.
  static const EventType REMOVE_QUICK_SETTINGS_TILE =
      EventType._(37, _omitEnumNames ? '' : 'REMOVE_QUICK_SETTINGS_TILE');

  /// Receiver phone consent clicked.
  static const EventType LAUNCH_PHONE_CONSENT =
      EventType._(38, _omitEnumNames ? '' : 'LAUNCH_PHONE_CONSENT');

  /// Devices show a phone consent banner in Nearby Share Settings
  static const EventType DISPLAY_PHONE_CONSENT =
      EventType._(54, _omitEnumNames ? '' : 'DISPLAY_PHONE_CONSENT');

  /// Receiver taps quick settings tile.
  static const EventType TAP_QUICK_SETTINGS_TILE =
      EventType._(39, _omitEnumNames ? '' : 'TAP_QUICK_SETTINGS_TILE');

  /// Receiver Installation of APKs status.
  static const EventType INSTALL_APK =
      EventType._(40, _omitEnumNames ? '' : 'INSTALL_APK');

  /// Receiver verification of APKs status.
  static const EventType VERIFY_APK =
      EventType._(41, _omitEnumNames ? '' : 'VERIFY_APK');

  /// User starts a consent.
  static const EventType LAUNCH_CONSENT =
      EventType._(42, _omitEnumNames ? '' : 'LAUNCH_CONSENT');

  /// After receiving payloads, Nearby Share still needs to transfer the payloads
  /// to correct attachment formats and move files attachments from temporary
  /// directory to final destination.
  static const EventType PROCESS_RECEIVED_ATTACHMENTS_END =
      EventType._(43, _omitEnumNames ? '' : 'PROCESS_RECEIVED_ATTACHMENTS_END');

  /// Toggle Show Notification setting item in Nearby Share setting.
  static const EventType TOGGLE_SHOW_NOTIFICATION =
      EventType._(44, _omitEnumNames ? '' : 'TOGGLE_SHOW_NOTIFICATION');

  /// Set device name
  static const EventType SET_DEVICE_NAME =
      EventType._(45, _omitEnumNames ? '' : 'SET_DEVICE_NAME');

  /// users dropped off opt-in page.
  static const EventType DECLINE_AGREEMENTS =
      EventType._(46, _omitEnumNames ? '' : 'DECLINE_AGREEMENTS');

  /// Request setting permissions (Wifi/BT/location/airplane mode).
  static const EventType REQUEST_SETTING_PERMISSIONS =
      EventType._(47, _omitEnumNames ? '' : 'REQUEST_SETTING_PERMISSIONS');

  /// Set up a connection with the remote device.
  static const EventType ESTABLISH_CONNECTION =
      EventType._(48, _omitEnumNames ? '' : 'ESTABLISH_CONNECTION');

  /// Track device states in Nearby Share setting.
  static const EventType DEVICE_SETTINGS =
      EventType._(49, _omitEnumNames ? '' : 'DEVICE_SETTINGS');

  /// Receiver auto dismisses a fast initialization notification.
  static const EventType AUTO_DISMISS_FAST_INITIALIZATION =
      EventType._(50, _omitEnumNames ? '' : 'AUTO_DISMISS_FAST_INITIALIZATION');

  /// App Crash event.
  /// Used only for Windows App now.
  static const EventType APP_CRASH =
      EventType._(51, _omitEnumNames ? '' : 'APP_CRASH');

  /// Sender taps the Send button in quick settings
  static const EventType TAP_QUICK_SETTINGS_FILE_SHARE =
      EventType._(52, _omitEnumNames ? '' : 'TAP_QUICK_SETTINGS_FILE_SHARE');

  /// Devices show a privacy notification
  static const EventType DISPLAY_PRIVACY_NOTIFICATION =
      EventType._(53, _omitEnumNames ? '' : 'DISPLAY_PRIVACY_NOTIFICATION');

  /// Preference usage event (e.g. load/save preferences, etc).
  /// Used only for Windows App now.
  static const EventType PREFERENCES_USAGE =
      EventType._(55, _omitEnumNames ? '' : 'PREFERENCES_USAGE');

  /// Default opt in
  static const EventType DEFAULT_OPT_IN =
      EventType._(56, _omitEnumNames ? '' : 'DEFAULT_OPT_IN');

  /// The result of the setup wizard flow
  static const EventType SETUP_WIZARD =
      EventType._(57, _omitEnumNames ? '' : 'SETUP_WIZARD');

  /// Sender taps a QR code
  static const EventType TAP_QR_CODE =
      EventType._(58, _omitEnumNames ? '' : 'TAP_QR_CODE');

  /// QR code link shown
  static const EventType QR_CODE_LINK_SHOWN =
      EventType._(59, _omitEnumNames ? '' : 'QR_CODE_LINK_SHOWN');

  /// Sender failed to parse endpoint id.
  static const EventType PARSING_FAILED_ENDPOINT_ID =
      EventType._(60, _omitEnumNames ? '' : 'PARSING_FAILED_ENDPOINT_ID');

  /// The device is discovered by fast initialization
  static const EventType FAST_INIT_DISCOVER_DEVICE =
      EventType._(61, _omitEnumNames ? '' : 'FAST_INIT_DISCOVER_DEVICE');

  /// Send desktop notification.
  static const EventType SEND_DESKTOP_NOTIFICATION =
      EventType._(62, _omitEnumNames ? '' : 'SEND_DESKTOP_NOTIFICATION');

  /// User sets account preference
  static const EventType SET_ACCOUNT =
      EventType._(63, _omitEnumNames ? '' : 'SET_ACCOUNT');

  /// Decrypt certificate failure
  static const EventType DECRYPT_CERTIFICATE_FAILURE =
      EventType._(64, _omitEnumNames ? '' : 'DECRYPT_CERTIFICATE_FAILURE');

  /// Show allow permission auto access UI
  static const EventType SHOW_ALLOW_PERMISSION_AUTO_ACCESS = EventType._(
      65, _omitEnumNames ? '' : 'SHOW_ALLOW_PERMISSION_AUTO_ACCESS');

  /// UI events for transferring files with desktop applications. It includes
  /// event types such as DESKTOP_TRANSFER_EVENT_SEND_TYPE_SELECT_A_DEVICE.
  static const EventType SEND_DESKTOP_TRANSFER_EVENT =
      EventType._(66, _omitEnumNames ? '' : 'SEND_DESKTOP_TRANSFER_EVENT');

  /// Show accept button on Quick Share receive UI
  static const EventType WAITING_FOR_ACCEPT =
      EventType._(67, _omitEnumNames ? '' : 'WAITING_FOR_ACCEPT');

  /// High quality event setup
  static const EventType HIGH_QUALITY_MEDIUM_SETUP =
      EventType._(68, _omitEnumNames ? '' : 'HIGH_QUALITY_MEDIUM_SETUP');

  /// RPC call status
  static const EventType RPC_CALL_STATUS =
      EventType._(69, _omitEnumNames ? '' : 'RPC_CALL_STATUS');

  /// A QR code sharing session has started
  static const EventType START_QR_CODE_SESSION =
      EventType._(70, _omitEnumNames ? '' : 'START_QR_CODE_SESSION');

  /// A QR code URL has been opened in a web client/browser instead of in a
  /// native Quick Share app.
  static const EventType QR_CODE_OPENED_IN_WEB_CLIENT =
      EventType._(71, _omitEnumNames ? '' : 'QR_CODE_OPENED_IN_WEB_CLIENT');

  /// A HaTS survey session id has been joined with Quick Share flow id.
  static const EventType HATS_JOINT_EVENT =
      EventType._(72, _omitEnumNames ? '' : 'HATS_JOINT_EVENT');

  /// Previews received.
  static const EventType RECEIVE_PREVIEWS =
      EventType._(73, _omitEnumNames ? '' : 'RECEIVE_PREVIEWS');

  /// QR code cloud sharing events begin.
  static const EventType CLOUD_CREATE_SHARING_REQUEST =
      EventType._(74, _omitEnumNames ? '' : 'CLOUD_CREATE_SHARING_REQUEST');
  static const EventType CLOUD_REGISTER_RECEIVER =
      EventType._(75, _omitEnumNames ? '' : 'CLOUD_REGISTER_RECEIVER');
  static const EventType CLOUD_UPLOAD_START =
      EventType._(76, _omitEnumNames ? '' : 'CLOUD_UPLOAD_START');
  static const EventType CLOUD_UPLOAD_END =
      EventType._(77, _omitEnumNames ? '' : 'CLOUD_UPLOAD_END');
  static const EventType CLOUD_DOWNLOAD_START =
      EventType._(78, _omitEnumNames ? '' : 'CLOUD_DOWNLOAD_START');
  static const EventType CLOUD_DOWNLOAD_END =
      EventType._(79, _omitEnumNames ? '' : 'CLOUD_DOWNLOAD_END');

  /// Cloud sharing RPC performance result
  static const EventType CLOUD_SHARING_RPC_RESULT =
      EventType._(80, _omitEnumNames ? '' : 'CLOUD_SHARING_RPC_RESULT');

  static const $core.List<EventType> values = <EventType>[
    UNKNOWN_EVENT_TYPE,
    ACCEPT_AGREEMENTS,
    ENABLE_NEARBY_SHARING,
    SET_VISIBILITY,
    DESCRIBE_ATTACHMENTS,
    SCAN_FOR_SHARE_TARGETS_START,
    SCAN_FOR_SHARE_TARGETS_END,
    ADVERTISE_DEVICE_PRESENCE_START,
    ADVERTISE_DEVICE_PRESENCE_END,
    SEND_FAST_INITIALIZATION,
    RECEIVE_FAST_INITIALIZATION,
    DISCOVER_SHARE_TARGET,
    SEND_INTRODUCTION,
    RECEIVE_INTRODUCTION,
    RESPOND_TO_INTRODUCTION,
    SEND_ATTACHMENTS_START,
    SEND_ATTACHMENTS_END,
    RECEIVE_ATTACHMENTS_START,
    RECEIVE_ATTACHMENTS_END,
    CANCEL_SENDING_ATTACHMENTS,
    CANCEL_RECEIVING_ATTACHMENTS,
    OPEN_RECEIVED_ATTACHMENTS,
    LAUNCH_SETUP_ACTIVITY,
    ADD_CONTACT,
    REMOVE_CONTACT,
    FAST_SHARE_SERVER_RESPONSE,
    SEND_START,
    ACCEPT_FAST_INITIALIZATION,
    SET_DATA_USAGE,
    DISMISS_FAST_INITIALIZATION,
    CANCEL_CONNECTION,
    LAUNCH_ACTIVITY,
    DISMISS_PRIVACY_NOTIFICATION,
    TAP_PRIVACY_NOTIFICATION,
    TAP_HELP,
    TAP_FEEDBACK,
    ADD_QUICK_SETTINGS_TILE,
    REMOVE_QUICK_SETTINGS_TILE,
    LAUNCH_PHONE_CONSENT,
    DISPLAY_PHONE_CONSENT,
    TAP_QUICK_SETTINGS_TILE,
    INSTALL_APK,
    VERIFY_APK,
    LAUNCH_CONSENT,
    PROCESS_RECEIVED_ATTACHMENTS_END,
    TOGGLE_SHOW_NOTIFICATION,
    SET_DEVICE_NAME,
    DECLINE_AGREEMENTS,
    REQUEST_SETTING_PERMISSIONS,
    ESTABLISH_CONNECTION,
    DEVICE_SETTINGS,
    AUTO_DISMISS_FAST_INITIALIZATION,
    APP_CRASH,
    TAP_QUICK_SETTINGS_FILE_SHARE,
    DISPLAY_PRIVACY_NOTIFICATION,
    PREFERENCES_USAGE,
    DEFAULT_OPT_IN,
    SETUP_WIZARD,
    TAP_QR_CODE,
    QR_CODE_LINK_SHOWN,
    PARSING_FAILED_ENDPOINT_ID,
    FAST_INIT_DISCOVER_DEVICE,
    SEND_DESKTOP_NOTIFICATION,
    SET_ACCOUNT,
    DECRYPT_CERTIFICATE_FAILURE,
    SHOW_ALLOW_PERMISSION_AUTO_ACCESS,
    SEND_DESKTOP_TRANSFER_EVENT,
    WAITING_FOR_ACCEPT,
    HIGH_QUALITY_MEDIUM_SETUP,
    RPC_CALL_STATUS,
    START_QR_CODE_SESSION,
    QR_CODE_OPENED_IN_WEB_CLIENT,
    HATS_JOINT_EVENT,
    RECEIVE_PREVIEWS,
    CLOUD_CREATE_SHARING_REQUEST,
    CLOUD_REGISTER_RECEIVER,
    CLOUD_UPLOAD_START,
    CLOUD_UPLOAD_END,
    CLOUD_DOWNLOAD_START,
    CLOUD_DOWNLOAD_END,
    CLOUD_SHARING_RPC_RESULT,
  ];

  static final $core.List<EventType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 80);
  static EventType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const EventType._(super.value, super.name);
}

/// Event category to differentiate whether this comes from sender or receiver,
/// whether this is for communication flow, or for settings.
class EventCategory extends $pb.ProtobufEnum {
  static const EventCategory UNKNOWN_EVENT_CATEGORY =
      EventCategory._(0, _omitEnumNames ? '' : 'UNKNOWN_EVENT_CATEGORY');
  static const EventCategory SENDING_EVENT =
      EventCategory._(1, _omitEnumNames ? '' : 'SENDING_EVENT');
  static const EventCategory RECEIVING_EVENT =
      EventCategory._(2, _omitEnumNames ? '' : 'RECEIVING_EVENT');
  static const EventCategory SETTINGS_EVENT =
      EventCategory._(3, _omitEnumNames ? '' : 'SETTINGS_EVENT');
  static const EventCategory RPC_EVENT =
      EventCategory._(4, _omitEnumNames ? '' : 'RPC_EVENT');

  static const $core.List<EventCategory> values = <EventCategory>[
    UNKNOWN_EVENT_CATEGORY,
    SENDING_EVENT,
    RECEIVING_EVENT,
    SETTINGS_EVENT,
    RPC_EVENT,
  ];

  static final $core.List<EventCategory?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static EventCategory? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const EventCategory._(super.value, super.name);
}

/// Status of nearby sharing.
class NearbySharingStatus extends $pb.ProtobufEnum {
  static const NearbySharingStatus UNKNOWN_NEARBY_SHARING_STATUS =
      NearbySharingStatus._(
          0, _omitEnumNames ? '' : 'UNKNOWN_NEARBY_SHARING_STATUS');
  static const NearbySharingStatus ON =
      NearbySharingStatus._(1, _omitEnumNames ? '' : 'ON');
  static const NearbySharingStatus OFF =
      NearbySharingStatus._(2, _omitEnumNames ? '' : 'OFF');

  static const $core.List<NearbySharingStatus> values = <NearbySharingStatus>[
    UNKNOWN_NEARBY_SHARING_STATUS,
    ON,
    OFF,
  ];

  static final $core.List<NearbySharingStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static NearbySharingStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const NearbySharingStatus._(super.value, super.name);
}

class Visibility extends $pb.ProtobufEnum {
  static const Visibility UNKNOWN_VISIBILITY =
      Visibility._(0, _omitEnumNames ? '' : 'UNKNOWN_VISIBILITY');
  static const Visibility CONTACTS_ONLY =
      Visibility._(1, _omitEnumNames ? '' : 'CONTACTS_ONLY');
  static const Visibility EVERYONE =
      Visibility._(2, _omitEnumNames ? '' : 'EVERYONE');
  @$core.Deprecated('This enum value is deprecated')
  static const Visibility SELECTED_CONTACTS_ONLY =
      Visibility._(3, _omitEnumNames ? '' : 'SELECTED_CONTACTS_ONLY');
  static const Visibility HIDDEN =
      Visibility._(4, _omitEnumNames ? '' : 'HIDDEN');
  static const Visibility SELF_SHARE =
      Visibility._(5, _omitEnumNames ? '' : 'SELF_SHARE');

  static const $core.List<Visibility> values = <Visibility>[
    UNKNOWN_VISIBILITY,
    CONTACTS_ONLY,
    EVERYONE,
    SELECTED_CONTACTS_ONLY,
    HIDDEN,
    SELF_SHARE,
  ];

  static final $core.List<Visibility?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static Visibility? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Visibility._(super.value, super.name);
}

class DataUsage extends $pb.ProtobufEnum {
  static const DataUsage UNKNOWN_DATA_USAGE =
      DataUsage._(0, _omitEnumNames ? '' : 'UNKNOWN_DATA_USAGE');
  static const DataUsage ONLINE =
      DataUsage._(1, _omitEnumNames ? '' : 'ONLINE');
  static const DataUsage WIFI_ONLY =
      DataUsage._(2, _omitEnumNames ? '' : 'WIFI_ONLY');
  static const DataUsage OFFLINE =
      DataUsage._(3, _omitEnumNames ? '' : 'OFFLINE');

  static const $core.List<DataUsage> values = <DataUsage>[
    UNKNOWN_DATA_USAGE,
    ONLINE,
    WIFI_ONLY,
    OFFLINE,
  ];

  static final $core.List<DataUsage?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static DataUsage? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DataUsage._(super.value, super.name);
}

/// The status of establishing a connection. Used by ESTABLISH_CONNECTION.
class EstablishConnectionStatus extends $pb.ProtobufEnum {
  static const EstablishConnectionStatus CONNECTION_STATUS_UNKNOWN =
      EstablishConnectionStatus._(
          0, _omitEnumNames ? '' : 'CONNECTION_STATUS_UNKNOWN');
  static const EstablishConnectionStatus CONNECTION_STATUS_SUCCESS =
      EstablishConnectionStatus._(
          1, _omitEnumNames ? '' : 'CONNECTION_STATUS_SUCCESS');
  static const EstablishConnectionStatus CONNECTION_STATUS_FAILURE =
      EstablishConnectionStatus._(
          2, _omitEnumNames ? '' : 'CONNECTION_STATUS_FAILURE');
  static const EstablishConnectionStatus CONNECTION_STATUS_CANCELLATION =
      EstablishConnectionStatus._(
          3, _omitEnumNames ? '' : 'CONNECTION_STATUS_CANCELLATION');
  static const EstablishConnectionStatus
      CONNECTION_STATUS_MEDIA_UNAVAILABLE_ATTACHMENT =
      EstablishConnectionStatus._(
          4,
          _omitEnumNames
              ? ''
              : 'CONNECTION_STATUS_MEDIA_UNAVAILABLE_ATTACHMENT');
  static const EstablishConnectionStatus
      CONNECTION_STATUS_FAILED_PAIRED_KEYHANDSHAKE =
      EstablishConnectionStatus._(5,
          _omitEnumNames ? '' : 'CONNECTION_STATUS_FAILED_PAIRED_KEYHANDSHAKE');
  static const EstablishConnectionStatus
      CONNECTION_STATUS_FAILED_WRITE_INTRODUCTION = EstablishConnectionStatus._(
          6,
          _omitEnumNames ? '' : 'CONNECTION_STATUS_FAILED_WRITE_INTRODUCTION');
  static const EstablishConnectionStatus
      CONNECTION_STATUS_FAILED_NULL_CONNECTION = EstablishConnectionStatus._(
          7, _omitEnumNames ? '' : 'CONNECTION_STATUS_FAILED_NULL_CONNECTION');
  static const EstablishConnectionStatus
      CONNECTION_STATUS_FAILED_NO_TRANSFER_UPDATE_CALLBACK =
      EstablishConnectionStatus._(
          8,
          _omitEnumNames
              ? ''
              : 'CONNECTION_STATUS_FAILED_NO_TRANSFER_UPDATE_CALLBACK');
  static const EstablishConnectionStatus CONNECTION_STATUS_LOST_CONNECTIVITY =
      EstablishConnectionStatus._(
          9, _omitEnumNames ? '' : 'CONNECTION_STATUS_LOST_CONNECTIVITY');

  /// TODO: b/341782941 - : Annote this status when it's confirmed by Nearby
  /// Connections team.
  static const EstablishConnectionStatus
      CONNECTION_STATUS_INVALID_ADVERTISEMENT = EstablishConnectionStatus._(
          10, _omitEnumNames ? '' : 'CONNECTION_STATUS_INVALID_ADVERTISEMENT');

  static const $core.List<EstablishConnectionStatus> values =
      <EstablishConnectionStatus>[
    CONNECTION_STATUS_UNKNOWN,
    CONNECTION_STATUS_SUCCESS,
    CONNECTION_STATUS_FAILURE,
    CONNECTION_STATUS_CANCELLATION,
    CONNECTION_STATUS_MEDIA_UNAVAILABLE_ATTACHMENT,
    CONNECTION_STATUS_FAILED_PAIRED_KEYHANDSHAKE,
    CONNECTION_STATUS_FAILED_WRITE_INTRODUCTION,
    CONNECTION_STATUS_FAILED_NULL_CONNECTION,
    CONNECTION_STATUS_FAILED_NO_TRANSFER_UPDATE_CALLBACK,
    CONNECTION_STATUS_LOST_CONNECTIVITY,
    CONNECTION_STATUS_INVALID_ADVERTISEMENT,
  ];

  static final $core.List<EstablishConnectionStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static EstablishConnectionStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const EstablishConnectionStatus._(super.value, super.name);
}

/// The status of sending and receiving attachments. Used by SEND_ATTACHMENTS.
class AttachmentTransmissionStatus extends $pb.ProtobufEnum {
  static const AttachmentTransmissionStatus
      UNKNOWN_ATTACHMENT_TRANSMISSION_STATUS = AttachmentTransmissionStatus._(
          0, _omitEnumNames ? '' : 'UNKNOWN_ATTACHMENT_TRANSMISSION_STATUS');
  static const AttachmentTransmissionStatus
      COMPLETE_ATTACHMENT_TRANSMISSION_STATUS = AttachmentTransmissionStatus._(
          1, _omitEnumNames ? '' : 'COMPLETE_ATTACHMENT_TRANSMISSION_STATUS');
  static const AttachmentTransmissionStatus
      CANCELED_ATTACHMENT_TRANSMISSION_STATUS = AttachmentTransmissionStatus._(
          2, _omitEnumNames ? '' : 'CANCELED_ATTACHMENT_TRANSMISSION_STATUS');
  static const AttachmentTransmissionStatus
      FAILED_ATTACHMENT_TRANSMISSION_STATUS = AttachmentTransmissionStatus._(
          3, _omitEnumNames ? '' : 'FAILED_ATTACHMENT_TRANSMISSION_STATUS');
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus REJECTED_ATTACHMENT =
      AttachmentTransmissionStatus._(
          4, _omitEnumNames ? '' : 'REJECTED_ATTACHMENT');
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus TIMED_OUT_ATTACHMENT =
      AttachmentTransmissionStatus._(
          5, _omitEnumNames ? '' : 'TIMED_OUT_ATTACHMENT');
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus
      AWAITING_REMOTE_ACCEPTANCE_FAILED_ATTACHMENT =
      AttachmentTransmissionStatus._(6,
          _omitEnumNames ? '' : 'AWAITING_REMOTE_ACCEPTANCE_FAILED_ATTACHMENT');
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus NOT_ENOUGH_SPACE_ATTACHMENT =
      AttachmentTransmissionStatus._(
          7, _omitEnumNames ? '' : 'NOT_ENOUGH_SPACE_ATTACHMENT');
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus FAILED_NO_TRANSFER_UPDATE_CALLBACK =
      AttachmentTransmissionStatus._(
          8, _omitEnumNames ? '' : 'FAILED_NO_TRANSFER_UPDATE_CALLBACK');
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus MEDIA_UNAVAILABLE_ATTACHMENT =
      AttachmentTransmissionStatus._(
          9, _omitEnumNames ? '' : 'MEDIA_UNAVAILABLE_ATTACHMENT');
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus
      UNSUPPORTED_ATTACHMENT_TYPE_ATTACHMENT = AttachmentTransmissionStatus._(
          10, _omitEnumNames ? '' : 'UNSUPPORTED_ATTACHMENT_TYPE_ATTACHMENT');
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus NO_ATTACHMENT_FOUND =
      AttachmentTransmissionStatus._(
          11, _omitEnumNames ? '' : 'NO_ATTACHMENT_FOUND');
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus FAILED_NO_SHARE_TARGET_ENDPOINT =
      AttachmentTransmissionStatus._(
          12, _omitEnumNames ? '' : 'FAILED_NO_SHARE_TARGET_ENDPOINT');
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus FAILED_PAIRED_KEYHANDSHAKE =
      AttachmentTransmissionStatus._(
          13, _omitEnumNames ? '' : 'FAILED_PAIRED_KEYHANDSHAKE');
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus FAILED_NULL_CONNECTION =
      AttachmentTransmissionStatus._(
          14, _omitEnumNames ? '' : 'FAILED_NULL_CONNECTION');
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus FAILED_NO_PAYLOAD =
      AttachmentTransmissionStatus._(
          15, _omitEnumNames ? '' : 'FAILED_NO_PAYLOAD');
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus FAILED_WRITE_INTRODUCTION =
      AttachmentTransmissionStatus._(
          16, _omitEnumNames ? '' : 'FAILED_WRITE_INTRODUCTION');

  /// The remote response is either missing or has an unknown type.
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus FAILED_UNKNOWN_REMOTE_RESPONSE =
      AttachmentTransmissionStatus._(
          17, _omitEnumNames ? '' : 'FAILED_UNKNOWN_REMOTE_RESPONSE');

  /// Breakdowns of FAILED_NULL_CONNECTION (Desktop side)
  static const AttachmentTransmissionStatus
      FAILED_NULL_CONNECTION_INIT_OUTGOING = AttachmentTransmissionStatus._(
          18, _omitEnumNames ? '' : 'FAILED_NULL_CONNECTION_INIT_OUTGOING');
  static const AttachmentTransmissionStatus
      FAILED_NULL_CONNECTION_DISCONNECTED = AttachmentTransmissionStatus._(
          19, _omitEnumNames ? '' : 'FAILED_NULL_CONNECTION_DISCONNECTED');

  /// Breakdowns of FAILED_NULL_CONNECTION (android side)
  /// Connection failed due to Wifi is disconnected or Bluetooth setting is off
  /// or user turn on airplane mode.
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus
      FAILED_NULL_CONNECTION_LOST_CONNECTIVITY = AttachmentTransmissionStatus._(
          20, _omitEnumNames ? '' : 'FAILED_NULL_CONNECTION_LOST_CONNECTIVITY');

  /// Unexpected connection failure.
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus FAILED_NULL_CONNECTION_FAILURE =
      AttachmentTransmissionStatus._(
          21, _omitEnumNames ? '' : 'FAILED_NULL_CONNECTION_FAILURE');
  static const AttachmentTransmissionStatus
      REJECTED_ATTACHMENT_TRANSMISSION_STATUS = AttachmentTransmissionStatus._(
          22, _omitEnumNames ? '' : 'REJECTED_ATTACHMENT_TRANSMISSION_STATUS');
  static const AttachmentTransmissionStatus
      TIMED_OUT_ATTACHMENT_TRANSMISSION_STATUS = AttachmentTransmissionStatus._(
          23, _omitEnumNames ? '' : 'TIMED_OUT_ATTACHMENT_TRANSMISSION_STATUS');
  static const AttachmentTransmissionStatus
      NOT_ENOUGH_SPACE_ATTACHMENT_TRANSMISSION_STATUS =
      AttachmentTransmissionStatus._(
          24,
          _omitEnumNames
              ? ''
              : 'NOT_ENOUGH_SPACE_ATTACHMENT_TRANSMISSION_STATUS');
  static const AttachmentTransmissionStatus
      UNSUPPORTED_ATTACHMENT_TYPE_ATTACHMENT_TRANSMISSION_STATUS =
      AttachmentTransmissionStatus._(
          25,
          _omitEnumNames
              ? ''
              : 'UNSUPPORTED_ATTACHMENT_TYPE_ATTACHMENT_TRANSMISSION_STATUS');
  static const AttachmentTransmissionStatus
      FAILED_UNKNOWN_REMOTE_RESPONSE_TRANSMISSION_STATUS =
      AttachmentTransmissionStatus._(
          26,
          _omitEnumNames
              ? ''
              : 'FAILED_UNKNOWN_REMOTE_RESPONSE_TRANSMISSION_STATUS');

  /// Connection failed due to Wifi is disconnected or Bluetooth setting is off
  /// or user turn on airplane mode.
  @$core.Deprecated('This enum value is deprecated')
  static const AttachmentTransmissionStatus
      NO_RESPONSE_FRAME_CONNECTION_CLOSED_LOST_CONNECTIVITY_TRANSMISSION_STATUS =
      AttachmentTransmissionStatus._(
          27,
          _omitEnumNames
              ? ''
              : 'NO_RESPONSE_FRAME_CONNECTION_CLOSED_LOST_CONNECTIVITY_TRANSMISSION_STATUS');

  /// Unexpected connection failure due to no response frame.
  static const AttachmentTransmissionStatus
      NO_RESPONSE_FRAME_CONNECTION_CLOSED_TRANSMISSION_STATUS =
      AttachmentTransmissionStatus._(
          28,
          _omitEnumNames
              ? ''
              : 'NO_RESPONSE_FRAME_CONNECTION_CLOSED_TRANSMISSION_STATUS');

  /// Connection failed due to Wifi is disconnected or Bluetooth setting is off
  /// or user turn on airplane mode.
  static const AttachmentTransmissionStatus
      LOST_CONNECTIVITY_TRANSMISSION_STATUS = AttachmentTransmissionStatus._(
          29, _omitEnumNames ? '' : 'LOST_CONNECTIVITY_TRANSMISSION_STATUS');

  /// Connection failed due to the medium is not allowed.
  static const AttachmentTransmissionStatus FAILED_DISALLOWED_MEDIUM =
      AttachmentTransmissionStatus._(
          30, _omitEnumNames ? '' : 'FAILED_DISALLOWED_MEDIUM');

  static const $core.List<AttachmentTransmissionStatus> values =
      <AttachmentTransmissionStatus>[
    UNKNOWN_ATTACHMENT_TRANSMISSION_STATUS,
    COMPLETE_ATTACHMENT_TRANSMISSION_STATUS,
    CANCELED_ATTACHMENT_TRANSMISSION_STATUS,
    FAILED_ATTACHMENT_TRANSMISSION_STATUS,
    REJECTED_ATTACHMENT,
    TIMED_OUT_ATTACHMENT,
    AWAITING_REMOTE_ACCEPTANCE_FAILED_ATTACHMENT,
    NOT_ENOUGH_SPACE_ATTACHMENT,
    FAILED_NO_TRANSFER_UPDATE_CALLBACK,
    MEDIA_UNAVAILABLE_ATTACHMENT,
    UNSUPPORTED_ATTACHMENT_TYPE_ATTACHMENT,
    NO_ATTACHMENT_FOUND,
    FAILED_NO_SHARE_TARGET_ENDPOINT,
    FAILED_PAIRED_KEYHANDSHAKE,
    FAILED_NULL_CONNECTION,
    FAILED_NO_PAYLOAD,
    FAILED_WRITE_INTRODUCTION,
    FAILED_UNKNOWN_REMOTE_RESPONSE,
    FAILED_NULL_CONNECTION_INIT_OUTGOING,
    FAILED_NULL_CONNECTION_DISCONNECTED,
    FAILED_NULL_CONNECTION_LOST_CONNECTIVITY,
    FAILED_NULL_CONNECTION_FAILURE,
    REJECTED_ATTACHMENT_TRANSMISSION_STATUS,
    TIMED_OUT_ATTACHMENT_TRANSMISSION_STATUS,
    NOT_ENOUGH_SPACE_ATTACHMENT_TRANSMISSION_STATUS,
    UNSUPPORTED_ATTACHMENT_TYPE_ATTACHMENT_TRANSMISSION_STATUS,
    FAILED_UNKNOWN_REMOTE_RESPONSE_TRANSMISSION_STATUS,
    NO_RESPONSE_FRAME_CONNECTION_CLOSED_LOST_CONNECTIVITY_TRANSMISSION_STATUS,
    NO_RESPONSE_FRAME_CONNECTION_CLOSED_TRANSMISSION_STATUS,
    LOST_CONNECTIVITY_TRANSMISSION_STATUS,
    FAILED_DISALLOWED_MEDIUM,
  ];

  static final $core.List<AttachmentTransmissionStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 30);
  static AttachmentTransmissionStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AttachmentTransmissionStatus._(super.value, super.name);
}

/// Generic result status of NearbyConnections API calls.
class ConnectionLayerStatus extends $pb.ProtobufEnum {
  /// No status is available
  static const ConnectionLayerStatus CONNECTION_LAYER_STATUS_UNKNOWN =
      ConnectionLayerStatus._(
          0, _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_UNKNOWN');

  /// The operation was successful.
  static const ConnectionLayerStatus CONNECTION_LAYER_STATUS_SUCCESS =
      ConnectionLayerStatus._(
          1, _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_SUCCESS');

  /// The operation failed, without any more information.
  static const ConnectionLayerStatus CONNECTION_LAYER_STATUS_ERROR =
      ConnectionLayerStatus._(
          2, _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_ERROR');

  /// The app called an API method out of order (i.e. another method is expected
  /// to be called first).
  static const ConnectionLayerStatus
      CONNECTION_LAYER_STATUS_OUT_OF_ORDER_API_CALL = ConnectionLayerStatus._(
          3,
          _omitEnumNames
              ? ''
              : 'CONNECTION_LAYER_STATUS_OUT_OF_ORDER_API_CALL');

  /// The app already has active operations (advertising, discovering, or
  /// connected to other devices) with another Strategy. Stop these operations on
  /// the current Strategy before trying to advertise or discover with a new
  /// Strategy.
  static const ConnectionLayerStatus
      CONNECTION_LAYER_STATUS_ALREADY_HAVE_ACTIVE_STRATEGY =
      ConnectionLayerStatus._(
          4,
          _omitEnumNames
              ? ''
              : 'CONNECTION_LAYER_STATUS_ALREADY_HAVE_ACTIVE_STRATEGY');

  /// The app is already advertising; call StopAdvertising() before trying to
  /// advertise again.
  static const ConnectionLayerStatus
      CONNECTION_LAYER_STATUS_ALREADY_ADVERTISING = ConnectionLayerStatus._(5,
          _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_ALREADY_ADVERTISING');

  /// The app is already discovering; call StopDiscovery() before trying to
  /// discover again.
  static const ConnectionLayerStatus
      CONNECTION_LAYER_STATUS_ALREADY_DISCOVERING = ConnectionLayerStatus._(6,
          _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_ALREADY_DISCOVERING');

  /// NC is already listening for incoming connections from remote endpoints.
  static const ConnectionLayerStatus CONNECTION_LAYER_STATUS_ALREADY_LISTENING =
      ConnectionLayerStatus._(
          7, _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_ALREADY_LISTENING');

  /// An attempt to read from/write to a connected remote endpoint failed. If
  /// this occurs repeatedly, consider invoking DisconnectFromEndpoint().
  static const ConnectionLayerStatus
      CONNECTION_LAYER_STATUS_END_POINT_IO_ERROR = ConnectionLayerStatus._(8,
          _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_END_POINT_IO_ERROR');

  /// An attempt to interact with a remote endpoint failed because it's unknown
  /// to us -- it's either an endpoint that was never discovered, or an endpoint
  /// that never connected to us (both of which are indicative of bad input from
  /// the client app).
  static const ConnectionLayerStatus CONNECTION_LAYER_STATUS_END_POINT_UNKNOWN =
      ConnectionLayerStatus._(
          9, _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_END_POINT_UNKNOWN');

  /// The remote endpoint rejected the connection request.
  static const ConnectionLayerStatus
      CONNECTION_LAYER_STATUS_CONNECTION_REJECTED = ConnectionLayerStatus._(10,
          _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_CONNECTION_REJECTED');

  /// The app is already connected to the specified endpoint. Multiple
  /// connections to a remote endpoint cannot be maintained simultaneously.
  static const ConnectionLayerStatus
      CONNECTION_LAYER_STATUS_ALREADY_CONNECTED_TO_END_POINT =
      ConnectionLayerStatus._(
          11,
          _omitEnumNames
              ? ''
              : 'CONNECTION_LAYER_STATUS_ALREADY_CONNECTED_TO_END_POINT');

  /// The remote endpoint is not connected; messages cannot be sent to it.
  static const ConnectionLayerStatus
      CONNECTION_LAYER_STATUS_NOT_CONNECTED_TO_END_POINT =
      ConnectionLayerStatus._(
          12,
          _omitEnumNames
              ? ''
              : 'CONNECTION_LAYER_STATUS_NOT_CONNECTED_TO_END_POINT');

  /// There was an error trying to use the device's Bluetooth capabilities.
  static const ConnectionLayerStatus CONNECTION_LAYER_STATUS_BLUETOOTH_ERROR =
      ConnectionLayerStatus._(
          13, _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_BLUETOOTH_ERROR');

  /// There was an error trying to use the device's Bluetooth Low Energy
  /// capabilities.
  static const ConnectionLayerStatus CONNECTION_LAYER_STATUS_BLE_ERROR =
      ConnectionLayerStatus._(
          14, _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_BLE_ERROR');

  /// There was an error trying to use the device's Wi-Fi capabilities.
  static const ConnectionLayerStatus CONNECTION_LAYER_STATUS_WIFI_LAN_ERROR =
      ConnectionLayerStatus._(
          15, _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_WIFI_LAN_ERROR');

  /// An attempt to interact with an in-flight Payload failed because it's
  /// unknown to us.
  static const ConnectionLayerStatus CONNECTION_LAYER_STATUS_PAYLOAD_UNKNOWN =
      ConnectionLayerStatus._(
          16, _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_PAYLOAD_UNKNOWN');

  /// The connection was reset
  static const ConnectionLayerStatus CONNECTION_LAYER_STATUS_RESET =
      ConnectionLayerStatus._(
          17, _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_RESET');

  /// The connection timed out
  static const ConnectionLayerStatus CONNECTION_LAYER_STATUS_TIMEOUT =
      ConnectionLayerStatus._(
          18, _omitEnumNames ? '' : 'CONNECTION_LAYER_STATUS_TIMEOUT');

  static const $core.List<ConnectionLayerStatus> values =
      <ConnectionLayerStatus>[
    CONNECTION_LAYER_STATUS_UNKNOWN,
    CONNECTION_LAYER_STATUS_SUCCESS,
    CONNECTION_LAYER_STATUS_ERROR,
    CONNECTION_LAYER_STATUS_OUT_OF_ORDER_API_CALL,
    CONNECTION_LAYER_STATUS_ALREADY_HAVE_ACTIVE_STRATEGY,
    CONNECTION_LAYER_STATUS_ALREADY_ADVERTISING,
    CONNECTION_LAYER_STATUS_ALREADY_DISCOVERING,
    CONNECTION_LAYER_STATUS_ALREADY_LISTENING,
    CONNECTION_LAYER_STATUS_END_POINT_IO_ERROR,
    CONNECTION_LAYER_STATUS_END_POINT_UNKNOWN,
    CONNECTION_LAYER_STATUS_CONNECTION_REJECTED,
    CONNECTION_LAYER_STATUS_ALREADY_CONNECTED_TO_END_POINT,
    CONNECTION_LAYER_STATUS_NOT_CONNECTED_TO_END_POINT,
    CONNECTION_LAYER_STATUS_BLUETOOTH_ERROR,
    CONNECTION_LAYER_STATUS_BLE_ERROR,
    CONNECTION_LAYER_STATUS_WIFI_LAN_ERROR,
    CONNECTION_LAYER_STATUS_PAYLOAD_UNKNOWN,
    CONNECTION_LAYER_STATUS_RESET,
    CONNECTION_LAYER_STATUS_TIMEOUT,
  ];

  static final $core.List<ConnectionLayerStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 18);
  static ConnectionLayerStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ConnectionLayerStatus._(super.value, super.name);
}

/// The status of processing attachments after receiver received payloads
/// successfully.
class ProcessReceivedAttachmentsStatus extends $pb.ProtobufEnum {
  static const ProcessReceivedAttachmentsStatus PROCESSING_STATUS_UNKNOWN =
      ProcessReceivedAttachmentsStatus._(
          0, _omitEnumNames ? '' : 'PROCESSING_STATUS_UNKNOWN');
  static const ProcessReceivedAttachmentsStatus
      PROCESSING_STATUS_COMPLETE_PROCESSING_ATTACHMENTS =
      ProcessReceivedAttachmentsStatus._(
          1,
          _omitEnumNames
              ? ''
              : 'PROCESSING_STATUS_COMPLETE_PROCESSING_ATTACHMENTS');
  static const ProcessReceivedAttachmentsStatus
      PROCESSING_STATUS_FAILED_MOVING_FILES =
      ProcessReceivedAttachmentsStatus._(
          2, _omitEnumNames ? '' : 'PROCESSING_STATUS_FAILED_MOVING_FILES');
  static const ProcessReceivedAttachmentsStatus
      PROCESSING_STATUS_FAILED_RECEIVING_APK =
      ProcessReceivedAttachmentsStatus._(
          3, _omitEnumNames ? '' : 'PROCESSING_STATUS_FAILED_RECEIVING_APK');
  static const ProcessReceivedAttachmentsStatus
      PROCESSING_STATUS_FAILED_RECEIVING_TEXT =
      ProcessReceivedAttachmentsStatus._(
          4, _omitEnumNames ? '' : 'PROCESSING_STATUS_FAILED_RECEIVING_TEXT');
  static const ProcessReceivedAttachmentsStatus
      PROCESSING_STATUS_FAILED_RECEIVING_WIFI_CREDENTIALS =
      ProcessReceivedAttachmentsStatus._(
          5,
          _omitEnumNames
              ? ''
              : 'PROCESSING_STATUS_FAILED_RECEIVING_WIFI_CREDENTIALS');

  static const $core.List<ProcessReceivedAttachmentsStatus> values =
      <ProcessReceivedAttachmentsStatus>[
    PROCESSING_STATUS_UNKNOWN,
    PROCESSING_STATUS_COMPLETE_PROCESSING_ATTACHMENTS,
    PROCESSING_STATUS_FAILED_MOVING_FILES,
    PROCESSING_STATUS_FAILED_RECEIVING_APK,
    PROCESSING_STATUS_FAILED_RECEIVING_TEXT,
    PROCESSING_STATUS_FAILED_RECEIVING_WIFI_CREDENTIALS,
  ];

  static final $core.List<ProcessReceivedAttachmentsStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static ProcessReceivedAttachmentsStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ProcessReceivedAttachmentsStatus._(super.value, super.name);
}

/// The status of advertising and discovering sessions. Used by
/// SCAN_FOR_SHARE_TARGETS and ADVERTISE_DEVICE_PRESENCE.
class SessionStatus extends $pb.ProtobufEnum {
  static const SessionStatus UNKNOWN_SESSION_STATUS =
      SessionStatus._(0, _omitEnumNames ? '' : 'UNKNOWN_SESSION_STATUS');
  static const SessionStatus SUCCEEDED_SESSION_STATUS =
      SessionStatus._(1, _omitEnumNames ? '' : 'SUCCEEDED_SESSION_STATUS');

  /// TODO: b/341782941 - FAILED_SESSION_STATUS occurs when the status of
  /// advertising or discovering sessions is not successful. It can be
  /// due to STATUS_INTERNAL_ERROR, STATUS_INTERRUPTION, STATUS_CANCELLED.
  /// More session statuses should be logged to determine the status.
  static const SessionStatus FAILED_SESSION_STATUS =
      SessionStatus._(2, _omitEnumNames ? '' : 'FAILED_SESSION_STATUS');

  static const $core.List<SessionStatus> values = <SessionStatus>[
    UNKNOWN_SESSION_STATUS,
    SUCCEEDED_SESSION_STATUS,
    FAILED_SESSION_STATUS,
  ];

  static final $core.List<SessionStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SessionStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SessionStatus._(super.value, super.name);
}

/// User's response to introductions.
class ResponseToIntroduction extends $pb.ProtobufEnum {
  static const ResponseToIntroduction UNKNOWN_RESPONSE_TO_INTRODUCTION =
      ResponseToIntroduction._(
          0, _omitEnumNames ? '' : 'UNKNOWN_RESPONSE_TO_INTRODUCTION');
  static const ResponseToIntroduction ACCEPT_INTRODUCTION =
      ResponseToIntroduction._(1, _omitEnumNames ? '' : 'ACCEPT_INTRODUCTION');
  static const ResponseToIntroduction REJECT_INTRODUCTION =
      ResponseToIntroduction._(2, _omitEnumNames ? '' : 'REJECT_INTRODUCTION');
  static const ResponseToIntroduction FAIL_INTRODUCTION =
      ResponseToIntroduction._(3, _omitEnumNames ? '' : 'FAIL_INTRODUCTION');

  static const $core.List<ResponseToIntroduction> values =
      <ResponseToIntroduction>[
    UNKNOWN_RESPONSE_TO_INTRODUCTION,
    ACCEPT_INTRODUCTION,
    REJECT_INTRODUCTION,
    FAIL_INTRODUCTION,
  ];

  static final $core.List<ResponseToIntroduction?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ResponseToIntroduction? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ResponseToIntroduction._(super.value, super.name);
}

/// TODO(fdi): may eventually include desktop, etc.
/// The type of a remote device.
class DeviceType extends $pb.ProtobufEnum {
  static const DeviceType UNKNOWN_DEVICE_TYPE =
      DeviceType._(0, _omitEnumNames ? '' : 'UNKNOWN_DEVICE_TYPE');
  static const DeviceType PHONE =
      DeviceType._(1, _omitEnumNames ? '' : 'PHONE');
  static const DeviceType TABLET =
      DeviceType._(2, _omitEnumNames ? '' : 'TABLET');
  static const DeviceType LAPTOP =
      DeviceType._(3, _omitEnumNames ? '' : 'LAPTOP');
  static const DeviceType CAR = DeviceType._(4, _omitEnumNames ? '' : 'CAR');
  static const DeviceType FOLDABLE =
      DeviceType._(5, _omitEnumNames ? '' : 'FOLDABLE');
  static const DeviceType XR = DeviceType._(6, _omitEnumNames ? '' : 'XR');

  static const $core.List<DeviceType> values = <DeviceType>[
    UNKNOWN_DEVICE_TYPE,
    PHONE,
    TABLET,
    LAPTOP,
    CAR,
    FOLDABLE,
    XR,
  ];

  static final $core.List<DeviceType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static DeviceType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DeviceType._(super.value, super.name);
}

/// TODO(fdi): may eventually include windows, iOS, etc.
/// The OS type of a remote device.
class OSType extends $pb.ProtobufEnum {
  static const OSType UNKNOWN_OS_TYPE =
      OSType._(0, _omitEnumNames ? '' : 'UNKNOWN_OS_TYPE');
  static const OSType ANDROID = OSType._(1, _omitEnumNames ? '' : 'ANDROID');
  static const OSType CHROME_OS =
      OSType._(2, _omitEnumNames ? '' : 'CHROME_OS');
  static const OSType IOS = OSType._(3, _omitEnumNames ? '' : 'IOS');
  static const OSType WINDOWS = OSType._(4, _omitEnumNames ? '' : 'WINDOWS');
  static const OSType MACOS = OSType._(5, _omitEnumNames ? '' : 'MACOS');

  static const $core.List<OSType> values = <OSType>[
    UNKNOWN_OS_TYPE,
    ANDROID,
    CHROME_OS,
    IOS,
    WINDOWS,
    MACOS,
  ];

  static final $core.List<OSType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static OSType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const OSType._(super.value, super.name);
}

/// Relationship of remote device to sender device.
class DeviceRelationship extends $pb.ProtobufEnum {
  static const DeviceRelationship UNKNOWN_DEVICE_RELATIONSHIP =
      DeviceRelationship._(
          0, _omitEnumNames ? '' : 'UNKNOWN_DEVICE_RELATIONSHIP');

  /// The remote device belongs to the same owner as sender device.
  static const DeviceRelationship IS_SELF =
      DeviceRelationship._(1, _omitEnumNames ? '' : 'IS_SELF');

  /// The remote device is a contact of sender.
  static const DeviceRelationship IS_CONTACT =
      DeviceRelationship._(2, _omitEnumNames ? '' : 'IS_CONTACT');

  /// The remote device is a stranger.
  static const DeviceRelationship IS_STRANGER =
      DeviceRelationship._(3, _omitEnumNames ? '' : 'IS_STRANGER');

  static const $core.List<DeviceRelationship> values = <DeviceRelationship>[
    UNKNOWN_DEVICE_RELATIONSHIP,
    IS_SELF,
    IS_CONTACT,
    IS_STRANGER,
  ];

  static final $core.List<DeviceRelationship?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static DeviceRelationship? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DeviceRelationship._(super.value, super.name);
}

/// The device sources of the clearcut log.
class LogSource extends $pb.ProtobufEnum {
  static const LogSource UNSPECIFIED_SOURCE =
      LogSource._(0, _omitEnumNames ? '' : 'UNSPECIFIED_SOURCE');

  /// Represents the devices in Nearby labs.
  static const LogSource LAB_DEVICES =
      LogSource._(1, _omitEnumNames ? '' : 'LAB_DEVICES');

  /// Represents the devices tested by Nearby engs, in the long term can include
  /// any devices with newest feature flags.
  static const LogSource INTERNAL_DEVICES =
      LogSource._(2, _omitEnumNames ? '' : 'INTERNAL_DEVICES');

  /// Represents the devices testing our in-development features before they're
  /// released to the greater public.
  static const LogSource BETA_TESTER_DEVICES =
      LogSource._(3, _omitEnumNames ? '' : 'BETA_TESTER_DEVICES');

  /// Represents the OEM partners (like Samsung) that we're working with to
  /// verify functionality on their devices.
  static const LogSource OEM_DEVICES =
      LogSource._(4, _omitEnumNames ? '' : 'OEM_DEVICES');

  /// Represents the device for debugging.
  static const LogSource DEBUG_DEVICES =
      LogSource._(5, _omitEnumNames ? '' : 'DEBUG_DEVICES');

  /// Represents the device for Nearby Module Food.
  static const LogSource NEARBY_MODULE_FOOD_DEVICES =
      LogSource._(6, _omitEnumNames ? '' : 'NEARBY_MODULE_FOOD_DEVICES');

  /// Represents the device for BeTo Team Food.
  static const LogSource BETO_DOGFOOD_DEVICES =
      LogSource._(7, _omitEnumNames ? '' : 'BETO_DOGFOOD_DEVICES');

  /// Represents the device for Nearby dog Food.
  static const LogSource NEARBY_DOGFOOD_DEVICES =
      LogSource._(8, _omitEnumNames ? '' : 'NEARBY_DOGFOOD_DEVICES');

  /// Represents the device for Nearby Team Food.
  static const LogSource NEARBY_TEAMFOOD_DEVICES =
      LogSource._(9, _omitEnumNames ? '' : 'NEARBY_TEAMFOOD_DEVICES');

  static const $core.List<LogSource> values = <LogSource>[
    UNSPECIFIED_SOURCE,
    LAB_DEVICES,
    INTERNAL_DEVICES,
    BETA_TESTER_DEVICES,
    OEM_DEVICES,
    DEBUG_DEVICES,
    NEARBY_MODULE_FOOD_DEVICES,
    BETO_DOGFOOD_DEVICES,
    NEARBY_DOGFOOD_DEVICES,
    NEARBY_TEAMFOOD_DEVICES,
  ];

  static final $core.List<LogSource?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 9);
  static LogSource? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const LogSource._(super.value, super.name);
}

/// The Fast Share server action name.
class ServerActionName extends $pb.ProtobufEnum {
  static const ServerActionName UNKNOWN_SERVER_ACTION =
      ServerActionName._(0, _omitEnumNames ? '' : 'UNKNOWN_SERVER_ACTION');
  static const ServerActionName UPLOAD_CERTIFICATES =
      ServerActionName._(1, _omitEnumNames ? '' : 'UPLOAD_CERTIFICATES');
  static const ServerActionName DOWNLOAD_CERTIFICATES =
      ServerActionName._(2, _omitEnumNames ? '' : 'DOWNLOAD_CERTIFICATES');
  static const ServerActionName CHECK_REACHABILITY =
      ServerActionName._(3, _omitEnumNames ? '' : 'CHECK_REACHABILITY');
  static const ServerActionName UPLOAD_CONTACTS =
      ServerActionName._(4, _omitEnumNames ? '' : 'UPLOAD_CONTACTS');
  static const ServerActionName UPDATE_DEVICE_NAME =
      ServerActionName._(5, _omitEnumNames ? '' : 'UPDATE_DEVICE_NAME');
  static const ServerActionName UPLOAD_SENDER_CERTIFICATES =
      ServerActionName._(6, _omitEnumNames ? '' : 'UPLOAD_SENDER_CERTIFICATES');
  static const ServerActionName DOWNLOAD_SENDER_CERTIFICATES =
      ServerActionName._(
          7, _omitEnumNames ? '' : 'DOWNLOAD_SENDER_CERTIFICATES');
  static const ServerActionName UPLOAD_CONTACTS_AND_CERTIFICATES =
      ServerActionName._(
          8, _omitEnumNames ? '' : 'UPLOAD_CONTACTS_AND_CERTIFICATES');
  static const ServerActionName LIST_REACHABLE_PHONE_NUMBERS =
      ServerActionName._(
          9, _omitEnumNames ? '' : 'LIST_REACHABLE_PHONE_NUMBERS');
  static const ServerActionName LIST_MY_DEVICES =
      ServerActionName._(10, _omitEnumNames ? '' : 'LIST_MY_DEVICES');
  static const ServerActionName LIST_CONTACT_PEOPLE =
      ServerActionName._(11, _omitEnumNames ? '' : 'LIST_CONTACT_PEOPLE');

  /// used for analytics logger to record action name.
  static const ServerActionName DOWNLOAD_CERTIFICATES_INFO = ServerActionName._(
      12, _omitEnumNames ? '' : 'DOWNLOAD_CERTIFICATES_INFO');

  static const $core.List<ServerActionName> values = <ServerActionName>[
    UNKNOWN_SERVER_ACTION,
    UPLOAD_CERTIFICATES,
    DOWNLOAD_CERTIFICATES,
    CHECK_REACHABILITY,
    UPLOAD_CONTACTS,
    UPDATE_DEVICE_NAME,
    UPLOAD_SENDER_CERTIFICATES,
    DOWNLOAD_SENDER_CERTIFICATES,
    UPLOAD_CONTACTS_AND_CERTIFICATES,
    LIST_REACHABLE_PHONE_NUMBERS,
    LIST_MY_DEVICES,
    LIST_CONTACT_PEOPLE,
    DOWNLOAD_CERTIFICATES_INFO,
  ];

  static final $core.List<ServerActionName?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 12);
  static ServerActionName? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ServerActionName._(super.value, super.name);
}

/// The Fast Share server response state.
class ServerResponseState extends $pb.ProtobufEnum {
  static const ServerResponseState UNKNOWN_SERVER_RESPONSE_STATE =
      ServerResponseState._(
          0, _omitEnumNames ? '' : 'UNKNOWN_SERVER_RESPONSE_STATE');
  static const ServerResponseState SERVER_RESPONSE_SUCCESS =
      ServerResponseState._(1, _omitEnumNames ? '' : 'SERVER_RESPONSE_SUCCESS');
  static const ServerResponseState SERVER_RESPONSE_UNKNOWN_FAILURE =
      ServerResponseState._(
          2, _omitEnumNames ? '' : 'SERVER_RESPONSE_UNKNOWN_FAILURE');

  /// For StatusException.
  static const ServerResponseState SERVER_RESPONSE_STATUS_OTHER_FAILURE =
      ServerResponseState._(
          3, _omitEnumNames ? '' : 'SERVER_RESPONSE_STATUS_OTHER_FAILURE');
  static const ServerResponseState SERVER_RESPONSE_STATUS_DEADLINE_EXCEEDED =
      ServerResponseState._(
          4, _omitEnumNames ? '' : 'SERVER_RESPONSE_STATUS_DEADLINE_EXCEEDED');
  static const ServerResponseState SERVER_RESPONSE_STATUS_PERMISSION_DENIED =
      ServerResponseState._(
          5, _omitEnumNames ? '' : 'SERVER_RESPONSE_STATUS_PERMISSION_DENIED');
  static const ServerResponseState SERVER_RESPONSE_STATUS_UNAVAILABLE =
      ServerResponseState._(
          6, _omitEnumNames ? '' : 'SERVER_RESPONSE_STATUS_UNAVAILABLE');
  static const ServerResponseState SERVER_RESPONSE_STATUS_UNAUTHENTICATED =
      ServerResponseState._(
          7, _omitEnumNames ? '' : 'SERVER_RESPONSE_STATUS_UNAUTHENTICATED');
  static const ServerResponseState SERVER_RESPONSE_STATUS_INVALID_ARGUMENT =
      ServerResponseState._(
          9, _omitEnumNames ? '' : 'SERVER_RESPONSE_STATUS_INVALID_ARGUMENT');

  /// For GoogleAuthException.
  static const ServerResponseState SERVER_RESPONSE_GOOGLE_AUTH_FAILURE =
      ServerResponseState._(
          8, _omitEnumNames ? '' : 'SERVER_RESPONSE_GOOGLE_AUTH_FAILURE');

  /// For Internet connect status.
  static const ServerResponseState SERVER_RESPONSE_NOT_CONNECTED_TO_INTERNET =
      ServerResponseState._(10,
          _omitEnumNames ? '' : 'SERVER_RESPONSE_NOT_CONNECTED_TO_INTERNET');

  static const $core.List<ServerResponseState> values = <ServerResponseState>[
    UNKNOWN_SERVER_RESPONSE_STATE,
    SERVER_RESPONSE_SUCCESS,
    SERVER_RESPONSE_UNKNOWN_FAILURE,
    SERVER_RESPONSE_STATUS_OTHER_FAILURE,
    SERVER_RESPONSE_STATUS_DEADLINE_EXCEEDED,
    SERVER_RESPONSE_STATUS_PERMISSION_DENIED,
    SERVER_RESPONSE_STATUS_UNAVAILABLE,
    SERVER_RESPONSE_STATUS_UNAUTHENTICATED,
    SERVER_RESPONSE_STATUS_INVALID_ARGUMENT,
    SERVER_RESPONSE_GOOGLE_AUTH_FAILURE,
    SERVER_RESPONSE_NOT_CONNECTED_TO_INTERNET,
  ];

  static final $core.List<ServerResponseState?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static ServerResponseState? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ServerResponseState._(super.value, super.name);
}

/// The purpose of requesting the server request.
class SyncPurpose extends $pb.ProtobufEnum {
  static const SyncPurpose SYNC_PURPOSE_UNKNOWN =
      SyncPurpose._(0, _omitEnumNames ? '' : 'SYNC_PURPOSE_UNKNOWN');

  /// When NearbySharingChimeraService#sync() is called.
  static const SyncPurpose SYNC_PURPOSE_ON_DEMAND_SYNC =
      SyncPurpose._(1, _omitEnumNames ? '' : 'SYNC_PURPOSE_ON_DEMAND_SYNC');

  /// Requested by chime notification.
  static const SyncPurpose SYNC_PURPOSE_CHIME_NOTIFICATION =
      SyncPurpose._(2, _omitEnumNames ? '' : 'SYNC_PURPOSE_CHIME_NOTIFICATION');

  /// For reqular daily sync.
  static const SyncPurpose SYNC_PURPOSE_DAILY_SYNC =
      SyncPurpose._(3, _omitEnumNames ? '' : 'SYNC_PURPOSE_DAILY_SYNC');

  /// Wen a device opts into Nearby Share.
  static const SyncPurpose SYNC_PURPOSE_OPT_IN_FIRST_SYNC =
      SyncPurpose._(4, _omitEnumNames ? '' : 'SYNC_PURPOSE_OPT_IN_FIRST_SYNC');

  /// Requested when Nearby Share automatically enables a device that shares
  /// a single account that has already opted in on another device.
  static const SyncPurpose SYNC_PURPOSE_CHECK_DEFAULT_OPT_IN = SyncPurpose._(
      5, _omitEnumNames ? '' : 'SYNC_PURPOSE_CHECK_DEFAULT_OPT_IN');

  /// When a device enables Nearby Share.
  static const SyncPurpose SYNC_PURPOSE_NEARBY_SHARE_ENABLED = SyncPurpose._(
      6, _omitEnumNames ? '' : 'SYNC_PURPOSE_NEARBY_SHARE_ENABLED');

  /// When a device is in fast init advertising.
  static const SyncPurpose SYNC_PURPOSE_SYNC_AT_FAST_INIT =
      SyncPurpose._(7, _omitEnumNames ? '' : 'SYNC_PURPOSE_SYNC_AT_FAST_INIT');

  /// When device start discovery.
  static const SyncPurpose SYNC_PURPOSE_SYNC_AT_DISCOVERY =
      SyncPurpose._(8, _omitEnumNames ? '' : 'SYNC_PURPOSE_SYNC_AT_DISCOVERY');

  /// When device tries to load valid private certificate.
  static const SyncPurpose SYNC_PURPOSE_SYNC_AT_LOAD_PRIVATE_CERTIFICATE =
      SyncPurpose._(
          9,
          _omitEnumNames
              ? ''
              : 'SYNC_PURPOSE_SYNC_AT_LOAD_PRIVATE_CERTIFICATE');

  /// When device start advertiseement.
  static const SyncPurpose SYNC_PURPOSE_SYNC_AT_ADVERTISEMENT = SyncPurpose._(
      10, _omitEnumNames ? '' : 'SYNC_PURPOSE_SYNC_AT_ADVERTISEMENT');

  /// When device contacts list changes.
  static const SyncPurpose SYNC_PURPOSE_CONTACT_LIST_CHANGE = SyncPurpose._(
      11, _omitEnumNames ? '' : 'SYNC_PURPOSE_CONTACT_LIST_CHANGE');

  /// When showing the C11 banner in Neary Share setting.
  static const SyncPurpose SYNC_PURPOSE_SHOW_C11N_VIEW =
      SyncPurpose._(12, _omitEnumNames ? '' : 'SYNC_PURPOSE_SHOW_C11N_VIEW');

  /// For regular check contact reachability.
  static const SyncPurpose SYNC_PURPOSE_REGULAR_CHECK_CONTACT_REACHABILITY =
      SyncPurpose._(
          13,
          _omitEnumNames
              ? ''
              : 'SYNC_PURPOSE_REGULAR_CHECK_CONTACT_REACHABILITY');

  /// When selected contacts list changes in visibility setting.
  static const SyncPurpose SYNC_PURPOSE_VISIBILITY_SELECTED_CONTACT_CHANGE =
      SyncPurpose._(
          14,
          _omitEnumNames
              ? ''
              : 'SYNC_PURPOSE_VISIBILITY_SELECTED_CONTACT_CHANGE');

  /// When switching account.
  static const SyncPurpose SYNC_PURPOSE_ACCOUNT_CHANGE =
      SyncPurpose._(15, _omitEnumNames ? '' : 'SYNC_PURPOSE_ACCOUNT_CHANGE');

  /// When regenerate certificates
  static const SyncPurpose SYNC_PURPOSE_REGENERATE_CERTIFICATES = SyncPurpose._(
      16, _omitEnumNames ? '' : 'SYNC_PURPOSE_REGENERATE_CERTIFICATES');

  /// When Device Contacts consent changes
  static const SyncPurpose SYNC_PURPOSE_DEVICE_CONTACTS_CONSENT_CHANGE =
      SyncPurpose._(17,
          _omitEnumNames ? '' : 'SYNC_PURPOSE_DEVICE_CONTACTS_CONSENT_CHANGE');

  /// When Nearby Presence identity model exhaust the salt to use on the contact
  /// group visibility credential
  static const SyncPurpose SYNC_EXHAUST_SALT =
      SyncPurpose._(18, _omitEnumNames ? '' : 'SYNC_EXHAUST_SALT');

  /// When Nearby Presence request broadcast and discovery credential from
  /// quick share identity provider
  static const SyncPurpose SYNC_QUICKSHARE_IDENTITY_PROVIDER_QUERY =
      SyncPurpose._(
          19, _omitEnumNames ? '' : 'SYNC_QUICKSHARE_IDENTITY_PROVIDER_QUERY');

  static const $core.List<SyncPurpose> values = <SyncPurpose>[
    SYNC_PURPOSE_UNKNOWN,
    SYNC_PURPOSE_ON_DEMAND_SYNC,
    SYNC_PURPOSE_CHIME_NOTIFICATION,
    SYNC_PURPOSE_DAILY_SYNC,
    SYNC_PURPOSE_OPT_IN_FIRST_SYNC,
    SYNC_PURPOSE_CHECK_DEFAULT_OPT_IN,
    SYNC_PURPOSE_NEARBY_SHARE_ENABLED,
    SYNC_PURPOSE_SYNC_AT_FAST_INIT,
    SYNC_PURPOSE_SYNC_AT_DISCOVERY,
    SYNC_PURPOSE_SYNC_AT_LOAD_PRIVATE_CERTIFICATE,
    SYNC_PURPOSE_SYNC_AT_ADVERTISEMENT,
    SYNC_PURPOSE_CONTACT_LIST_CHANGE,
    SYNC_PURPOSE_SHOW_C11N_VIEW,
    SYNC_PURPOSE_REGULAR_CHECK_CONTACT_REACHABILITY,
    SYNC_PURPOSE_VISIBILITY_SELECTED_CONTACT_CHANGE,
    SYNC_PURPOSE_ACCOUNT_CHANGE,
    SYNC_PURPOSE_REGENERATE_CERTIFICATES,
    SYNC_PURPOSE_DEVICE_CONTACTS_CONSENT_CHANGE,
    SYNC_EXHAUST_SALT,
    SYNC_QUICKSHARE_IDENTITY_PROVIDER_QUERY,
  ];

  static final $core.List<SyncPurpose?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 19);
  static SyncPurpose? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SyncPurpose._(super.value, super.name);
}

/// The device role to trigger the server request.
class ClientRole extends $pb.ProtobufEnum {
  static const ClientRole CLIENT_ROLE_UNKNOWN =
      ClientRole._(0, _omitEnumNames ? '' : 'CLIENT_ROLE_UNKNOWN');
  static const ClientRole CLIENT_ROLE_SENDER =
      ClientRole._(1, _omitEnumNames ? '' : 'CLIENT_ROLE_SENDER');
  static const ClientRole CLIENT_ROLE_RECEIVER =
      ClientRole._(2, _omitEnumNames ? '' : 'CLIENT_ROLE_RECEIVER');

  static const $core.List<ClientRole> values = <ClientRole>[
    CLIENT_ROLE_UNKNOWN,
    CLIENT_ROLE_SENDER,
    CLIENT_ROLE_RECEIVER,
  ];

  static final $core.List<ClientRole?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ClientRole? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ClientRole._(super.value, super.name);
}

/// The type of Nearby Sharing scanning.
class ScanType extends $pb.ProtobufEnum {
  static const ScanType UNKNOWN_SCAN_TYPE =
      ScanType._(0, _omitEnumNames ? '' : 'UNKNOWN_SCAN_TYPE');
  static const ScanType FOREGROUND_SCAN =
      ScanType._(1, _omitEnumNames ? '' : 'FOREGROUND_SCAN');
  @$core.Deprecated('This enum value is deprecated')
  static const ScanType FOREGROUND_RETRY_SCAN =
      ScanType._(2, _omitEnumNames ? '' : 'FOREGROUND_RETRY_SCAN');
  static const ScanType DIRECT_SHARE_SCAN =
      ScanType._(3, _omitEnumNames ? '' : 'DIRECT_SHARE_SCAN');
  static const ScanType BACKGROUND_SCAN =
      ScanType._(4, _omitEnumNames ? '' : 'BACKGROUND_SCAN');

  static const $core.List<ScanType> values = <ScanType>[
    UNKNOWN_SCAN_TYPE,
    FOREGROUND_SCAN,
    FOREGROUND_RETRY_SCAN,
    DIRECT_SHARE_SCAN,
    BACKGROUND_SCAN,
  ];

  static final $core.List<ScanType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ScanType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ScanType._(super.value, super.name);
}

/// The type of parsing endpoint id failed type.
class ParsingFailedType extends $pb.ProtobufEnum {
  static const ParsingFailedType FAILED_UNKNOWN_TYPE =
      ParsingFailedType._(0, _omitEnumNames ? '' : 'FAILED_UNKNOWN_TYPE');

  /// NULL advertisement is returned due to sender failing to parse advertisement
  /// from endpointInfo byte stream from receiver advertisement.
  static const ParsingFailedType FAILED_PARSE_ADVERTISEMENT =
      ParsingFailedType._(
          1, _omitEnumNames ? '' : 'FAILED_PARSE_ADVERTISEMENT');

  /// NULL shareTarget is returned due to sender failing to create shareTarget
  /// from a valid parsed advertisement stemming from issues in certificates, QR
  /// code tokens or device names.
  static const ParsingFailedType FAILED_CONVERT_SHARE_TARGET =
      ParsingFailedType._(
          2, _omitEnumNames ? '' : 'FAILED_CONVERT_SHARE_TARGET');

  static const $core.List<ParsingFailedType> values = <ParsingFailedType>[
    FAILED_UNKNOWN_TYPE,
    FAILED_PARSE_ADVERTISEMENT,
    FAILED_CONVERT_SHARE_TARGET,
  ];

  static final $core.List<ParsingFailedType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ParsingFailedType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ParsingFailedType._(super.value, super.name);
}

/// The Nearby Sharing advertising mode.
class AdvertisingMode extends $pb.ProtobufEnum {
  static const AdvertisingMode UNKNOWN_ADVERTISING_MODE =
      AdvertisingMode._(0, _omitEnumNames ? '' : 'UNKNOWN_ADVERTISING_MODE');
  static const AdvertisingMode SCREEN_OFF_ADVERTISING_MODE =
      AdvertisingMode._(1, _omitEnumNames ? '' : 'SCREEN_OFF_ADVERTISING_MODE');
  static const AdvertisingMode BACKGROUND_ADVERTISING_MODE =
      AdvertisingMode._(2, _omitEnumNames ? '' : 'BACKGROUND_ADVERTISING_MODE');
  static const AdvertisingMode MIDGROUND_ADVERTISING_MODE =
      AdvertisingMode._(3, _omitEnumNames ? '' : 'MIDGROUND_ADVERTISING_MODE');
  static const AdvertisingMode FOREGROUND_ADVERTISING_MODE =
      AdvertisingMode._(4, _omitEnumNames ? '' : 'FOREGROUND_ADVERTISING_MODE');
  static const AdvertisingMode SUSPENDED_ADVERTISING_MODE =
      AdvertisingMode._(5, _omitEnumNames ? '' : 'SUSPENDED_ADVERTISING_MODE');

  static const $core.List<AdvertisingMode> values = <AdvertisingMode>[
    UNKNOWN_ADVERTISING_MODE,
    SCREEN_OFF_ADVERTISING_MODE,
    BACKGROUND_ADVERTISING_MODE,
    MIDGROUND_ADVERTISING_MODE,
    FOREGROUND_ADVERTISING_MODE,
    SUSPENDED_ADVERTISING_MODE,
  ];

  static final $core.List<AdvertisingMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static AdvertisingMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AdvertisingMode._(super.value, super.name);
}

/// The Nearby Sharing discovery mode.
class DiscoveryMode extends $pb.ProtobufEnum {
  static const DiscoveryMode UNKNOWN_DISCOVERY_MODE =
      DiscoveryMode._(0, _omitEnumNames ? '' : 'UNKNOWN_DISCOVERY_MODE');
  static const DiscoveryMode SCREEN_OFF_DISCOVERY_MODE =
      DiscoveryMode._(1, _omitEnumNames ? '' : 'SCREEN_OFF_DISCOVERY_MODE');
  static const DiscoveryMode BACKGROUND_DISCOVERY_MODE =
      DiscoveryMode._(2, _omitEnumNames ? '' : 'BACKGROUND_DISCOVERY_MODE');
  static const DiscoveryMode MIDGROUND_DISCOVERY_MODE =
      DiscoveryMode._(3, _omitEnumNames ? '' : 'MIDGROUND_DISCOVERY_MODE');
  static const DiscoveryMode FOREGROUND_DISCOVERY_MODE =
      DiscoveryMode._(4, _omitEnumNames ? '' : 'FOREGROUND_DISCOVERY_MODE');
  static const DiscoveryMode SUSPENDED_DISCOVERY_MODE =
      DiscoveryMode._(5, _omitEnumNames ? '' : 'SUSPENDED_DISCOVERY_MODE');

  static const $core.List<DiscoveryMode> values = <DiscoveryMode>[
    UNKNOWN_DISCOVERY_MODE,
    SCREEN_OFF_DISCOVERY_MODE,
    BACKGROUND_DISCOVERY_MODE,
    MIDGROUND_DISCOVERY_MODE,
    FOREGROUND_DISCOVERY_MODE,
    SUSPENDED_DISCOVERY_MODE,
  ];

  static final $core.List<DiscoveryMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static DiscoveryMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DiscoveryMode._(super.value, super.name);
}

/// The class name of chimera activity.
class ActivityName extends $pb.ProtobufEnum {
  static const ActivityName UNKNOWN_ACTIVITY =
      ActivityName._(0, _omitEnumNames ? '' : 'UNKNOWN_ACTIVITY');
  static const ActivityName SHARE_SHEET_ACTIVITY =
      ActivityName._(1, _omitEnumNames ? '' : 'SHARE_SHEET_ACTIVITY');
  static const ActivityName SETTINGS_ACTIVITY =
      ActivityName._(2, _omitEnumNames ? '' : 'SETTINGS_ACTIVITY');
  static const ActivityName RECEIVE_SURFACE_ACTIVITY =
      ActivityName._(3, _omitEnumNames ? '' : 'RECEIVE_SURFACE_ACTIVITY');
  static const ActivityName SETUP_ACTIVITY =
      ActivityName._(4, _omitEnumNames ? '' : 'SETUP_ACTIVITY');
  static const ActivityName DEVICE_VISIBILITY_ACTIVITY =
      ActivityName._(5, _omitEnumNames ? '' : 'DEVICE_VISIBILITY_ACTIVITY');
  static const ActivityName CONSENTS_ACTIVITY =
      ActivityName._(6, _omitEnumNames ? '' : 'CONSENTS_ACTIVITY');
  static const ActivityName SET_DEVICE_NAME_DIALOG =
      ActivityName._(7, _omitEnumNames ? '' : 'SET_DEVICE_NAME_DIALOG');
  static const ActivityName SET_DATA_USAGE_DIALOG =
      ActivityName._(8, _omitEnumNames ? '' : 'SET_DATA_USAGE_DIALOG');
  static const ActivityName QUICK_SETTINGS_ACTIVITY =
      ActivityName._(9, _omitEnumNames ? '' : 'QUICK_SETTINGS_ACTIVITY');
  static const ActivityName REMOTE_COPY_SHARE_SHEET_ACTIVITY = ActivityName._(
      10, _omitEnumNames ? '' : 'REMOTE_COPY_SHARE_SHEET_ACTIVITY');
  static const ActivityName SETUP_WIZARD_ACTIVITY =
      ActivityName._(11, _omitEnumNames ? '' : 'SETUP_WIZARD_ACTIVITY');
  static const ActivityName SETTINGS_REVIEW_ACTIVITY =
      ActivityName._(12, _omitEnumNames ? '' : 'SETTINGS_REVIEW_ACTIVITY');

  static const $core.List<ActivityName> values = <ActivityName>[
    UNKNOWN_ACTIVITY,
    SHARE_SHEET_ACTIVITY,
    SETTINGS_ACTIVITY,
    RECEIVE_SURFACE_ACTIVITY,
    SETUP_ACTIVITY,
    DEVICE_VISIBILITY_ACTIVITY,
    CONSENTS_ACTIVITY,
    SET_DEVICE_NAME_DIALOG,
    SET_DATA_USAGE_DIALOG,
    QUICK_SETTINGS_ACTIVITY,
    REMOTE_COPY_SHARE_SHEET_ACTIVITY,
    SETUP_WIZARD_ACTIVITY,
    SETTINGS_REVIEW_ACTIVITY,
  ];

  static final $core.List<ActivityName?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 12);
  static ActivityName? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ActivityName._(super.value, super.name);
}

/// The type of consent page user launches.
class ConsentType extends $pb.ProtobufEnum {
  static const ConsentType CONSENT_TYPE_UNKNOWN =
      ConsentType._(0, _omitEnumNames ? '' : 'CONSENT_TYPE_UNKNOWN');

  /// launch Constellation consent page.
  static const ConsentType CONSENT_TYPE_C11N =
      ConsentType._(1, _omitEnumNames ? '' : 'CONSENT_TYPE_C11N');

  /// launch device contact consent page.
  static const ConsentType CONSENT_TYPE_DEVICE_CONTACT =
      ConsentType._(2, _omitEnumNames ? '' : 'CONSENT_TYPE_DEVICE_CONTACT');

  static const $core.List<ConsentType> values = <ConsentType>[
    CONSENT_TYPE_UNKNOWN,
    CONSENT_TYPE_C11N,
    CONSENT_TYPE_DEVICE_CONTACT,
  ];

  static final $core.List<ConsentType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ConsentType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ConsentType._(super.value, super.name);
}

class ConsentAcceptanceStatus extends $pb.ProtobufEnum {
  static const ConsentAcceptanceStatus CONSENT_UNKNOWN_ACCEPT_STATUS =
      ConsentAcceptanceStatus._(
          0, _omitEnumNames ? '' : 'CONSENT_UNKNOWN_ACCEPT_STATUS');
  static const ConsentAcceptanceStatus CONSENT_ACCEPTED =
      ConsentAcceptanceStatus._(1, _omitEnumNames ? '' : 'CONSENT_ACCEPTED');
  static const ConsentAcceptanceStatus CONSENT_DECLINED =
      ConsentAcceptanceStatus._(2, _omitEnumNames ? '' : 'CONSENT_DECLINED');

  /// unable to enable consent.
  static const ConsentAcceptanceStatus CONSENT_UNABLE_TO_ENABLE =
      ConsentAcceptanceStatus._(
          3, _omitEnumNames ? '' : 'CONSENT_UNABLE_TO_ENABLE');

  static const $core.List<ConsentAcceptanceStatus> values =
      <ConsentAcceptanceStatus>[
    CONSENT_UNKNOWN_ACCEPT_STATUS,
    CONSENT_ACCEPTED,
    CONSENT_DECLINED,
    CONSENT_UNABLE_TO_ENABLE,
  ];

  static final $core.List<ConsentAcceptanceStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ConsentAcceptanceStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ConsentAcceptanceStatus._(super.value, super.name);
}

class ApkSource extends $pb.ProtobufEnum {
  static const ApkSource UNKNOWN_APK_SOURCE =
      ApkSource._(0, _omitEnumNames ? '' : 'UNKNOWN_APK_SOURCE');
  static const ApkSource APK_FROM_SD_CARD =
      ApkSource._(1, _omitEnumNames ? '' : 'APK_FROM_SD_CARD');
  static const ApkSource INSTALLED_APP =
      ApkSource._(2, _omitEnumNames ? '' : 'INSTALLED_APP');

  static const $core.List<ApkSource> values = <ApkSource>[
    UNKNOWN_APK_SOURCE,
    APK_FROM_SD_CARD,
    INSTALLED_APP,
  ];

  static final $core.List<ApkSource?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ApkSource? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ApkSource._(super.value, super.name);
}

/// The Installation status of APK.
class InstallAPKStatus extends $pb.ProtobufEnum {
  static const InstallAPKStatus UNKNOWN_INSTALL_APK_STATUS =
      InstallAPKStatus._(0, _omitEnumNames ? '' : 'UNKNOWN_INSTALL_APK_STATUS');
  static const InstallAPKStatus FAIL_INSTALLATION =
      InstallAPKStatus._(1, _omitEnumNames ? '' : 'FAIL_INSTALLATION');
  static const InstallAPKStatus SUCCESS_INSTALLATION =
      InstallAPKStatus._(2, _omitEnumNames ? '' : 'SUCCESS_INSTALLATION');

  static const $core.List<InstallAPKStatus> values = <InstallAPKStatus>[
    UNKNOWN_INSTALL_APK_STATUS,
    FAIL_INSTALLATION,
    SUCCESS_INSTALLATION,
  ];

  static final $core.List<InstallAPKStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static InstallAPKStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const InstallAPKStatus._(super.value, super.name);
}

/// The verification status of APK.
class VerifyAPKStatus extends $pb.ProtobufEnum {
  static const VerifyAPKStatus UNKNOWN_VERIFY_APK_STATUS =
      VerifyAPKStatus._(0, _omitEnumNames ? '' : 'UNKNOWN_VERIFY_APK_STATUS');
  static const VerifyAPKStatus NOT_INSTALLABLE =
      VerifyAPKStatus._(1, _omitEnumNames ? '' : 'NOT_INSTALLABLE');
  static const VerifyAPKStatus INSTALLABLE =
      VerifyAPKStatus._(2, _omitEnumNames ? '' : 'INSTALLABLE');
  static const VerifyAPKStatus ALREADY_INSTALLED =
      VerifyAPKStatus._(3, _omitEnumNames ? '' : 'ALREADY_INSTALLED');

  static const $core.List<VerifyAPKStatus> values = <VerifyAPKStatus>[
    UNKNOWN_VERIFY_APK_STATUS,
    NOT_INSTALLABLE,
    INSTALLABLE,
    ALREADY_INSTALLED,
  ];

  static final $core.List<VerifyAPKStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static VerifyAPKStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const VerifyAPKStatus._(super.value, super.name);
}

class ShowNotificationStatus extends $pb.ProtobufEnum {
  static const ShowNotificationStatus UNKNOWN_SHOW_NOTIFICATION_STATUS =
      ShowNotificationStatus._(
          0, _omitEnumNames ? '' : 'UNKNOWN_SHOW_NOTIFICATION_STATUS');
  static const ShowNotificationStatus SHOW =
      ShowNotificationStatus._(1, _omitEnumNames ? '' : 'SHOW');
  static const ShowNotificationStatus NOT_SHOW =
      ShowNotificationStatus._(2, _omitEnumNames ? '' : 'NOT_SHOW');

  static const $core.List<ShowNotificationStatus> values =
      <ShowNotificationStatus>[
    UNKNOWN_SHOW_NOTIFICATION_STATUS,
    SHOW,
    NOT_SHOW,
  ];

  static final $core.List<ShowNotificationStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ShowNotificationStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ShowNotificationStatus._(super.value, super.name);
}

class PermissionRequestResult extends $pb.ProtobufEnum {
  static const PermissionRequestResult PERMISSION_UNKNOWN_REQUEST_RESULT =
      PermissionRequestResult._(
          0, _omitEnumNames ? '' : 'PERMISSION_UNKNOWN_REQUEST_RESULT');
  static const PermissionRequestResult PERMISSION_GRANTED =
      PermissionRequestResult._(1, _omitEnumNames ? '' : 'PERMISSION_GRANTED');
  static const PermissionRequestResult PERMISSION_REJECTED =
      PermissionRequestResult._(2, _omitEnumNames ? '' : 'PERMISSION_REJECTED');
  static const PermissionRequestResult PERMISSION_UNABLE_TO_GRANT =
      PermissionRequestResult._(
          3, _omitEnumNames ? '' : 'PERMISSION_UNABLE_TO_GRANT');

  static const $core.List<PermissionRequestResult> values =
      <PermissionRequestResult>[
    PERMISSION_UNKNOWN_REQUEST_RESULT,
    PERMISSION_GRANTED,
    PERMISSION_REJECTED,
    PERMISSION_UNABLE_TO_GRANT,
  ];

  static final $core.List<PermissionRequestResult?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static PermissionRequestResult? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PermissionRequestResult._(super.value, super.name);
}

class PermissionRequestType extends $pb.ProtobufEnum {
  static const PermissionRequestType PERMISSION_UNKNOWN_TYPE =
      PermissionRequestType._(
          0, _omitEnumNames ? '' : 'PERMISSION_UNKNOWN_TYPE');
  static const PermissionRequestType PERMISSION_AIRPLANE_MODE_OFF =
      PermissionRequestType._(
          1, _omitEnumNames ? '' : 'PERMISSION_AIRPLANE_MODE_OFF');
  static const PermissionRequestType PERMISSION_WIFI =
      PermissionRequestType._(2, _omitEnumNames ? '' : 'PERMISSION_WIFI');
  static const PermissionRequestType PERMISSION_BLUETOOTH =
      PermissionRequestType._(3, _omitEnumNames ? '' : 'PERMISSION_BLUETOOTH');
  static const PermissionRequestType PERMISSION_LOCATION =
      PermissionRequestType._(4, _omitEnumNames ? '' : 'PERMISSION_LOCATION');
  static const PermissionRequestType PERMISSION_WIFI_HOTSPOT =
      PermissionRequestType._(
          5, _omitEnumNames ? '' : 'PERMISSION_WIFI_HOTSPOT');

  static const $core.List<PermissionRequestType> values =
      <PermissionRequestType>[
    PERMISSION_UNKNOWN_TYPE,
    PERMISSION_AIRPLANE_MODE_OFF,
    PERMISSION_WIFI,
    PERMISSION_BLUETOOTH,
    PERMISSION_LOCATION,
    PERMISSION_WIFI_HOTSPOT,
  ];

  static final $core.List<PermissionRequestType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static PermissionRequestType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PermissionRequestType._(super.value, super.name);
}

class SharingUseCase extends $pb.ProtobufEnum {
  static const SharingUseCase USE_CASE_UNKNOWN =
      SharingUseCase._(0, _omitEnumNames ? '' : 'USE_CASE_UNKNOWN');
  static const SharingUseCase USE_CASE_NEARBY_SHARE =
      SharingUseCase._(1, _omitEnumNames ? '' : 'USE_CASE_NEARBY_SHARE');
  static const SharingUseCase USE_CASE_REMOTE_COPY_PASTE =
      SharingUseCase._(2, _omitEnumNames ? '' : 'USE_CASE_REMOTE_COPY_PASTE');
  static const SharingUseCase USE_CASE_WIFI_CREDENTIAL =
      SharingUseCase._(3, _omitEnumNames ? '' : 'USE_CASE_WIFI_CREDENTIAL');
  static const SharingUseCase USE_CASE_APP_SHARE =
      SharingUseCase._(4, _omitEnumNames ? '' : 'USE_CASE_APP_SHARE');
  static const SharingUseCase USE_CASE_QUICK_SETTING_FILE_SHARE =
      SharingUseCase._(
          5, _omitEnumNames ? '' : 'USE_CASE_QUICK_SETTING_FILE_SHARE');
  static const SharingUseCase USE_CASE_SETUP_WIZARD =
      SharingUseCase._(6, _omitEnumNames ? '' : 'USE_CASE_SETUP_WIZARD');

  /// Deprecated. QR code is an addition to existing use cases rather than being
  /// a separate use case.
  @$core.Deprecated('This enum value is deprecated')
  static const SharingUseCase USE_CASE_NEARBY_SHARE_WITH_QR_CODE =
      SharingUseCase._(
          7, _omitEnumNames ? '' : 'USE_CASE_NEARBY_SHARE_WITH_QR_CODE');

  /// The user was redirected from Bluetooth sharing UI to Nearby Share
  static const SharingUseCase USE_CASE_REDIRECTED_FROM_BLUETOOTH_SHARE =
      SharingUseCase._(
          8, _omitEnumNames ? '' : 'USE_CASE_REDIRECTED_FROM_BLUETOOTH_SHARE');

  static const $core.List<SharingUseCase> values = <SharingUseCase>[
    USE_CASE_UNKNOWN,
    USE_CASE_NEARBY_SHARE,
    USE_CASE_REMOTE_COPY_PASTE,
    USE_CASE_WIFI_CREDENTIAL,
    USE_CASE_APP_SHARE,
    USE_CASE_QUICK_SETTING_FILE_SHARE,
    USE_CASE_SETUP_WIZARD,
    USE_CASE_NEARBY_SHARE_WITH_QR_CODE,
    USE_CASE_REDIRECTED_FROM_BLUETOOTH_SHARE,
  ];

  static final $core.List<SharingUseCase?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 8);
  static SharingUseCase? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SharingUseCase._(super.value, super.name);
}

/// Used only for Windows App now.
class AppCrashReason extends $pb.ProtobufEnum {
  static const AppCrashReason APP_CRASH_REASON_UNKNOWN =
      AppCrashReason._(0, _omitEnumNames ? '' : 'APP_CRASH_REASON_UNKNOWN');

  static const $core.List<AppCrashReason> values = <AppCrashReason>[
    APP_CRASH_REASON_UNKNOWN,
  ];

  static final $core.List<AppCrashReason?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 0);
  static AppCrashReason? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AppCrashReason._(super.value, super.name);
}

/// Thes source where the attachemnt comes from. It can be an action, app name,
/// etc. The first 6 source types are being used as FileSenderType in Nearby
/// Share Windows app.
class AttachmentSourceType extends $pb.ProtobufEnum {
  static const AttachmentSourceType ATTACHMENT_SOURCE_UNKNOWN =
      AttachmentSourceType._(
          0, _omitEnumNames ? '' : 'ATTACHMENT_SOURCE_UNKNOWN');
  static const AttachmentSourceType ATTACHMENT_SOURCE_CONTEXT_MENU =
      AttachmentSourceType._(
          1, _omitEnumNames ? '' : 'ATTACHMENT_SOURCE_CONTEXT_MENU');
  static const AttachmentSourceType ATTACHMENT_SOURCE_DRAG_AND_DROP =
      AttachmentSourceType._(
          2, _omitEnumNames ? '' : 'ATTACHMENT_SOURCE_DRAG_AND_DROP');
  static const AttachmentSourceType ATTACHMENT_SOURCE_SELECT_FILES_BUTTON =
      AttachmentSourceType._(
          3, _omitEnumNames ? '' : 'ATTACHMENT_SOURCE_SELECT_FILES_BUTTON');
  static const AttachmentSourceType ATTACHMENT_SOURCE_PASTE =
      AttachmentSourceType._(
          4, _omitEnumNames ? '' : 'ATTACHMENT_SOURCE_PASTE');
  static const AttachmentSourceType ATTACHMENT_SOURCE_SELECT_FOLDERS_BUTTON =
      AttachmentSourceType._(
          5, _omitEnumNames ? '' : 'ATTACHMENT_SOURCE_SELECT_FOLDERS_BUTTON');
  static const AttachmentSourceType ATTACHMENT_SOURCE_SHARE_ACTIVATION =
      AttachmentSourceType._(
          6, _omitEnumNames ? '' : 'ATTACHMENT_SOURCE_SHARE_ACTIVATION');

  static const $core.List<AttachmentSourceType> values = <AttachmentSourceType>[
    ATTACHMENT_SOURCE_UNKNOWN,
    ATTACHMENT_SOURCE_CONTEXT_MENU,
    ATTACHMENT_SOURCE_DRAG_AND_DROP,
    ATTACHMENT_SOURCE_SELECT_FILES_BUTTON,
    ATTACHMENT_SOURCE_PASTE,
    ATTACHMENT_SOURCE_SELECT_FOLDERS_BUTTON,
    ATTACHMENT_SOURCE_SHARE_ACTIVATION,
  ];

  static final $core.List<AttachmentSourceType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static AttachmentSourceType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AttachmentSourceType._(super.value, super.name);
}

/// The action to interact with preferences.
/// Used only for Windows App now.
class PreferencesAction extends $pb.ProtobufEnum {
  static const PreferencesAction PREFERENCES_ACTION_UNKNOWN =
      PreferencesAction._(
          0, _omitEnumNames ? '' : 'PREFERENCES_ACTION_UNKNOWN');
  static const PreferencesAction PREFERENCES_ACTION_NO_ACTION =
      PreferencesAction._(
          1, _omitEnumNames ? '' : 'PREFERENCES_ACTION_NO_ACTION');

  /// Primary actions/functions towards preferences
  static const PreferencesAction PREFERENCES_ACTION_LOAD_PREFERENCES =
      PreferencesAction._(
          2, _omitEnumNames ? '' : 'PREFERENCES_ACTION_LOAD_PREFERENCES');
  static const PreferencesAction PREFERENCES_ACTION_SAVE_PREFERENCESS =
      PreferencesAction._(
          3, _omitEnumNames ? '' : 'PREFERENCES_ACTION_SAVE_PREFERENCESS');
  static const PreferencesAction PREFERENCES_ACTION_ATTEMPT_LOAD =
      PreferencesAction._(
          4, _omitEnumNames ? '' : 'PREFERENCES_ACTION_ATTEMPT_LOAD');
  static const PreferencesAction PREFERENCES_ACTION_RESTORE_FROM_BACKUP =
      PreferencesAction._(
          5, _omitEnumNames ? '' : 'PREFERENCES_ACTION_RESTORE_FROM_BACKUP');

  /// Other actions within the 4 actions above
  static const PreferencesAction PREFERENCES_ACTION_CREATE_PREFERENCES_PATH =
      PreferencesAction._(6,
          _omitEnumNames ? '' : 'PREFERENCES_ACTION_CREATE_PREFERENCES_PATH');
  static const PreferencesAction
      PREFERENCES_ACTION_MAKE_PREFERENCES_BACKUP_FILE = PreferencesAction._(
          7,
          _omitEnumNames
              ? ''
              : 'PREFERENCES_ACTION_MAKE_PREFERENCES_BACKUP_FILE');
  static const PreferencesAction
      PREFERENCES_ACTION_CHECK_IF_PREFERENCES_PATH_EXISTS = PreferencesAction._(
          8,
          _omitEnumNames
              ? ''
              : 'PREFERENCES_ACTION_CHECK_IF_PREFERENCES_PATH_EXISTS');
  static const PreferencesAction
      PREFERENCES_ACTION_CHECK_IF_PREFERENCES_INPUT_STREAM_STATUS =
      PreferencesAction._(
          9,
          _omitEnumNames
              ? ''
              : 'PREFERENCES_ACTION_CHECK_IF_PREFERENCES_INPUT_STREAM_STATUS');
  static const PreferencesAction
      PREFERENCES_ACTION_CHECK_IF_PREFERENCES_FILE_IS_CORRUPTED =
      PreferencesAction._(
          10,
          _omitEnumNames
              ? ''
              : 'PREFERENCES_ACTION_CHECK_IF_PREFERENCES_FILE_IS_CORRUPTED');
  static const PreferencesAction
      PREFERENCES_ACTION_CHECK_IF_PREFERENCES_BACKUP_FILE_EXISTS =
      PreferencesAction._(
          11,
          _omitEnumNames
              ? ''
              : 'PREFERENCES_ACTION_CHECK_IF_PREFERENCES_BACKUP_FILE_EXISTS');

  static const $core.List<PreferencesAction> values = <PreferencesAction>[
    PREFERENCES_ACTION_UNKNOWN,
    PREFERENCES_ACTION_NO_ACTION,
    PREFERENCES_ACTION_LOAD_PREFERENCES,
    PREFERENCES_ACTION_SAVE_PREFERENCESS,
    PREFERENCES_ACTION_ATTEMPT_LOAD,
    PREFERENCES_ACTION_RESTORE_FROM_BACKUP,
    PREFERENCES_ACTION_CREATE_PREFERENCES_PATH,
    PREFERENCES_ACTION_MAKE_PREFERENCES_BACKUP_FILE,
    PREFERENCES_ACTION_CHECK_IF_PREFERENCES_PATH_EXISTS,
    PREFERENCES_ACTION_CHECK_IF_PREFERENCES_INPUT_STREAM_STATUS,
    PREFERENCES_ACTION_CHECK_IF_PREFERENCES_FILE_IS_CORRUPTED,
    PREFERENCES_ACTION_CHECK_IF_PREFERENCES_BACKUP_FILE_EXISTS,
  ];

  static final $core.List<PreferencesAction?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 11);
  static PreferencesAction? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PreferencesAction._(super.value, super.name);
}

/// The status of the action to interact with preferences.
/// Used only for Windows App now.
class PreferencesActionStatus extends $pb.ProtobufEnum {
  static const PreferencesActionStatus PREFERENCES_ACTION_STATUS_UNKNOWN =
      PreferencesActionStatus._(
          0, _omitEnumNames ? '' : 'PREFERENCES_ACTION_STATUS_UNKNOWN');
  static const PreferencesActionStatus PREFERENCES_ACTION_STATUS_SUCCESS =
      PreferencesActionStatus._(
          1, _omitEnumNames ? '' : 'PREFERENCES_ACTION_STATUS_SUCCESS');
  static const PreferencesActionStatus PREFERENCES_ACTION_STATUS_FAIL =
      PreferencesActionStatus._(
          2, _omitEnumNames ? '' : 'PREFERENCES_ACTION_STATUS_FAIL');

  static const $core.List<PreferencesActionStatus> values =
      <PreferencesActionStatus>[
    PREFERENCES_ACTION_STATUS_UNKNOWN,
    PREFERENCES_ACTION_STATUS_SUCCESS,
    PREFERENCES_ACTION_STATUS_FAIL,
  ];

  static final $core.List<PreferencesActionStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static PreferencesActionStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PreferencesActionStatus._(super.value, super.name);
}

/// * The distance of the found nearby fast init advertisement.
class FastInitState extends $pb.ProtobufEnum {
  static const FastInitState FAST_INIT_UNKNOWN_STATE =
      FastInitState._(0, _omitEnumNames ? '' : 'FAST_INIT_UNKNOWN_STATE');

  /// A device was found in close proximity.
  /// distance < fast_init_distance_close_centimeters(50 cm)
  static const FastInitState FAST_INIT_CLOSE_STATE =
      FastInitState._(1, _omitEnumNames ? '' : 'FAST_INIT_CLOSE_STATE');

  /// A device was found in far proximity.
  /// distance < fast_init_distance_close_centimeters(10 m)
  static const FastInitState FAST_INIT_FAR_STATE =
      FastInitState._(2, _omitEnumNames ? '' : 'FAST_INIT_FAR_STATE');

  /// No devices have been found nearby. The default state.
  static const FastInitState FAST_INIT_LOST_STATE =
      FastInitState._(3, _omitEnumNames ? '' : 'FAST_INIT_LOST_STATE');

  static const $core.List<FastInitState> values = <FastInitState>[
    FAST_INIT_UNKNOWN_STATE,
    FAST_INIT_CLOSE_STATE,
    FAST_INIT_FAR_STATE,
    FAST_INIT_LOST_STATE,
  ];

  static final $core.List<FastInitState?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static FastInitState? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FastInitState._(super.value, super.name);
}

/// * The type of FastInit advertisement.
class FastInitType extends $pb.ProtobufEnum {
  static const FastInitType FAST_INIT_UNKNOWN_TYPE =
      FastInitType._(0, _omitEnumNames ? '' : 'FAST_INIT_UNKNOWN_TYPE');

  /// Show HUN to notify the user.
  static const FastInitType FAST_INIT_NOTIFY_TYPE =
      FastInitType._(1, _omitEnumNames ? '' : 'FAST_INIT_NOTIFY_TYPE');

  /// Not notify the user.
  static const FastInitType FAST_INIT_SILENT_TYPE =
      FastInitType._(2, _omitEnumNames ? '' : 'FAST_INIT_SILENT_TYPE');

  static const $core.List<FastInitType> values = <FastInitType>[
    FAST_INIT_UNKNOWN_TYPE,
    FAST_INIT_NOTIFY_TYPE,
    FAST_INIT_SILENT_TYPE,
  ];

  static final $core.List<FastInitType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static FastInitType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FastInitType._(super.value, super.name);
}

/// * The type of desktop notification event.
class DesktopNotification extends $pb.ProtobufEnum {
  static const DesktopNotification DESKTOP_NOTIFICATION_UNKNOWN =
      DesktopNotification._(
          0, _omitEnumNames ? '' : 'DESKTOP_NOTIFICATION_UNKNOWN');
  static const DesktopNotification DESKTOP_NOTIFICATION_CONNECTING =
      DesktopNotification._(
          1, _omitEnumNames ? '' : 'DESKTOP_NOTIFICATION_CONNECTING');
  static const DesktopNotification DESKTOP_NOTIFICATION_PROGRESS =
      DesktopNotification._(
          2, _omitEnumNames ? '' : 'DESKTOP_NOTIFICATION_PROGRESS');
  static const DesktopNotification DESKTOP_NOTIFICATION_ACCEPT =
      DesktopNotification._(
          3, _omitEnumNames ? '' : 'DESKTOP_NOTIFICATION_ACCEPT');
  static const DesktopNotification DESKTOP_NOTIFICATION_RECEIVED =
      DesktopNotification._(
          4, _omitEnumNames ? '' : 'DESKTOP_NOTIFICATION_RECEIVED');
  static const DesktopNotification DESKTOP_NOTIFICATION_ERROR =
      DesktopNotification._(
          5, _omitEnumNames ? '' : 'DESKTOP_NOTIFICATION_ERROR');

  static const $core.List<DesktopNotification> values = <DesktopNotification>[
    DESKTOP_NOTIFICATION_UNKNOWN,
    DESKTOP_NOTIFICATION_CONNECTING,
    DESKTOP_NOTIFICATION_PROGRESS,
    DESKTOP_NOTIFICATION_ACCEPT,
    DESKTOP_NOTIFICATION_RECEIVED,
    DESKTOP_NOTIFICATION_ERROR,
  ];

  static final $core.List<DesktopNotification?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static DesktopNotification? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DesktopNotification._(super.value, super.name);
}

class DesktopTransferEventType extends $pb.ProtobufEnum {
  static const DesktopTransferEventType DESKTOP_TRANSFER_EVENT_TYPE_UNKNOWN =
      DesktopTransferEventType._(
          0, _omitEnumNames ? '' : 'DESKTOP_TRANSFER_EVENT_TYPE_UNKNOWN');

  /// Receive attachments.
  static const DesktopTransferEventType
      DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_ACCEPT = DesktopTransferEventType._(1,
          _omitEnumNames ? '' : 'DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_ACCEPT');
  static const DesktopTransferEventType
      DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_PROGRESS = DesktopTransferEventType._(
          2,
          _omitEnumNames ? '' : 'DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_PROGRESS');
  static const DesktopTransferEventType
      DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_RECEIVED = DesktopTransferEventType._(
          3,
          _omitEnumNames ? '' : 'DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_RECEIVED');
  static const DesktopTransferEventType
      DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_ERROR = DesktopTransferEventType._(
          4, _omitEnumNames ? '' : 'DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_ERROR');

  /// Send attachments.
  static const DesktopTransferEventType DESKTOP_TRANSFER_EVENT_SEND_TYPE_START =
      DesktopTransferEventType._(
          5, _omitEnumNames ? '' : 'DESKTOP_TRANSFER_EVENT_SEND_TYPE_START');
  static const DesktopTransferEventType
      DESKTOP_TRANSFER_EVENT_SEND_TYPE_SELECT_A_DEVICE =
      DesktopTransferEventType._(
          6,
          _omitEnumNames
              ? ''
              : 'DESKTOP_TRANSFER_EVENT_SEND_TYPE_SELECT_A_DEVICE');
  static const DesktopTransferEventType
      DESKTOP_TRANSFER_EVENT_SEND_TYPE_PROGRESS = DesktopTransferEventType._(
          7, _omitEnumNames ? '' : 'DESKTOP_TRANSFER_EVENT_SEND_TYPE_PROGRESS');
  static const DesktopTransferEventType DESKTOP_TRANSFER_EVENT_SEND_TYPE_SENT =
      DesktopTransferEventType._(
          8, _omitEnumNames ? '' : 'DESKTOP_TRANSFER_EVENT_SEND_TYPE_SENT');
  static const DesktopTransferEventType DESKTOP_TRANSFER_EVENT_SEND_TYPE_ERROR =
      DesktopTransferEventType._(
          9, _omitEnumNames ? '' : 'DESKTOP_TRANSFER_EVENT_SEND_TYPE_ERROR');

  static const $core.List<DesktopTransferEventType> values =
      <DesktopTransferEventType>[
    DESKTOP_TRANSFER_EVENT_TYPE_UNKNOWN,
    DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_ACCEPT,
    DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_PROGRESS,
    DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_RECEIVED,
    DESKTOP_TRANSFER_EVENT_RECEIVE_TYPE_ERROR,
    DESKTOP_TRANSFER_EVENT_SEND_TYPE_START,
    DESKTOP_TRANSFER_EVENT_SEND_TYPE_SELECT_A_DEVICE,
    DESKTOP_TRANSFER_EVENT_SEND_TYPE_PROGRESS,
    DESKTOP_TRANSFER_EVENT_SEND_TYPE_SENT,
    DESKTOP_TRANSFER_EVENT_SEND_TYPE_ERROR,
  ];

  static final $core.List<DesktopTransferEventType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 9);
  static DesktopTransferEventType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DesktopTransferEventType._(super.value, super.name);
}

class DecryptCertificateFailureStatus extends $pb.ProtobufEnum {
  static const DecryptCertificateFailureStatus DECRYPT_CERT_UNKNOWN_FAILURE =
      DecryptCertificateFailureStatus._(
          0, _omitEnumNames ? '' : 'DECRYPT_CERT_UNKNOWN_FAILURE');
  static const DecryptCertificateFailureStatus
      DECRYPT_CERT_NO_SUCH_ALGORITHM_FAILURE =
      DecryptCertificateFailureStatus._(
          1, _omitEnumNames ? '' : 'DECRYPT_CERT_NO_SUCH_ALGORITHM_FAILURE');
  static const DecryptCertificateFailureStatus
      DECRYPT_CERT_NO_SUCH_PADDING_FAILURE = DecryptCertificateFailureStatus._(
          2, _omitEnumNames ? '' : 'DECRYPT_CERT_NO_SUCH_PADDING_FAILURE');
  static const DecryptCertificateFailureStatus
      DECRYPT_CERT_INVALID_KEY_FAILURE = DecryptCertificateFailureStatus._(
          3, _omitEnumNames ? '' : 'DECRYPT_CERT_INVALID_KEY_FAILURE');
  static const DecryptCertificateFailureStatus
      DECRYPT_CERT_INVALID_ALGORITHM_PARAMETER_FAILURE =
      DecryptCertificateFailureStatus._(
          4,
          _omitEnumNames
              ? ''
              : 'DECRYPT_CERT_INVALID_ALGORITHM_PARAMETER_FAILURE');
  static const DecryptCertificateFailureStatus
      DECRYPT_CERT_ILLEGAL_BLOCK_SIZE_FAILURE =
      DecryptCertificateFailureStatus._(
          5, _omitEnumNames ? '' : 'DECRYPT_CERT_ILLEGAL_BLOCK_SIZE_FAILURE');
  static const DecryptCertificateFailureStatus
      DECRYPT_CERT_BAD_PADDING_FAILURE = DecryptCertificateFailureStatus._(
          6, _omitEnumNames ? '' : 'DECRYPT_CERT_BAD_PADDING_FAILURE');

  static const $core.List<DecryptCertificateFailureStatus> values =
      <DecryptCertificateFailureStatus>[
    DECRYPT_CERT_UNKNOWN_FAILURE,
    DECRYPT_CERT_NO_SUCH_ALGORITHM_FAILURE,
    DECRYPT_CERT_NO_SUCH_PADDING_FAILURE,
    DECRYPT_CERT_INVALID_KEY_FAILURE,
    DECRYPT_CERT_INVALID_ALGORITHM_PARAMETER_FAILURE,
    DECRYPT_CERT_ILLEGAL_BLOCK_SIZE_FAILURE,
    DECRYPT_CERT_BAD_PADDING_FAILURE,
  ];

  static final $core.List<DecryptCertificateFailureStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static DecryptCertificateFailureStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DecryptCertificateFailureStatus._(super.value, super.name);
}

/// Refer to go/qs-contacts-consent-2024 for the detail.
class ContactAccess extends $pb.ProtobufEnum {
  static const ContactAccess CONTACT_ACCESS_UNKNOWN =
      ContactAccess._(0, _omitEnumNames ? '' : 'CONTACT_ACCESS_UNKNOWN');
  static const ContactAccess CONTACT_ACCESS_NO_CONTACT_UPLOADED =
      ContactAccess._(
          1, _omitEnumNames ? '' : 'CONTACT_ACCESS_NO_CONTACT_UPLOADED');
  static const ContactAccess CONTACT_ACCESS_ONLY_UPLOAD_GOOGLE_CONTACT =
      ContactAccess._(
          2, _omitEnumNames ? '' : 'CONTACT_ACCESS_ONLY_UPLOAD_GOOGLE_CONTACT');
  static const ContactAccess
      CONTACT_ACCESS_UPLOAD_CONTACT_FOR_DEVICE_CONTACT_CONSENT =
      ContactAccess._(
          3,
          _omitEnumNames
              ? ''
              : 'CONTACT_ACCESS_UPLOAD_CONTACT_FOR_DEVICE_CONTACT_CONSENT');
  static const ContactAccess
      CONTACT_ACCESS_UPLOAD_CONTACT_FOR_QUICK_SHARE_CONSENT = ContactAccess._(
          4,
          _omitEnumNames
              ? ''
              : 'CONTACT_ACCESS_UPLOAD_CONTACT_FOR_QUICK_SHARE_CONSENT');

  static const $core.List<ContactAccess> values = <ContactAccess>[
    CONTACT_ACCESS_UNKNOWN,
    CONTACT_ACCESS_NO_CONTACT_UPLOADED,
    CONTACT_ACCESS_ONLY_UPLOAD_GOOGLE_CONTACT,
    CONTACT_ACCESS_UPLOAD_CONTACT_FOR_DEVICE_CONTACT_CONSENT,
    CONTACT_ACCESS_UPLOAD_CONTACT_FOR_QUICK_SHARE_CONSENT,
  ];

  static final $core.List<ContactAccess?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ContactAccess? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ContactAccess._(super.value, super.name);
}

/// Refer to go/qs-contacts-consent-2024 for the detail.
class IdentityVerification extends $pb.ProtobufEnum {
  static const IdentityVerification IDENTITY_VERIFICATION_UNKNOWN =
      IdentityVerification._(
          0, _omitEnumNames ? '' : 'IDENTITY_VERIFICATION_UNKNOWN');
  static const IdentityVerification
      IDENTITY_VERIFICATION_NO_PHONE_NUMBER_VERIFIED = IdentityVerification._(
          1,
          _omitEnumNames
              ? ''
              : 'IDENTITY_VERIFICATION_NO_PHONE_NUMBER_VERIFIED');
  static const IdentityVerification
      IDENTITY_VERIFICATION_PHONE_NUMBER_VERIFIED_NOT_LINKED_TO_GAIA =
      IdentityVerification._(
          2,
          _omitEnumNames
              ? ''
              : 'IDENTITY_VERIFICATION_PHONE_NUMBER_VERIFIED_NOT_LINKED_TO_GAIA');
  static const IdentityVerification
      IDENTITY_VERIFICATION_PHONE_NUMBER_VERIFIED_LINKED_TO_QS_GAIA =
      IdentityVerification._(
          3,
          _omitEnumNames
              ? ''
              : 'IDENTITY_VERIFICATION_PHONE_NUMBER_VERIFIED_LINKED_TO_QS_GAIA');

  static const $core.List<IdentityVerification> values = <IdentityVerification>[
    IDENTITY_VERIFICATION_UNKNOWN,
    IDENTITY_VERIFICATION_NO_PHONE_NUMBER_VERIFIED,
    IDENTITY_VERIFICATION_PHONE_NUMBER_VERIFIED_NOT_LINKED_TO_GAIA,
    IDENTITY_VERIFICATION_PHONE_NUMBER_VERIFIED_LINKED_TO_QS_GAIA,
  ];

  static final $core.List<IdentityVerification?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static IdentityVerification? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const IdentityVerification._(super.value, super.name);
}

class ButtonStatus extends $pb.ProtobufEnum {
  static const ButtonStatus BUTTON_STATUS_UNKNOWN =
      ButtonStatus._(0, _omitEnumNames ? '' : 'BUTTON_STATUS_UNKNOWN');
  static const ButtonStatus BUTTON_STATUS_CLICK_ACCEPT =
      ButtonStatus._(1, _omitEnumNames ? '' : 'BUTTON_STATUS_CLICK_ACCEPT');
  static const ButtonStatus BUTTON_STATUS_CLICK_REJECT =
      ButtonStatus._(2, _omitEnumNames ? '' : 'BUTTON_STATUS_CLICK_REJECT');
  static const ButtonStatus BUTTON_STATUS_IGNORE =
      ButtonStatus._(3, _omitEnumNames ? '' : 'BUTTON_STATUS_IGNORE');

  static const $core.List<ButtonStatus> values = <ButtonStatus>[
    BUTTON_STATUS_UNKNOWN,
    BUTTON_STATUS_CLICK_ACCEPT,
    BUTTON_STATUS_CLICK_REJECT,
    BUTTON_STATUS_IGNORE,
  ];

  static final $core.List<ButtonStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ButtonStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ButtonStatus._(super.value, super.name);
}

/// LINT.IfChange
/// The result of creating a cloud sharing request. Used by
/// CLOUD_CREATE_SHARING_REQUEST.
class CloudCreateSharingResult extends $pb.ProtobufEnum {
  static const CloudCreateSharingResult CLOUD_CREATE_SHARING_RESULT_UNKNOWN =
      CloudCreateSharingResult._(
          0, _omitEnumNames ? '' : 'CLOUD_CREATE_SHARING_RESULT_UNKNOWN');

  /// The request was successful.
  static const CloudCreateSharingResult CLOUD_CREATE_SHARING_RESULT_SUCCESS =
      CloudCreateSharingResult._(
          1, _omitEnumNames ? '' : 'CLOUD_CREATE_SHARING_RESULT_SUCCESS');

  /// The user needs to sign in to perform the request. Resolvable failure.
  static const CloudCreateSharingResult
      CLOUD_CREATE_SHARING_RESULT_SIGN_IN_REQUIRE = CloudCreateSharingResult._(
          2,
          _omitEnumNames ? '' : 'CLOUD_CREATE_SHARING_RESULT_SIGN_IN_REQUIRE');

  /// The sharing id or file id already exists. Resolvable failure.
  static const CloudCreateSharingResult
      CLOUD_CREATE_SHARING_RESULT_ALREADY_EXIST = CloudCreateSharingResult._(
          3, _omitEnumNames ? '' : 'CLOUD_CREATE_SHARING_RESULT_ALREADY_EXIST');

  /// There is an existing active QR code cloud sharing session.
  static const CloudCreateSharingResult
      CLOUD_CREATE_SHARING_RESULT_ALREADY_STARTED = CloudCreateSharingResult._(
          4,
          _omitEnumNames ? '' : 'CLOUD_CREATE_SHARING_RESULT_ALREADY_STARTED');

  /// A network error occurred during the request. Resolvable failure.
  static const CloudCreateSharingResult
      CLOUD_CREATE_SHARING_RESULT_NETWORK_ERROR = CloudCreateSharingResult._(
          5, _omitEnumNames ? '' : 'CLOUD_CREATE_SHARING_RESULT_NETWORK_ERROR');

  /// The request contains invalid arguments. Resolvable failure.
  static const CloudCreateSharingResult
      CLOUD_CREATE_SHARING_RESULT_INVALID_ARGUMENT = CloudCreateSharingResult._(
          6,
          _omitEnumNames ? '' : 'CLOUD_CREATE_SHARING_RESULT_INVALID_ARGUMENT');

  /// A remote error occurred during the request. Unresolvable error.
  static const CloudCreateSharingResult
      CLOUD_CREATE_SHARING_RESULT_REMOTE_ERROR = CloudCreateSharingResult._(
          7, _omitEnumNames ? '' : 'CLOUD_CREATE_SHARING_RESULT_REMOTE_ERROR');

  /// The request contains more than 1000 files.
  static const CloudCreateSharingResult
      CLOUD_CREATE_SHARING_RESULT_FILE_LIMIT_EXCEED_COUNT =
      CloudCreateSharingResult._(
          8,
          _omitEnumNames
              ? ''
              : 'CLOUD_CREATE_SHARING_RESULT_FILE_LIMIT_EXCEED_COUNT');

  /// The request contains more than 10GB of files.
  static const CloudCreateSharingResult
      CLOUD_CREATE_SHARING_RESULT_FILE_LIMIT_EXCEED_SIZE =
      CloudCreateSharingResult._(
          9,
          _omitEnumNames
              ? ''
              : 'CLOUD_CREATE_SHARING_RESULT_FILE_LIMIT_EXCEED_SIZE');

  /// The request was successful but this device cannot be notified for receiver
  /// updates.
  static const CloudCreateSharingResult
      CLOUD_CREATE_SHARING_RESULT_SUCCESS_NO_NOTIFICATION =
      CloudCreateSharingResult._(
          10,
          _omitEnumNames
              ? ''
              : 'CLOUD_CREATE_SHARING_RESULT_SUCCESS_NO_NOTIFICATION');

  static const $core.List<CloudCreateSharingResult> values =
      <CloudCreateSharingResult>[
    CLOUD_CREATE_SHARING_RESULT_UNKNOWN,
    CLOUD_CREATE_SHARING_RESULT_SUCCESS,
    CLOUD_CREATE_SHARING_RESULT_SIGN_IN_REQUIRE,
    CLOUD_CREATE_SHARING_RESULT_ALREADY_EXIST,
    CLOUD_CREATE_SHARING_RESULT_ALREADY_STARTED,
    CLOUD_CREATE_SHARING_RESULT_NETWORK_ERROR,
    CLOUD_CREATE_SHARING_RESULT_INVALID_ARGUMENT,
    CLOUD_CREATE_SHARING_RESULT_REMOTE_ERROR,
    CLOUD_CREATE_SHARING_RESULT_FILE_LIMIT_EXCEED_COUNT,
    CLOUD_CREATE_SHARING_RESULT_FILE_LIMIT_EXCEED_SIZE,
    CLOUD_CREATE_SHARING_RESULT_SUCCESS_NO_NOTIFICATION,
  ];

  static final $core.List<CloudCreateSharingResult?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static CloudCreateSharingResult? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CloudCreateSharingResult._(super.value, super.name);
}

/// LINT.IfChange
/// The result of registering a receiver for a cloud sharing. Used by
/// CLOUD_REGISTER_RECEIVER.
class CloudRegisterReceiverResult extends $pb.ProtobufEnum {
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_UNKNOWN = CloudRegisterReceiverResult._(
          0, _omitEnumNames ? '' : 'CLOUD_REGISTER_RECEIVER_RESULT_UNKNOWN');

  /// The request was successful.
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_SUCCESS = CloudRegisterReceiverResult._(
          1, _omitEnumNames ? '' : 'CLOUD_REGISTER_RECEIVER_RESULT_SUCCESS');

  /// The request contains invalid arguments.
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_INVALID_ARGUMENT =
      CloudRegisterReceiverResult._(
          2,
          _omitEnumNames
              ? ''
              : 'CLOUD_REGISTER_RECEIVER_RESULT_INVALID_ARGUMENT');

  /// Deadline expired before the request could complete.
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_DEADLINE_EXCEEDED =
      CloudRegisterReceiverResult._(
          3,
          _omitEnumNames
              ? ''
              : 'CLOUD_REGISTER_RECEIVER_RESULT_DEADLINE_EXCEEDED');

  /// An internal error occurred during the request.
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_INTERNAL = CloudRegisterReceiverResult._(
          4, _omitEnumNames ? '' : 'CLOUD_REGISTER_RECEIVER_RESULT_INTERNAL');

  /// The request was rejected due to too many receivers.
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_RESOURCE_EXHAUSTED =
      CloudRegisterReceiverResult._(
          5,
          _omitEnumNames
              ? ''
              : 'CLOUD_REGISTER_RECEIVER_RESULT_RESOURCE_EXHAUSTED');

  /// The service is currently unavailable.
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_UNAVAILABLE =
      CloudRegisterReceiverResult._(6,
          _omitEnumNames ? '' : 'CLOUD_REGISTER_RECEIVER_RESULT_UNAVAILABLE');

  /// The caller does not have permission to register a receiver.
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_PERMISSION_DENIED =
      CloudRegisterReceiverResult._(
          7,
          _omitEnumNames
              ? ''
              : 'CLOUD_REGISTER_RECEIVER_RESULT_PERMISSION_DENIED');
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_NOT_FOUND = CloudRegisterReceiverResult._(
          8, _omitEnumNames ? '' : 'CLOUD_REGISTER_RECEIVER_RESULT_NOT_FOUND');
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_ALREADY_EXISTS =
      CloudRegisterReceiverResult._(
          9,
          _omitEnumNames
              ? ''
              : 'CLOUD_REGISTER_RECEIVER_RESULT_ALREADY_EXISTS');
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_UNAUTHENTICATED =
      CloudRegisterReceiverResult._(
          10,
          _omitEnumNames
              ? ''
              : 'CLOUD_REGISTER_RECEIVER_RESULT_UNAUTHENTICATED');
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_CANCELLED = CloudRegisterReceiverResult._(
          11, _omitEnumNames ? '' : 'CLOUD_REGISTER_RECEIVER_RESULT_CANCELLED');
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_FAILED_PRECONDITION =
      CloudRegisterReceiverResult._(
          12,
          _omitEnumNames
              ? ''
              : 'CLOUD_REGISTER_RECEIVER_RESULT_FAILED_PRECONDITION');
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_ABORTED = CloudRegisterReceiverResult._(
          13, _omitEnumNames ? '' : 'CLOUD_REGISTER_RECEIVER_RESULT_ABORTED');
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_OUT_OF_RANGE =
      CloudRegisterReceiverResult._(14,
          _omitEnumNames ? '' : 'CLOUD_REGISTER_RECEIVER_RESULT_OUT_OF_RANGE');
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_UNIMPLEMENTED =
      CloudRegisterReceiverResult._(15,
          _omitEnumNames ? '' : 'CLOUD_REGISTER_RECEIVER_RESULT_UNIMPLEMENTED');
  static const CloudRegisterReceiverResult
      CLOUD_REGISTER_RECEIVER_RESULT_DATA_LOSS = CloudRegisterReceiverResult._(
          16, _omitEnumNames ? '' : 'CLOUD_REGISTER_RECEIVER_RESULT_DATA_LOSS');

  static const $core.List<CloudRegisterReceiverResult> values =
      <CloudRegisterReceiverResult>[
    CLOUD_REGISTER_RECEIVER_RESULT_UNKNOWN,
    CLOUD_REGISTER_RECEIVER_RESULT_SUCCESS,
    CLOUD_REGISTER_RECEIVER_RESULT_INVALID_ARGUMENT,
    CLOUD_REGISTER_RECEIVER_RESULT_DEADLINE_EXCEEDED,
    CLOUD_REGISTER_RECEIVER_RESULT_INTERNAL,
    CLOUD_REGISTER_RECEIVER_RESULT_RESOURCE_EXHAUSTED,
    CLOUD_REGISTER_RECEIVER_RESULT_UNAVAILABLE,
    CLOUD_REGISTER_RECEIVER_RESULT_PERMISSION_DENIED,
    CLOUD_REGISTER_RECEIVER_RESULT_NOT_FOUND,
    CLOUD_REGISTER_RECEIVER_RESULT_ALREADY_EXISTS,
    CLOUD_REGISTER_RECEIVER_RESULT_UNAUTHENTICATED,
    CLOUD_REGISTER_RECEIVER_RESULT_CANCELLED,
    CLOUD_REGISTER_RECEIVER_RESULT_FAILED_PRECONDITION,
    CLOUD_REGISTER_RECEIVER_RESULT_ABORTED,
    CLOUD_REGISTER_RECEIVER_RESULT_OUT_OF_RANGE,
    CLOUD_REGISTER_RECEIVER_RESULT_UNIMPLEMENTED,
    CLOUD_REGISTER_RECEIVER_RESULT_DATA_LOSS,
  ];

  static final $core.List<CloudRegisterReceiverResult?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 16);
  static CloudRegisterReceiverResult? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CloudRegisterReceiverResult._(super.value, super.name);
}

/// The action type of uploading/downloading files to/from the cloud. Used by
/// CLOUD_UPLOAD_START , CLOUD_UPLOAD_END, CLOUD_DOWNLOAD_START and
/// CLOUD_DOWNLOAD_END.
class CloudActionType extends $pb.ProtobufEnum {
  static const CloudActionType CLOUD_ACTION_TYPE_UNKNOWN =
      CloudActionType._(0, _omitEnumNames ? '' : 'CLOUD_ACTION_TYPE_UNKNOWN');

  /// The action is a normal upload/download.
  static const CloudActionType CLOUD_ACTION_TYPE_NORMAL =
      CloudActionType._(1, _omitEnumNames ? '' : 'CLOUD_ACTION_TYPE_NORMAL');

  /// The action is a retry of a previous failed upload/download.
  static const CloudActionType CLOUD_ACTION_TYPE_RETRY =
      CloudActionType._(2, _omitEnumNames ? '' : 'CLOUD_ACTION_TYPE_RETRY');

  static const $core.List<CloudActionType> values = <CloudActionType>[
    CLOUD_ACTION_TYPE_UNKNOWN,
    CLOUD_ACTION_TYPE_NORMAL,
    CLOUD_ACTION_TYPE_RETRY,
  ];

  static final $core.List<CloudActionType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static CloudActionType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CloudActionType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
