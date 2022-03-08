import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/themes/themes.dart';

class ThemeManager with ChangeNotifier {
  ThemeData _themeData = lightTheme;
  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    if (_themeData.brightness == Brightness.light) {
      _themeData = darkTheme;
      notifyListeners();
    } else {
      _themeData = lightTheme;
      notifyListeners();
    }
  }
}
