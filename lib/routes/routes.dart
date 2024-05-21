import 'package:flutter/material.dart';
import 'package:fudever_dashboard/layouts/auth_layout.dart';
import 'package:fudever_dashboard/models/login_request/login_request.dart';
import 'package:fudever_dashboard/modules/screens/auth/forgot_pass.dart';
import 'package:fudever_dashboard/modules/screens/auth/login.dart';
import 'package:fudever_dashboard/modules/screens/auth/signup.dart';
import 'package:fudever_dashboard/modules/screens/home/home.dart';
import 'package:fudever_dashboard/modules/screens/home/splash.dart';
import 'package:fudever_dashboard/modules/screens/members/test.dart';

import '../layouts/default_layout.dart';
import '../modules/screens/profile/profile_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings, token) {
    // if(JwtDecoder.isExpired(token)){
    //   return MaterialPageRoute(builder: (_) {
    //     return AuthLayout(
    //       body: Login(),
    //       title: "Đăng nhập",
    //     );
    //   });
    // }
    switch (settings.name) {
      case '/':
        final args = settings.arguments;
        return MaterialPageRoute(builder: (_) {
          String? token = UserModel().token;

          return HomeScreen(
            arguments: args,
            token: token.toString(),
          );
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
      // case 'change-password':
      //   return MaterialPageRoute(builder: (_) {
      //     return ChangePassword();
      //   });
      // case 'skills':
      //   return MaterialPageRoute(builder: (_) {
      //     return Skills();
      //   });
      case 'profile':
        return MaterialPageRoute(builder: (_) {
          String? token = UserModel().token;
          return DefaultLayout(
            body: ProfileScreen(
              token: token.toString(),
            ),
          );
        });
      case 'testing':
        return MaterialPageRoute(builder: (_) {
          return const Testing();
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
