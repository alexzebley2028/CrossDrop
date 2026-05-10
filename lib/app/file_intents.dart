import 'dart:async';

import 'package:crossdrop/app/file_paths.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const MethodChannel _fileIntentChannel = MethodChannel(
  'crossdrop/file_intents',
);

class FileIntentController {
  final Future<void> Function(Iterable<String> paths) onOpenFiles;
  final List<String> _initialOutgoingFilePaths;

  FileIntentController({
    required Iterable<String> initialFilePaths,
    required this.onOpenFiles,
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
    if (call.method != 'openFiles') {
      throw MissingPluginException('Unknown method ${call.method}');
    }

    final args = call.arguments;
    if (args is Iterable<dynamic>) {
      await onOpenFiles(filePathsFromArgs(args));
    }
    return null;
  }

  Future<void> _notifyNativeFileIntentReady() async {
    try {
      await _fileIntentChannel.invokeMethod<void>('ready');
    } on MissingPluginException {
      // The channel is only implemented on platforms with native open-file hooks.
    } catch (e, s) {
      print('Failed to notify native file intent bridge: $e\n$s');
    }
  }

  void _consumeInitialOutgoingFilePaths() {
    if (_initialOutgoingFilePaths.isEmpty) return;
    final paths = List<String>.from(_initialOutgoingFilePaths);
    _initialOutgoingFilePaths.clear();
    unawaited(onOpenFiles(paths));
  }
}
