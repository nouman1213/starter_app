// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/app_model/user_register.dart';
import 'package:starter_app/app_provider/user_privider.dart';
import '../utils/globals.dart' as globals;
import '../utils/routes/routes_name.dart';

class SplashRepo {
  Future<UserModel> getUserDate() => UserProvider().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserDate().then((value) async {
      print(value.token.toString());
      print(value.id.toString());

      if (value.token.toString() == 'null' || value.token.toString() == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
