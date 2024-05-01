import 'package:flutter/material.dart';
import 'package:fudever_dashboard/routes/routes.dart';
import 'package:fudever_dashboard/modules/themes/background_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // String? token = prefs.getString('token');
  runApp(
    MaterialApp(
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => Routes.generateRoutes(settings, ''),
      initialRoute: 'splash',
    ),
  );
}
