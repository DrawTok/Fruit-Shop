import 'package:flutter/material.dart';
import 'package:fruitshop/utils/theme/text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Roboto',
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TCustomTextTheme.lightThemeText);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: Colors.black,
      textTheme: TCustomTextTheme.darkThemeText);
}
