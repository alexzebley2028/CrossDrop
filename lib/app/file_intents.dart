import 'dart:async';

import 'package:crossdrop/app/file_paths.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('file_intents');

const MethodChannel _fileIntentChannel = MethodChannel(
  'crossdrop/file_intents',
);

class FileIntentController {
  final Future<void> Function(Iterable<String> paths) onOpenFiles;

  /// Invoked when text/URL content is shared into the app (e.g. the macOS
  /// "Send text with CrossDrop" service).
  final Future<void> Function(String text)? onShareText;
  final List<String> _initialOutgoingFilePaths;

  FileIntentController({
    required Iterable<String> initialFilePaths,
    required this.onOpenFiles,
    this.onShareText,
  }) : _initialOutgoingFilePaths = List.of(initialFilePaths);

  void start() {
    _fileIntentChannel.setMethodCallHandler(_handleFileIntentMethodCall);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _consumeInitialOutgoingFilePaths();
      unawaited(_notifyNativeFileIntentReady());
    });
  }

  void dispose() {
    _fileIntentChannel.setMethodCallHandler(null);
  }

  Future<dynamic> _handleFileIntentMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'openFiles':
        final args = call.arguments;
        if (args is Iterable<dynamic>) {
          await onOpenFiles(filePathsFromArgs(args));
        }
        return null;
      case 'shareText':
        final text = call.arguments;
        if (text is String && text.trim().isNotEmpty) {
          await onShareText?.call(text);
        }
        return null;
      default:
        throw MissingPluginException('Unknown method ${call.method}');
    }
  }

  Future<void> _notifyNativeFileIntentReady() async {
    try {
      await _fileIntentChannel.invokeMethod<void>('ready');
    } on MissingPluginException {
      // The channel is only implemented on platforms with native open-file hooks.
    } catch (e, s) {
      _log.severe('Failed to notify native file intent bridge: $e\n$s');
    }
  }

  void _consumeInitialOutgoingFilePaths() {
    if (_initialOutgoingFilePaths.isEmpty) return;
    final paths = List<String>.from(_initialOutgoingFilePaths);
    _initialOutgoingFilePaths.clear();
    unawaited(onOpenFiles(paths));
  }
}
