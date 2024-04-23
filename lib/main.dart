import 'package:flutter/material.dart';
import 'package:fudever_dashboard/presentation/routes/routes.dart';
import 'package:fudever_dashboard/presentation/themes/background_theme.dart';

void main() {
  runApp(
    MaterialApp(
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => Routes.generateRoutes(settings),
      initialRoute: 'splash',
    ),
  );
}
