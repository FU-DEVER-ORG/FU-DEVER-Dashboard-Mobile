import 'package:flutter/material.dart';
import 'package:fudever_dashboard/layouts/auth_layout.dart';
import 'package:fudever_dashboard/modules/screens/auth/forgot_pass.dart';
import 'package:fudever_dashboard/modules/screens/auth/login.dart';
import 'package:fudever_dashboard/modules/screens/auth/signup.dart';
import 'package:fudever_dashboard/modules/screens/home/activity.dart';
import 'package:fudever_dashboard/modules/screens/home/home.dart';
import 'package:fudever_dashboard/modules/screens/home/leader_board.dart';
import 'package:fudever_dashboard/modules/screens/home/splash.dart';
import 'package:fudever_dashboard/modules/screens/members/test.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings, String? token) {
    switch (settings.name) {
      case '/':
        final args = settings.arguments;
        return MaterialPageRoute(builder: (_) {
          return HomeScreen(arguments: args);
        });
      case 'activity':
        final args = settings.arguments;
        return MaterialPageRoute(builder: (_) {
          return ActivityScreen(arguments: args);
        });
      case 'splash':
        return MaterialPageRoute(builder: (_) {
          return const Splash();
        });
      case 'login':
        return MaterialPageRoute(builder: (context) {
          return AuthLayout(
            body: const Login(),
            title: "Đăng nhập",
            trailing: Login.trailing(context),
          );
        });
      case 'signup':
        return MaterialPageRoute(builder: (context) {
          return AuthLayout(
            body: const Signup(),
            title: "Đăng ký tài khoản",
            trailing: Signup.trailing(context),
          );
        });
      case 'forgot-password':
        return MaterialPageRoute(builder: (context) {
          return AuthLayout(
            body: const ForgotPassword(),
            title: "Quên mật khẩu",
            trailing: ForgotPassword.trailing(context),
          );
        });
      case 'testing':
        return MaterialPageRoute(builder: (_) {
          return LeaderBoard();
        });
      default:
        return MaterialPageRoute(builder: (_) {
          return const Center(
            child: Text("Error Page"),
          );
        });
    }
  }
}
