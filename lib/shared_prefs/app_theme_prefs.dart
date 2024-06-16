import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../failure/failure.dart';

final appThemePrefsProvider = Provider((ref) => AppThemePrefs());

class AppThemePrefs {
  late SharedPreferences _sharedPreferences;

  // set dark theme
  Future<Either<Failure, bool>> setTheme(bool value) async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();

      _sharedPreferences.setBool('isDarkTheme', value);
      return const Right(true);
    } catch (err) {
      return Left(Failure(error: 'Failed to set theme.'));
    }
  }

  // get dark theme

  Future<Either<Failure, bool>> getTheme() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();

      bool darkValue = _sharedPreferences.getBool('isDarkTheme') ?? false;
      return Right(darkValue);
    } catch (err) {
      return Left(Failure(error: 'Failed to get theme.'));
    }
  }
}
