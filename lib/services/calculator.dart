
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pressingNumberProvider = StateProvider<String>((ref) {
  return Calculator.numbers;
});

final resultProvider =
    StateProvider<double>((ref) => Calculator.calculationResult);

class Calculator {
  static String numbers = '';

  static double _firstOperands = 0;
  static double _lastOperands = 0;
  static String _operator = '';

  static double calculationResult = 0.0;
  static List<dynamic> allButtons = [
    'C',
    const Icon(Icons.undo_outlined),
    '%',
    '÷',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '.',
    '0',
    const Icon(Icons.backspace_outlined),
    '=',
  ];

  static void _calculate(ref) {
    _lastOperands = double.parse(ref.watch(pressingNumberProvider));

    if (_operator == '+') {
      calculationResult = (_firstOperands + _lastOperands);
    } else if (_operator == '-') {
      calculationResult = (_firstOperands - _lastOperands);
    } else if (_operator == 'x') {
      calculationResult = (_firstOperands * _lastOperands);
    } else if (_operator == '÷') {
      calculationResult = (_firstOperands / _lastOperands);
    }

    ref.watch(resultProvider.notifier).state = calculationResult;
  }

  static void buttonPress(int index, WidgetRef ref) {
    if (index == 1) {
      return;
    }

    // press backspace
    else if (index == 18) {
      ref.watch(pressingNumberProvider.notifier).state = ref
          .watch(pressingNumberProvider)
          .substring(0, ref.watch(pressingNumberProvider).length - 1);
      return;
    }

    if (allButtons[index] == '÷' ||
        allButtons[index] == 'x' ||
        allButtons[index] == '+' ||
        allButtons[index] == '-') {
      _operator = allButtons[index];
      _firstOperands = double.parse(ref.watch(pressingNumberProvider));

      ref.watch(pressingNumberProvider.notifier).state = '';

    } else if (allButtons[index] == '=') {
      // calculate result
      _calculate(ref);
    } else if (allButtons[index] == 'C') {
      _clearAll(ref);
    } else if (allButtons[index] == '%') {
      _firstOperands = double.parse(ref.watch(pressingNumberProvider));

      ref.watch(resultProvider.notifier).state = _firstOperands / 100;
    }
    // press numbers and .
    else {
      ref.watch(pressingNumberProvider.notifier).state += allButtons[index];
    }
  }

  static void _clearAll(ref) {
    ref.watch(pressingNumberProvider.notifier).state = '';
    ref.watch(resultProvider.notifier).state = 0.0;
    _firstOperands = 0.0;
    _lastOperands = 0.0;
    _operator = '';
    calculationResult = 0.0;
  }

}
