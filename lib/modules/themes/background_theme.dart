import 'package:flutter/material.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(1, 37, 74, 122),
  brightness: Brightness.light,
  background: Colors.white,
);
final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(1, 37, 74, 122),
);

ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: kColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: Colors.blue,
      foregroundColor: kColorScheme.primaryContainer,
    ),
    cardTheme: const CardTheme().copyWith(
      color: kColorScheme.background,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
    ),
    textTheme: ThemeData().textTheme.copyWith(
      titleLarge: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 18,
      ),
    ),

  );
}

ThemeData getDarkTheme() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: kDarkColorScheme,
    cardTheme: const CardTheme().copyWith(
      color: kDarkColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kDarkColorScheme.primaryContainer,
        foregroundColor: kDarkColorScheme.onPrimaryContainer,
      ),
    ),
  );
}
