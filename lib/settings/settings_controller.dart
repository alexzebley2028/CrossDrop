import 'dart:async';

import 'package:crossdrop/device.dart' as device;
import 'package:crossdrop/settings/download_location.dart';
import 'package:crossdrop/settings/receive_visibility.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persisted, app-wide user preferences.
///
/// Acts as a [ChangeNotifier] so the UI and the broadcast-reconciliation logic
/// can react to changes (for example, when [ReceiveVisibility.temporary]
/// expires and the controller flips back to [ReceiveVisibility.hidden]).
class SettingsController extends ChangeNotifier {
  SettingsController({
    Duration temporaryVisibilityDuration = const Duration(seconds: 60),
  }) : _temporaryVisibilityDuration = temporaryVisibilityDuration;

  static const String _kVisibility = 'receiveVisibility';
  static const String _kDownloadDir = 'downloadDirectory';
  static const String _kLaunchAtStartup = 'launchAtStartup';

  final Duration _temporaryVisibilityDuration;

  SharedPreferences? _prefs;

  ReceiveVisibility _visibility = ReceiveVisibility.everyone;
  String _deviceName = '';
  String? _downloadDirectory;
  bool _launchAtStartup = false;

  Timer? _temporaryTimer;
  DateTime? _temporaryExpiresAt;

  /// How long [ReceiveVisibility.temporary] stays active before reverting.
  Duration get temporaryVisibilityDuration => _temporaryVisibilityDuration;

  ReceiveVisibility get visibility => _visibility;

  /// The name this device advertises / is discoverable as.
  String get deviceName => _deviceName;

  /// User-configured download directory, or null to use platform defaults.
  String? get downloadDirectory => _downloadDirectory;

  bool get launchAtStartup => _launchAtStartup;

  /// Whether the mDNS service should currently be advertised.
  bool get shouldBroadcast => _visibility.shouldBroadcast;

  /// When the current temporary-visibility window ends, or null when not in
  /// [ReceiveVisibility.temporary] mode.
  DateTime? get temporaryVisibilityExpiresAt => _temporaryExpiresAt;

  /// Loads persisted settings. Safe to call once during startup.
  Future<void> load() async {
    final prefs = _prefs = await SharedPreferences.getInstance();

    _visibility = ReceiveVisibility.fromStorage(prefs.getString(_kVisibility));
    // A persisted "temporary" window cannot meaningfully survive a restart, so
    // treat it as hidden until the user opts in again.
    if (_visibility == ReceiveVisibility.temporary) {
      _visibility = ReceiveVisibility.hidden;
    }

    _downloadDirectory = prefs.getString(_kDownloadDir);
    _launchAtStartup = prefs.getBool(_kLaunchAtStartup) ?? false;
    // device.getDeviceName() resolves (and persists) the platform default the
    // first time around (hostname / iOS device name).
    _deviceName = await device.getDeviceName();

    DownloadLocation.instance.configuredPath = _downloadDirectory;
    notifyListeners();
  }

  /// Updates the advertised device name. No-op for an empty or unchanged name.
  Future<void> setDeviceName(String name) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty || trimmed == _deviceName) return;
    _deviceName = trimmed;
    await device.setDeviceName(trimmed);
    notifyListeners();
  }

  Future<void> setVisibility(ReceiveVisibility visibility) async {
    _cancelTemporaryTimer();
    _visibility = visibility;

    if (visibility == ReceiveVisibility.temporary) {
      _temporaryExpiresAt = DateTime.now().add(_temporaryVisibilityDuration);
      _temporaryTimer = Timer(_temporaryVisibilityDuration, () {
        _temporaryTimer = null;
        _temporaryExpiresAt = null;
        _visibility = ReceiveVisibility.hidden;
        notifyListeners();
      });
    }

    await _prefs?.setString(_kVisibility, visibility.storageValue);
    notifyListeners();
  }

  Future<void> setDownloadDirectory(String? path) async {
    final trimmed = path?.trim();
    _downloadDirectory = (trimmed != null && trimmed.isNotEmpty)
        ? trimmed
        : null;
    DownloadLocation.instance.configuredPath = _downloadDirectory;

    if (_downloadDirectory == null) {
      await _prefs?.remove(_kDownloadDir);
    } else {
      await _prefs?.setString(_kDownloadDir, _downloadDirectory!);
    }
    notifyListeners();
  }

  Future<void> setLaunchAtStartup(bool enabled) async {
    _launchAtStartup = enabled;
    await _prefs?.setBool(_kLaunchAtStartup, enabled);
    notifyListeners();
  }

  void _cancelTemporaryTimer() {
    _temporaryTimer?.cancel();
    _temporaryTimer = null;
    _temporaryExpiresAt = null;
  }

  @override
  void dispose() {
    _cancelTemporaryTimer();
    super.dispose();
  }
}
