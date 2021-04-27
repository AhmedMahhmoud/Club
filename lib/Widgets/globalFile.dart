library config.globals;

import 'package:demo_club/Models/MyTheme.dart';
import 'package:flutter/material.dart';

MyTheme currentTheme = MyTheme();
highlightColor(BuildContext context) {
  return Theme.of(context).highlightColor;
}
