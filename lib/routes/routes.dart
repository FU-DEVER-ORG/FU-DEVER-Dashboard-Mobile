import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudever_dashboard/layouts/auth_layout.dart';
import 'package:fudever_dashboard/layouts/default_layout.dart';
import 'package:fudever_dashboard/modules/screens/auth/forgot_pass.dart';
import 'package:fudever_dashboard/modules/screens/auth/login.dart';
import 'package:fudever_dashboard/modules/screens/auth/signup.dart';
import 'package:fudever_dashboard/modules/screens/home/home.dart';
import 'package:fudever_dashboard/modules/screens/home/splash.dart';
import 'package:fudever_dashboard/modules/screens/profile/password/change_password.dart';
import 'package:fudever_dashboard/modules/screens/profile/skills/skill.dart';
import 'package:fudever_dashboard/modules/screens/members/test.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings, String token) {
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
        return MaterialPageRoute(builder: (_) {
          return const HomeScreen();
        });
      case 'splash':
        return MaterialPageRoute(builder: (_) {
          return const Splash();
        });
      case 'login':
        return MaterialPageRoute(builder: (context) {
          return AuthLayout(
            body: Login(),
            title: "Đăng nhập",
            trailing: Login.trailing(context),
          );
        });
      case 'signup':
        return MaterialPageRoute(builder: (context) {
          return AuthLayout(
            body: Signup(),
            title: "Đăng ký tài khoản",
            trailing: Signup.trailing(context),
          );
        });
      case 'forgot-password':
        return MaterialPageRoute(builder: (context) {
          return AuthLayout(
            body: ForgotPassword(),
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
      // case 'profile':
      //   return MaterialPageRoute(builder: (_) {
      //     return DefaultLayout(body: ProfileScreen());
      //   });
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
