import 'dart:async';
import 'dart:io';

import 'package:crossdrop/app_config.dart';
import 'package:crossdrop/window/on_close_window.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

const Size defaultWindowSize = Size(420, 640);
const Size minimumWindowSize = Size(360, 480);
const Size outgoingWindowSize = Size(440, 700);

Future<void> configureMainWindow() async {
  await windowManager.ensureInitialized();
  final windowOptions = WindowOptions(
    backgroundColor: Colors.transparent,
    alwaysOnTop: true,
    skipTaskbar: true,
    titleBarStyle: TitleBarStyle.hidden,
    windowButtonVisibility: false,
    size: defaultWindowSize,
    minimumSize: minimumWindowSize,
    title: AppConfig.name,
  );

  unawaited(
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setPreventClose(true);
      windowManager.addListener(OnCloseWindowListener());
      await windowManager.setResizable(false);
      if (Platform.isMacOS || Platform.isWindows) {
        await windowManager.setMinimizable(false);
        await windowManager.setMaximizable(false);
        await windowManager.setClosable(false);
        await windowManager.setHasShadow(false);
      }
      await windowManager.hide();
    }),
  );
}

Future<void> ensureWindowSizeAtLeast(Size targetSize) async {
  try {
    final currentSize = await windowManager.getSize();
    final nextSize = Size(
      currentSize.width < targetSize.width
          ? targetSize.width
          : currentSize.width,
      currentSize.height < targetSize.height
          ? targetSize.height
          : currentSize.height,
    );
    if (nextSize != currentSize) {
      await windowManager.setSize(nextSize);
    }
  } catch (e, s) {
    print('Failed to resize window for outgoing transfer: $e\n$s');
  }
}
