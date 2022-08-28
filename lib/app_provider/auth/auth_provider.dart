import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:starter_app/app_model/user_register.dart';
import 'package:starter_app/app_provider/user_privider.dart';
import 'package:starter_app/app_repository/auth_repository/auth_repo.dart';
import 'package:starter_app/utils/shared_prefs.dart';

import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';

class AuthProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final _authRepo = AuthRepo();

  //signUpApi Function

  Future<void> registerUserApi(dynamic bodyData, BuildContext context) async {
    setLoading(true);
    _authRepo.registerUser(bodyData).then((value) {
      final userPreference = Provider.of<UserProvider>(context, listen: false);
      userPreference.saveUser(UserModel(
          token: value['token'].toString(), id: value['id'].toString()));
      setLoading(false);

      //Utils.toastMessage('successfuly');
      Navigator.pushNamed(context, RoutesName.home);
      Utils.flushBarErrorMessage('Register successfuly', context);

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  // login method
  Future<void> loginUserApi(dynamic bodyData, BuildContext context) async {
    setLoading(true);
    _authRepo.registerUser(bodyData).then((value) {
      setLoading(false);

      Navigator.pushNamed(context, RoutesName.home);
      Utils.flushBarErrorMessage('Login successfuly', context);

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  // Future<bool> saveUser(UserRegisterModel user) async {
  //   Sharedpref().setToken(Sharedpref().token, user.token.toString());
  //   notifyListeners();
  //   return true;
  // }
  //   Future<UserRegisterModel> getUser() async {
  //    String token= await Sharedpref().getToken(Sharedpref().token);

  //   return UserRegisterModel(token: token.toString());
  // }
}
