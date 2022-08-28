import 'package:shared_preferences/shared_preferences.dart';

class Sharedpref {
  String token = '';
  String id = 'id';

  setToken(
    String key,
    String value,
  ) async {
    final pref = await SharedPreferences.getInstance(); 
    await pref.setString(
      key,
      value,
    );
  }

  removeToken() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(id);
    await pref.remove(token);
   
  }

  Future<String> getToken(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? '';
  }

//..................................
  setLanguage(String lang) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString('lang', lang);
  }

  removeLanguage() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('lang');
  }

  Future<String> getLanguage() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('lang') ?? '';
  }

//....................................

  //.......................................

}