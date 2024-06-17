import 'package:calculator/view/splash_view.dart';

import '../view/calculator_view.dart';

class AppRoutes {
  AppRoutes._();

  static const String homeRoute = '/';
  static const String splashRoute = '/splash';

  static getAppRoutes() {
    return {
      homeRoute: (context) => const CalculatorView(),
      splashRoute: (context) => const SplashView(),
    };
  }
}
