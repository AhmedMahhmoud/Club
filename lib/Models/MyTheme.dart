import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "../Widgets/globalFile.dart";

class MyTheme with ChangeNotifier {
  bool isDark = true;
  ThemeMode currentTheme() {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
