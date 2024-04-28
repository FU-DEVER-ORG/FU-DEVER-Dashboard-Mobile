import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudever_dashboard/presentation/layouts/auth_layout.dart';
import 'package:fudever_dashboard/presentation/layouts/default_layout.dart';
import 'package:fudever_dashboard/presentation/screens/auth/forgot_pass.dart';
import 'package:fudever_dashboard/presentation/screens/auth/login.dart';
import 'package:fudever_dashboard/presentation/screens/auth/signup.dart';
import 'package:fudever_dashboard/presentation/screens/home/home.dart';
import 'package:fudever_dashboard/presentation/screens/home/splash.dart';
import 'package:fudever_dashboard/presentation/screens/members/profile.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) {
          return HomeScreen();
        });
      case 'splash':
        return MaterialPageRoute(builder: (_) {
          return Splash();
        });
      case 'login':
        return MaterialPageRoute(builder: (_) {
          return AuthLayout(
            body: Login(),
            title: "Đăng nhập",
          );
        });
      case 'signup':
        return MaterialPageRoute(builder: (_) {
          return AuthLayout(
            body: Signup(),
            title: "Đăng ký tài khoản",
          );
        });
      case 'forgot-password':
        return MaterialPageRoute(builder: (_) {
          return AuthLayout(
            body: ForgotPassword(),
            title: "Quên mật khẩu",
          );
        });
      case 'profile':
        return MaterialPageRoute(builder: (_) {
          return DefaultLayout(body: ProfileScreen());
        });
      default:
        return MaterialPageRoute(builder: (_) {
          return Center(
            child: Text("Error Page"),
          );
        });
    }
  }
}
