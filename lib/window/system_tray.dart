import 'dart:io';

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
    await _systemTray.initSystemTray(iconPath: path, toolTip: 'CrossDrop');

    // handle system tray event
    _systemTray.registerSystemTrayEventHandler((eventName) {
      if (eventName == kSystemTrayEventClick ||
          eventName == kSystemTrayEventRightClick) {
        _systemTray.popUpContextMenu();
      } else if (eventName == kSystemTrayEventDoubleClick) {
        _showMainWindow();
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
        label: 'Open CrossDrop',
        onClicked: (menuItem) => _showMainWindow(),
      ),
      MenuItemLabel(
        label: 'Hide Window',
        onClicked: (menuItem) => windowManager.hide(),
      ),
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

  Future<void> _showMainWindow() async {
    await windowManager.show();
    await windowManager.focus();
  }
}
