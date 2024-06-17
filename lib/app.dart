import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider/is_dark_theme.dart';
import 'routes/app_routes.dart';
import 'themes/app_theme.dart';

class AppView extends ConsumerWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDark = ref.watch(isDarkThemeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? AppTheme.appDarkTheme() : AppTheme.appLightTheme(),
      initialRoute: AppRoutes.splashRoute,
      routes: AppRoutes.getAppRoutes(),
    );
  }
}
