import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../provider/is_dark_theme.dart';

enum ThemeStatus {
  dark,
  light,
}

class CalculatorView extends ConsumerStatefulWidget {
  const CalculatorView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends ConsumerState<CalculatorView> {
  final themeIcon =
      WidgetStateProperty.resolveWith<Icon>((Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return const Icon((FontAwesomeIcons.moon));
    } else {
      return const Icon(Icons.sunny);
    }
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Switch(
                value: ref.watch(isDarkThemeProvider),
                thumbIcon: themeIcon,
                onChanged: (bool value) {
                  ref.watch(isDarkThemeProvider.notifier).updateTheme(value);
                })
          ],
        ),
      ),
    );
  }
}
