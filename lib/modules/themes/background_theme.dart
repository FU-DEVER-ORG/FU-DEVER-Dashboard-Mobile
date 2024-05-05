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
    visualDensity: VisualDensity.adaptivePlatformDensity,
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
      bodySmall: TextStyle(
        color:Colors.grey.shade400,
        fontSize: 12,
      ),
      labelSmall: TextStyle(
        color:Colors.blue,
        fontSize: 12,
      ),
    ),
    shadowColor: Colors.grey.shade100,
    iconTheme: IconThemeData(
      color: Colors.grey.shade400,
    )
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
