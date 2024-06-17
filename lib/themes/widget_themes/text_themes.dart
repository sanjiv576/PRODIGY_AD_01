import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class KTextThemes {
  static TextTheme lightTextThemes() {
    return const TextTheme(
      titleLarge: TextStyle(
        fontSize: 45,
        letterSpacing: 1.5,
        color: KColors.lightTextColor,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: TextStyle(
        fontSize: 32,
        letterSpacing: 1.5,
        color: KColors.lightTextColor,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        fontSize: 24,
        letterSpacing: 1.5,
        color: KColors.lightTextColor,
        fontWeight: FontWeight.normal,
      ),
      labelMedium: TextStyle(
        fontSize: 20,
        letterSpacing: 1.5,
        color: KColors.lightTextColor,
        fontWeight: FontWeight.normal,
      ),
      labelSmall: TextStyle(
        fontSize: 18,
        letterSpacing: 1.5,
        color: KColors.lightTextColor,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextTheme darkTextThemes() {
    return const TextTheme(
      titleLarge: TextStyle(
        fontSize: 45,
        letterSpacing: 1.5,
        color: KColors.darkTextColor,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: TextStyle(
        fontSize: 32,
        letterSpacing: 1.5,
        color: KColors.darkTextColor,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        fontSize: 24,
        letterSpacing: 1.5,
        color: KColors.darkTextColor,
        fontWeight: FontWeight.normal,
      ),
      labelMedium: TextStyle(
        fontSize: 20,
        letterSpacing: 1.5,
        color: KColors.darkTextColor,
        fontWeight: FontWeight.normal,
      ),
      labelSmall: TextStyle(
        fontSize: 18,
        letterSpacing: 1.5,
        color: KColors.darkTextColor,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
