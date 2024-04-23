import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudever_dashboard/presentation/layouts/default_layout.dart';
import 'package:fudever_dashboard/presentation/screens/home/home.dart';
import 'package:fudever_dashboard/presentation/screens/home/splash.dart';
import 'package:fudever_dashboard/presentation/screens/members/profile.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings){
    switch (settings.name){
      case '/':
        return MaterialPageRoute(builder: (_){
          return DefaultLayout(body:HomeScreen());
        });
      case 'splash':
        return MaterialPageRoute(builder: (_){
          return Splash();
        });
      case 'profile':
        return MaterialPageRoute(builder: (_){
          return DefaultLayout(body:ProfileScreen());
        });
      default :
        return MaterialPageRoute(builder: (_){
          return Center(
            child: Text("Error Page"),
          );
        });
    }
  }
}