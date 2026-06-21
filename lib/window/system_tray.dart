import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:crossdrop/app/window_setup.dart';
import 'package:crossdrop/settings/receive_visibility.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';

class AppSystemTray {
  AppSystemTray({
    required String deviceName,
    required ReceiveVisibility visibility,
    required this.onSetVisibility,
    required this.onOpen,
  }) : _deviceName = deviceName,
       _visibility = visibility;

  String _deviceName;
  ReceiveVisibility _visibility;

  /// Invoked when the user picks a visibility mode from the tray menu.
  final void Function(ReceiveVisibility visibility) onSetVisibility;

  /// Invoked when the user asks to open the CrossDrop window from the tray.
  final Future<void> Function() onOpen;

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

    await _rebuildMenu();
  }

  Future<void> updateDeviceName(String deviceName) async {
    _deviceName = deviceName;
    await _rebuildMenu();
  }

  Future<void> updateVisibility(ReceiveVisibility visibility) async {
    if (_visibility == visibility) return;
    _visibility = visibility;
    await _rebuildMenu();
  }

  Future<void> _rebuildMenu() async {
    await menu.buildFrom([
      MenuItemLabel(label: _statusLabel, enabled: false),
      MenuItemLabel(label: 'Device: $_deviceName', enabled: false),
      MenuSeparator(),
      MenuItemCheckbox(
        label: 'Visible to everyone',
        checked: _visibility == ReceiveVisibility.everyone,
        onClicked: (_) => onSetVisibility(ReceiveVisibility.everyone),
      ),
      MenuItemCheckbox(
        label: 'Visible for 1 minute',
        checked: _visibility == ReceiveVisibility.temporary,
        onClicked: (_) => onSetVisibility(ReceiveVisibility.temporary),
      ),
      MenuItemCheckbox(
        label: 'Hidden',
        checked: _visibility == ReceiveVisibility.hidden,
        onClicked: (_) => onSetVisibility(ReceiveVisibility.hidden),
      ),
      MenuSeparator(),
      MenuItemLabel(
        label: 'Open CrossDrop',
        onClicked: (_) => unawaited(onOpen()),
      ),
      MenuItemLabel(
        label: 'Quit CrossDrop',
        onClicked: (_) async {
          await _systemTray.destroy();
          await windowManager.setPreventClose(false);
          await windowManager.destroy();
          exit(0);
        },
      ),
    ]);
    await _systemTray.setContextMenu(menu);
  }

  String get _statusLabel {
    switch (_visibility) {
      case ReceiveVisibility.everyone:
        return 'Visible to everyone';
      case ReceiveVisibility.temporary:
        return 'Visible temporarily';
      case ReceiveVisibility.hidden:
        return 'Hidden';
    }
  }

  Future<void> togglePanel() async {
    if (await windowManager.isVisible()) {
      await windowManager.hide();
      return;
    }
    await showPanel();
  }

  Future<void> showPanel({Size targetSize = defaultWindowSize}) async {
    // Only (re)anchor the panel to the cursor when bringing it up from hidden.
    // If it's already open — e.g. the user clicked the settings gear or the
    // send button inside it — keep it where it is instead of jumping it under
    // the cursor's new position.
    final wasVisible = await windowManager.isVisible();
    await ensureWindowSizeAtLeast(targetSize);
    if (!wasVisible) {
      await _positionPanelNearCursor();
    }
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
