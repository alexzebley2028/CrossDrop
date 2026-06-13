import 'dart:io';

import 'package:crossdrop/app/app.dart';
import 'package:crossdrop/app/file_paths.dart';
import 'package:crossdrop/app/mobile_app.dart';
import 'package:crossdrop/app/notification_actions.dart';
import 'package:crossdrop/app/window_setup.dart';
import 'package:crossdrop/app_theme.dart';
import 'package:crossdrop/logging_config.dart';
import 'package:crossdrop/nearby_share/manager/nearby_manager.dart';
import 'package:crossdrop/notifications.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLogging();

  final initialOutgoingFilePaths = filePathsFromArgs(args);
  final useMobileShell = Platform.isIOS || Platform.isAndroid;

  await initializeNotifications(handleNotificationResponse);
  if (!useMobileShell) {
    await configureMainWindow();
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NearbyConnectionManager()),
        ChangeNotifierProvider(create: (_) => AppTheme()),
      ],
      child: useMobileShell
          ? MobileApp(initialOutgoingFilePaths: initialOutgoingFilePaths)
          : App(initialOutgoingFilePaths: initialOutgoingFilePaths),
    ),
  );
}
