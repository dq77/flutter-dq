import 'package:shared_preferences/shared_preferences.dart';

/// sharedPreferences 本地存储
class LocalStorage {


  static save (String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }


  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(' $key ${prefs.get(key)}');
    return prefs.get(key);
  }


  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }


}