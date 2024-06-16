import 'routes/app_routes.dart';
import 'themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppView extends ConsumerWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appLightTheme(),
      initialRoute: AppRoutes.homeRoute,
      routes: AppRoutes.getAppRoutes(),
    );
  }
}
