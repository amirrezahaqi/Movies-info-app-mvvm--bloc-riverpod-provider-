import 'package:flutter/material.dart';

class MyThemesData {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,

      elevation: 1,
    ),
    colorScheme: ColorScheme.light(surface: Colors.black),
  );
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 1,
    ),
    colorScheme: ColorScheme.dark(surface: Colors.white),
  );
}
