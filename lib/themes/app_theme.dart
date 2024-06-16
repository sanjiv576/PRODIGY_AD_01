import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import 'widget_themes/text_themes.dart';

class AppTheme {
  static appLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      // useMaterial3: true,
      fontFamily: 'Work Sans',
      scaffoldBackgroundColor: KColors.lightBgColor,
      textTheme: KTextThemes.lightTextThemes(),
    );
  }

  static appDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      // useMaterial3: true,
      fontFamily: 'Work Sans',
      scaffoldBackgroundColor: KColors.darkBgColor,
      textTheme: KTextThemes.darkTextThemes(),
    );
  }
}
