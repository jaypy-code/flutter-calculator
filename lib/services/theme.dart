import 'package:calc/database/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeProvider with ChangeNotifier {
  bool _ltr = true;
  ThemeData _theme;
  ThemeData data() => _theme;
  bool isLtr() => _ltr;

  ThemeProvider() {
    _theme = themes['blue'];
    _ltr = true;
    _setSystemColor();
    notifyListeners();
  }

  void setThemeByName(String name) {
    ThemeData themeData = themes[name];
    if (themeData != null) {
      _theme = themeData;
      _setSystemColor();
      notifyListeners();
    }
  }

  void _setSystemColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: _theme.primaryColor,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: _theme.primaryColor,
      statusBarBrightness: Brightness.light,
    ));
  }

  void changePosition() {
    _ltr = !_ltr;
    notifyListeners();
  }
}
