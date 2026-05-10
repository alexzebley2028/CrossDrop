import 'package:flutter/material.dart';

const Color appThemeSeedColor = Color.fromRGBO(13, 85, 201, 1.0);

class AppTheme extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;
  set mode(ThemeMode mode) {
    _mode = mode;
    notifyListeners();
  }
}
