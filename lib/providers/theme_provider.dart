import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _theme = false;
  bool get theme => _theme;
  void thememode() {
    _theme = !_theme;
    notifyListeners();
  }
}
