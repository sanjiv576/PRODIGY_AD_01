import '../constants/color_constants.dart';
import 'widget_themes/text_themes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static appLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      // useMaterial3: true,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: KColors.lightBgColor,
      textTheme: KTextThemes.lightTextThemes(),
    );
  }

  static appDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      // useMaterial3: true,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: KColors.darkBgColor,
      textTheme: KTextThemes.darkTextThemes(),
    );
  }
}
