
import '../constants/color_constants.dart';
import '../services/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../provider/is_dark_theme.dart';

class CalculatorView extends ConsumerStatefulWidget {
  const CalculatorView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends ConsumerState<CalculatorView> {
  final buttons = Calculator.allButtons;
  final themeIcon =
      WidgetStateProperty.resolveWith<Icon>((Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return const Icon((FontAwesomeIcons.moon));
    } else {
      return const Icon(Icons.sunny);
    }
  });
  final SizedBox _verticalGap = const SizedBox(height: 16);

  void _onCustomTap(index, ref) {
 
    Calculator.buttonPress(index, ref);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(isDarkThemeProvider);
    String pressingNumber = ref.watch(pressingNumberProvider);
    double calcualtionResult = ref.watch(resultProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.center,
                child: Switch(
                  value: ref.watch(isDarkThemeProvider),
                  thumbIcon: themeIcon,
                  onChanged: (bool value) {
                    ref.watch(isDarkThemeProvider.notifier).updateTheme(value);
                  },
                ),
              ),
              _verticalGap,
              Text(
                pressingNumber == '' ? '0' : pressingNumber,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: KColors.darkMediumEmphasisColor),
              ),
              _verticalGap,
              Text(
                '= $calcualtionResult',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              _verticalGap,
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: List.generate(20, (index) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        backgroundColor: index % 4 == 3
                            ? KColors
                                .highEmphasisBlueColor // always blue color to operands
                            : isDark
                                ? KColors
                                    .darkMediumEmphasisColor // change bg color according to theme
                                : KColors.lightMediumEmphasisColor,
                        elevation: 0,
                      ),
                      onPressed: () {
                        _onCustomTap(index, ref);
                      },
                      child: Center(
                        child: Builder(builder: (context) {
                          if (index == 1 || index == 18) {
                            return buttons[index];
                          }
                          return Text(
                            buttons[index].toString(),
                            style: index % 4 == 3
                                ? Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: KColors.darkTextColor)
                                : Theme.of(context).textTheme.titleMedium,
                          );
                        }),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
