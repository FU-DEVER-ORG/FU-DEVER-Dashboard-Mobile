import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudever_dashboard/routes/routes.dart';
import 'package:fudever_dashboard/modules/themes/background_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: getLightTheme(),
        // darkTheme: getDarkTheme(),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) =>
            Routes.generateRoutes(settings, token ?? ''),
        initialRoute: 'splash',
        builder: EasyLoading.init(),
      ),
    ),
  );
}
