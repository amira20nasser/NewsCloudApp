import 'package:flutter/material.dart';

import 'colors_const.dart';

ThemeData theme = ThemeData(
  iconTheme: IconThemeData(
    color: yankeesBlue,
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: bluebright,
    error: Colors.red,
    onError: Colors.black,
    brightness: Brightness.light,
    primary: yankeesBlue,
    secondary: semonDark,
    surface: Colors.white, // You can adjust this color as needed
    background: Colors.white, // You can adjust this color as needed
    onPrimary: Colors.white, // You can adjust this color as needed
    onSecondary: Colors.black, // You can adjust this color as needed
    onSurface: Colors.black, // You can adjust this color as needed
    onBackground: Colors.black, // You can adjust this color as needed
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.bold, color: yankeesBlue),
    displayMedium: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold, color: yankeesBlue),
    bodyLarge: TextStyle(fontSize: 16.0, color: yankeesBlue),
    bodyMedium: TextStyle(fontSize: 14.0, color: yankeesBlue),
    bodySmall: TextStyle(fontSize: 10, color: yankeesBlue),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      height: 1.25,
    ),
    // Add more text styles as needed
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    actionsIconTheme: IconThemeData(color: bluebright),
    iconTheme: IconThemeData(
      color: yankeesBlue,
    ),
  ),
  useMaterial3: true,
);
