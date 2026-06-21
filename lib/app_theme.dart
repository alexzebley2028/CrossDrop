import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color appThemeSeedColor = Color.fromRGBO(13, 85, 201, 1.0);

/// Holds the active [ThemeMode] and persists the user's choice.
class AppTheme extends ChangeNotifier {
  static const String _kThemeMode = 'themeMode';

  ThemeMode _mode = ThemeMode.system;
  SharedPreferences? _prefs;

  ThemeMode get mode => _mode;

  set mode(ThemeMode mode) {
    if (_mode == mode) return;
    _mode = mode;
    unawaited(_persist());
    notifyListeners();
  }

  /// Loads the persisted theme mode. Safe to call once during startup.
  Future<void> load() async {
    final prefs = _prefs = await SharedPreferences.getInstance();
    _mode = _modeFromStorage(prefs.getString(_kThemeMode));
    notifyListeners();
  }

  Future<void> _persist() async {
    final prefs = _prefs ??= await SharedPreferences.getInstance();
    await prefs.setString(_kThemeMode, _mode.name);
  }

  static ThemeMode _modeFromStorage(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }
}
