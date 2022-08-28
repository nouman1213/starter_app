import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/utils/routes/routes_name.dart';

import '../../screens/home_screen.dart';
import '../../screens/login_screen.dart';
import '../../screens/signp_screen.dart';
import '../../screens/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScren());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  SignUpScreen(data: settings.arguments as Map,));

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
