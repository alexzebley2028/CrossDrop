import 'dart:io';

import 'package:flutter/services.dart';

class FastInitAdvertiser {
  static const MethodChannel _channel = MethodChannel('crossdrop/fast_init');

  bool _started = false;

  Future<void> start() async {
    if (_started || !Platform.isLinux) return;
    try {
      final started = await _channel.invokeMethod<bool>('start') ?? false;
      _started = started;
      if (started) {
        print('Requested Quick Share Fast Init BLE advertising');
      } else {
        print('Quick Share Fast Init BLE advertising is not available');
      }
    } on MissingPluginException {
      print('Quick Share Fast Init BLE advertising is not implemented here');
    } catch (e, s) {
      print('Failed to start Quick Share Fast Init BLE advertising: $e\n$s');
    }
  }

  Future<void> stop() async {
    if (!_started || !Platform.isLinux) return;
    _started = false;
    try {
      await _channel.invokeMethod<void>('stop');
      print('Stopped Quick Share Fast Init BLE advertising');
    } on MissingPluginException {
      // Platform does not implement the channel.
    } catch (e, s) {
      print('Failed to stop Quick Share Fast Init BLE advertising: $e\n$s');
    }
  }
}
