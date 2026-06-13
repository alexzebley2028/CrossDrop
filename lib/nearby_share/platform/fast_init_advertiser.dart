import 'dart:io';

import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('fast_init_advertiser');

class FastInitAdvertiser {
  static const MethodChannel _channel = MethodChannel('crossdrop/fast_init');

  bool _started = false;

  Future<void> start() async {
    if (_started || !Platform.isLinux) return;
    try {
      final started = await _channel.invokeMethod<bool>('start') ?? false;
      _started = started;
      if (started) {
        _log.info('Requested Quick Share Fast Init BLE advertising');
      } else {
        _log.info('Quick Share Fast Init BLE advertising is not available');
      }
    } on MissingPluginException {
      _log.info(
        'Quick Share Fast Init BLE advertising is not implemented here',
      );
    } catch (e, s) {
      _log.severe(
        'Failed to start Quick Share Fast Init BLE advertising: $e\n$s',
      );
    }
  }

  Future<void> stop() async {
    if (!_started || !Platform.isLinux) return;
    _started = false;
    try {
      await _channel.invokeMethod<void>('stop');
      _log.info('Stopped Quick Share Fast Init BLE advertising');
    } on MissingPluginException {
      // Platform does not implement the channel.
    } catch (e, s) {
      _log.severe(
        'Failed to stop Quick Share Fast Init BLE advertising: $e\n$s',
      );
    }
  }
}
