

import 'package:flutter/material.dart';

import "theme.dart";


class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  // getter themeData
  ThemeData get themeData => _themeData;

  // darkMode enabled ?
  bool get darkModeEnabled => _themeData == darkMode;

  // setter for themeData
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // toggle theme
  void toggleTheme() {
    themeData = darkModeEnabled ? lightMode : darkMode;
  }
}