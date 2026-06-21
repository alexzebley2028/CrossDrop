import 'dart:io';

import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

final Logger _log = Logger('autostart');

/// Cross-platform "launch at login" control.
///
/// * **Linux** is handled entirely in Dart by writing an XDG autostart entry to
///   `~/.config/autostart/`, which needs no native code and works for both the
///   tarball and AppImage distributions.
/// * **macOS** is delegated to a native `SMAppService` handler over the
///   `crossdrop/autostart` method channel (requires macOS 13+).
/// * Other platforms report unsupported.
class AutostartService {
  AutostartService._();

  static final AutostartService instance = AutostartService._();

  static const MethodChannel _channel = MethodChannel('crossdrop/autostart');
  static const String _linuxEntryName = 'crossdrop.desktop';

  bool get isSupported => Platform.isLinux || Platform.isMacOS;

  Future<bool> isEnabled() async {
    try {
      if (Platform.isLinux) {
        return _linuxAutostartFile()?.existsSync() ?? false;
      }
      if (Platform.isMacOS) {
        return await _channel.invokeMethod<bool>('isEnabled') ?? false;
      }
    } on MissingPluginException {
      // No native handler on this platform/build.
    } catch (e, s) {
      _log.severe('Failed to query autostart state: $e\n$s');
    }
    return false;
  }

  /// Applies [enabled]. Returns the effective state (false if unsupported or on
  /// failure).
  Future<bool> setEnabled(bool enabled) async {
    try {
      if (Platform.isLinux) {
        return _setLinuxEnabled(enabled);
      }
      if (Platform.isMacOS) {
        final ok = await _channel.invokeMethod<bool>('setEnabled', {
          'enabled': enabled,
        });
        return ok ?? false;
      }
    } on MissingPluginException {
      _log.info('Autostart is not implemented on this platform.');
    } catch (e, s) {
      _log.severe('Failed to set autostart state: $e\n$s');
    }
    return false;
  }

  // --- Linux (XDG autostart) ---

  /// The XDG config directory, or null when it cannot be resolved (e.g. no HOME
  /// and no XDG_CONFIG_HOME), in which case autostart is unavailable rather than
  /// writing to a bogus relative path.
  String? _linuxConfigHome() {
    final xdg = Platform.environment['XDG_CONFIG_HOME'];
    if (xdg != null && xdg.isNotEmpty) return xdg;
    final home = Platform.environment['HOME'];
    if (home != null && home.isNotEmpty) return p.join(home, '.config');
    return null;
  }

  File? _linuxAutostartFile() {
    final configHome = _linuxConfigHome();
    if (configHome == null) return null;
    return File(p.join(configHome, 'autostart', _linuxEntryName));
  }

  bool _setLinuxEnabled(bool enabled) {
    final file = _linuxAutostartFile();
    if (file == null) {
      _log.severe('Cannot resolve XDG config dir; autostart unavailable.');
      return false;
    }
    if (!enabled) {
      if (file.existsSync()) file.deleteSync();
      return false;
    }

    // Prefer the AppImage path when running from one so relaunch works.
    final exec =
        Platform.environment['APPIMAGE'] ?? Platform.resolvedExecutable;
    file.parent.createSync(recursive: true);
    file.writeAsStringSync(
      '[Desktop Entry]\n'
      'Type=Application\n'
      'Name=CrossDrop\n'
      'Exec="${_escapeDesktopExecArg(exec)}"\n'
      'Terminal=false\n'
      'X-GNOME-Autostart-enabled=true\n',
    );
    return true;
  }

  /// Escapes the reserved characters for a quoted Desktop Entry `Exec` argument.
  String _escapeDesktopExecArg(String value) {
    return value
        .replaceAll('\\', r'\\')
        .replaceAll('"', r'\"')
        .replaceAll(r'$', r'\$')
        .replaceAll('`', r'\`');
  }
}
