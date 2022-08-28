import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_app/utils/shared_prefs.dart';

import '../app_model/user_register.dart';

class UserProvider with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    sp.setString('id', user.id.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    final String? id = sp.getString('id');

    return UserModel(token: token.toString(),id: id);
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
  // Future<bool> saveUser(UserModel user) async {
  //   Sharedpref().setToken(Sharedpref().token, user.token.toString());

  //   notifyListeners();
  //   return true;
  // }

  // Future<UserModel> getUser() async {
  //   var token = Sharedpref().getToken(Sharedpref().token);

  //   return UserModel(token: token.toString());
  // }

  // Future<bool> remove() async {
  //   Sharedpref().removeToken();
  //   return true;
  // }

}
