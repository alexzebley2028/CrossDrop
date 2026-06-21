import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Resolves the directory that received files are written to.
///
/// A user-configured path (set from settings) takes precedence; otherwise we
/// fall back to the platform Downloads directory, and finally the application
/// documents directory. This is consulted by the inbound connection, which has
/// no direct access to the settings layer, so the configured path is injected
/// here as a process-wide override.
class DownloadLocation {
  DownloadLocation._();

  static final DownloadLocation instance = DownloadLocation._();

  String? _configuredPath;

  /// The user-configured directory, or null to use platform defaults.
  String? get configuredPath => _configuredPath;

  set configuredPath(String? path) {
    final trimmed = path?.trim();
    _configuredPath = (trimmed != null && trimmed.isNotEmpty) ? trimmed : null;
  }

  /// Resolves the directory to save into, creating the configured directory if
  /// it does not exist yet. Falls back to platform defaults when the configured
  /// directory cannot be used.
  Future<Directory> resolve() async {
    final configured = _configuredPath;
    if (configured != null) {
      final dir = Directory(configured);
      try {
        if (!await dir.exists()) {
          await dir.create(recursive: true);
        }
        return dir;
      } catch (_) {
        // Fall through to platform defaults if the configured path is unusable.
      }
    }

    if (Platform.isIOS) {
      return getApplicationDocumentsDirectory();
    }

    try {
      final downloads = await getDownloadsDirectory();
      if (downloads != null) return downloads;
    } on UnsupportedError {
      // Platform without a Downloads directory; fall through.
    }

    return getApplicationDocumentsDirectory();
  }
}
