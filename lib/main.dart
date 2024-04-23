import 'package:flutter/material.dart';
import 'package:fudever_dashboard/presentation/screens/home/splash.dart';
import 'package:fudever_dashboard/presentation/widgets/background_theme.dart';

void main() {
  runApp(
    MaterialApp(
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    ),
  );
}
