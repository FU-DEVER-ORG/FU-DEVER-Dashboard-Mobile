import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudever_dashboard/routes/routes.dart';
import 'package:fudever_dashboard/modules/themes/background_theme.dart';
import 'package:riverpod/src/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules/screens/auth/login.dart';

final tokenProvider = StateProvider<String?>((ref) => null);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      ProviderScope(
        child: MaterialApp(
          restorationScopeId: 'app',
          theme: getLightTheme(),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) =>
              Routes.generateRoutes(settings, token ?? ''),
          initialRoute: token == null ? 'splash' : '/',
          builder: EasyLoading.init(),
        ),
      ),
    );
  });

}
