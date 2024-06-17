import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared_prefs/app_theme_prefs.dart';

final isDarkThemeProvider = StateNotifierProvider<IsDarkTheme, bool>(
    (ref) => IsDarkTheme(ref.watch(appThemePrefsProvider)));

class IsDarkTheme extends StateNotifier<bool> {
  AppThemePrefs appThemePrefs;

  IsDarkTheme(this.appThemePrefs) : super(false) {
    onInit();
  }

  onInit() async {
    final isDark = await appThemePrefs.getTheme();

    isDark.fold((f) => state = false, (r) => state = r);
  }

  updateTheme(bool isDarkTheme) {
    appThemePrefs.setTheme(isDarkTheme);
    state = isDarkTheme;
  }
}
