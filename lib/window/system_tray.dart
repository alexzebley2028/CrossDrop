import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:crossdrop/app/window_setup.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';

class AppSystemTray {
  final String _deviceName;

  AppSystemTray(this._deviceName);

  final SystemTray _systemTray = SystemTray();
  final Menu menu = Menu();

  Future<void> initSystemTray() async {
    final path = Platform.isWindows
        ? 'assets/icons/system_tray_icon.ico'
        : 'assets/icons/system_tray_icon.png';
    await _systemTray.initSystemTray(
      iconPath: path,
      toolTip: 'CrossDrop',
      // On macOS, mark the icon as a template image so the menu bar tints it
      // automatically: white on a dark menu bar, black on a light one.
      isTemplate: Platform.isMacOS,
    );

    // handle system tray event
    _systemTray.registerSystemTrayEventHandler((eventName) {
      if (eventName == kSystemTrayEventClick) {
        unawaited(togglePanel());
      } else if (eventName == kSystemTrayEventRightClick) {
        _systemTray.popUpContextMenu();
      } else if (eventName == kSystemTrayEventDoubleClick) {
        unawaited(showPanel());
      }
    });

    updateDeviceName(_deviceName);
  }

  Future<void> updateDeviceName(String deviceName) async {
    await menu.buildFrom([
      MenuItemLabel(label: 'Visible to everyone', enabled: false),
      MenuItemLabel(label: 'Device name: $deviceName', enabled: false),
      MenuSeparator(),
      MenuItemLabel(
        label: 'Quit CrossDrop',
        onClicked: (menuItem) async {
          await _systemTray.destroy();
          await windowManager.setPreventClose(false);
          await windowManager.destroy();
          exit(0);
        },
      ),
    ]);
    await _systemTray.setContextMenu(menu);
  }

  Future<void> togglePanel() async {
    if (await windowManager.isVisible()) {
      await windowManager.hide();
      return;
    }
    await showPanel();
  }

  Future<void> showPanel({Size targetSize = defaultWindowSize}) async {
    await ensureWindowSizeAtLeast(targetSize);
    await _positionPanelNearCursor();
    await windowManager.show();
    await windowManager.focus();
  }

  Future<void> _positionPanelNearCursor() async {
    final cursor = await screenRetriever.getCursorScreenPoint();
    final windowSize = await windowManager.getSize();
    final screenBounds = await _visibleScreenBoundsFor(cursor);

    const horizontalMargin = 8.0;
    const verticalMargin = 1.0;
    const gap = -8.0;
    final left = _clampDouble(
      cursor.dx - (windowSize.width / 2),
      screenBounds.left + horizontalMargin,
      screenBounds.right - windowSize.width - horizontalMargin,
    );

    final isCursorInTopHalf = cursor.dy < screenBounds.center.dy;
    final preferredTop = isCursorInTopHalf
        ? cursor.dy + gap
        : cursor.dy - windowSize.height - gap;
    final top = _clampDouble(
      preferredTop,
      screenBounds.top + verticalMargin,
      screenBounds.bottom - windowSize.height - verticalMargin,
    );

    await windowManager.setBounds(
      Rect.fromLTWH(left, top, windowSize.width, windowSize.height),
    );
  }

  Future<Rect> _visibleScreenBoundsFor(Offset point) async {
    final displays = await screenRetriever.getAllDisplays();
    for (final display in displays) {
      final bounds = _visibleBounds(display);
      if (bounds.contains(point)) return bounds;
    }
    return _visibleBounds(await screenRetriever.getPrimaryDisplay());
  }

  Rect _visibleBounds(Display display) {
    final position = display.visiblePosition ?? Offset.zero;
    final size = display.visibleSize ?? display.size;
    return position & size;
  }

  double _clampDouble(double value, double lowerLimit, double upperLimit) {
    if (upperLimit < lowerLimit) return lowerLimit;
    return value.clamp(lowerLimit, upperLimit).toDouble();
  }
}
