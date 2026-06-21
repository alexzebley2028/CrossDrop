import 'dart:io';

import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('nearby_share_scanner');

/// Listens for the BLE "Fast Init" beacon a nearby device emits when it starts
/// a Quick Share session, so CrossDrop can "wake from Hidden": become briefly
/// visible (and notify the user) only when someone actually wants to send.
///
/// macOS/iOS scan with CoreBluetooth; Linux scans with BlueZ. BLE *advertising*
/// of custom service data is blocked on Apple platforms (which is why CrossDrop
/// can't trigger Android's own "device sharing nearby" prompt), but BLE
/// *scanning* in the central role is allowed — and that is all this needs.
///
/// The native side filters on the Quick Share service UUID
/// (`0000fe2c-0000-1000-8000-00805f9b34fb`) and debounces detections so a
/// continuously-advertising sender only wakes us once.
class NearbyShareScanner {
  static const MethodChannel _channel = MethodChannel('crossdrop/ble_scan');

  bool _started = false;

  /// Invoked (on the platform thread → main isolate) when a nearby device is
  /// detected starting a share.
  void Function()? onNearbySharingDetected;

  bool get isSupported =>
      Platform.isMacOS || Platform.isIOS || Platform.isLinux;

  bool get isScanning => _started;

  Future<bool> start() async {
    if (!isSupported) return false;
    _channel.setMethodCallHandler(_handleMethodCall);
    if (_started) return true;
    try {
      final started = await _channel.invokeMethod<bool>('start') ?? false;
      _started = started;
      _log.info(
        started
            ? 'Started nearby-sharing BLE scan'
            : 'Nearby-sharing BLE scan unavailable',
      );
      return started;
    } on MissingPluginException {
      _log.info('Nearby-sharing BLE scan not implemented on this platform');
      return false;
    } catch (e, s) {
      _log.severe('Failed to start nearby-sharing BLE scan: $e\n$s');
      return false;
    }
  }

  Future<void> stop() async {
    if (!_started) return;
    _started = false;
    try {
      await _channel.invokeMethod<void>('stop');
      _log.info('Stopped nearby-sharing BLE scan');
    } on MissingPluginException {
      // Platform does not implement the channel.
    } catch (e, s) {
      _log.severe('Failed to stop nearby-sharing BLE scan: $e\n$s');
    }
  }

  Future<dynamic> _handleMethodCall(MethodCall call) async {
    if (call.method == 'onNearbySharing') {
      _log.info('Nearby device is sharing (BLE beacon detected)');
      onNearbySharingDetected?.call();
    }
    return null;
  }
}
