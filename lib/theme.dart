import 'package:flutter/material.dart';

import 'colors_const.dart';

ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: bluebright,
    error: Colors.red,
    onError: Colors.black,
    brightness: Brightness.light,
    primary: blueDark,
    secondary: semonDark,
    surface: Colors.white, // You can adjust this color as needed
    background: Colors.white, // You can adjust this color as needed
    onPrimary: Colors.white, // You can adjust this color as needed
    onSecondary: Colors.black, // You can adjust this color as needed
    onSurface: Colors.black, // You can adjust this color as needed
    onBackground: Colors.black, // You can adjust this color as needed
  ),
  textTheme: TextTheme(
    displayLarge:
        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: blueDark),
    displayMedium:
        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: blueDark),
    bodyLarge: TextStyle(fontSize: 16.0, color: blueDark),
    bodyMedium: TextStyle(fontSize: 14.0, color: blueDark),
    bodySmall: TextStyle(fontSize: 10, color: blueDark),
    // Add more text styles as needed
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.3,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    actionsIconTheme: IconThemeData(color: bluebright),
  ),
  useMaterial3: true,
);
