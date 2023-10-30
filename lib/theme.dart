import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    background: Colors.white,
    onBackground: Color.fromRGBO(240, 240, 240, 1),
    surface: Color.fromRGBO(173, 173, 173, 1),
    // Works as inverse color, as for slider dots
    inverseSurface: Color.fromRGBO(11, 11, 11, 1),
    // For circular icon buttons
    surfaceVariant: Color.fromRGBO(47, 47, 47, 1),
    primary: Color.fromRGBO(61, 232, 202, 1),
    secondary: Color.fromRGBO(135, 95, 250, 1),
    tertiary: Color.fromRGBO(252, 213, 56, 1),
    error: Color.fromRGBO(252, 56, 56, 1),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
  ),
  useMaterial3: true,
);

final darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    background: Color.fromRGBO(11, 11, 11, 1),
    onBackground: Color.fromRGBO(34, 30, 34, 1),
    surface: Color.fromRGBO(114, 114, 114, 1),
    // Works as inverse color, as for slider dots
    inverseSurface: Colors.white,
    // For circular icon buttons
    surfaceVariant: Color.fromRGBO(47, 47, 47, 1),
    primary: Color.fromRGBO(61, 232, 202, 1),
    secondary: Color.fromRGBO(135, 95, 250, 1),
    tertiary: Color.fromRGBO(252, 213, 56, 1),
    error: Color.fromRGBO(252, 56, 56, 1),
  ),
  useMaterial3: true,
);
