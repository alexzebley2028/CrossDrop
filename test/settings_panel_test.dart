import 'dart:async';

import 'package:crossdrop/app/widgets/settings_panel.dart';
import 'package:crossdrop/app_theme.dart';
import 'package:crossdrop/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets(
    'settings sheet opens via a navigator-key context (no MaterialLocalizations crash)',
    (tester) async {
      final settings = SettingsController();
      final theme = AppTheme();
      await settings.load();
      await theme.load();

      final navKey = GlobalKey<NavigatorState>();

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: settings),
            ChangeNotifierProvider.value(value: theme),
          ],
          child: MaterialApp(
            navigatorKey: navKey,
            home: const Scaffold(body: Text('home')),
          ),
        ),
      );

      // Reproduces the real call site: a context below the MaterialApp, taken
      // from the navigator key rather than a State.context above it.
      unawaited(showSettingsSheet(navKey.currentContext!));
      await tester.pumpAndSettle();

      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('VISIBILITY'), findsOneWidget);
      expect(find.text('Everyone'), findsOneWidget);
      // The device-name editor now lives in the settings panel.
      expect(find.text('DEVICE NAME'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    },
  );
}
