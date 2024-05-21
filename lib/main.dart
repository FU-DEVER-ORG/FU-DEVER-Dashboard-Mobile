import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fudever_dashboard/models/login_request/login_request.dart';
import 'package:fudever_dashboard/routes/routes.dart';
import 'package:fudever_dashboard/modules/themes/background_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/token_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // String? token = prefs.getString('admin_token');

  // const FlutterSecureStorage storage = FlutterSecureStorage();
  // token = await storage.read(key: 'admin_token');
  // final String? token1 = UserModel().token;

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(tokenProvider);
    return MaterialApp(
      theme: getLightTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => Routes.generateRoutes(settings, token),
      initialRoute: 'splash',
      builder: EasyLoading.init(),
    );
  }
}
