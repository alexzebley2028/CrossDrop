import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

/// Configures the root [Logger] for the app.
///
/// In debug builds every record is emitted; release builds drop anything
/// below [Level.INFO]. Records are forwarded to `dart:developer`'s log, which
/// shows up in `flutter logs`, the IDE, and the macOS Console.
void setupLogging() {
  Logger.root.level = kDebugMode ? Level.ALL : Level.INFO;
  Logger.root.onRecord.listen((record) {
    developer.log(
      record.message,
      time: record.time,
      level: record.level.value,
      name: record.loggerName,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  });
}
