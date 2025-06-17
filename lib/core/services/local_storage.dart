import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences ? _pref;

  static init() async{
    _pref = await SharedPreferences.getInstance();
  }

  static bool? getBool({required String key}) {
    return _pref!.getBool(key);
  }

 static Future<void> setBool({
    required String key,
    required bool value,
})async {
    await _pref!.setBool(key, value);
  }


  static String? getString({required String key}) {
    return _pref!.getString(key);
  }

  static Future<void> setString({
    required String key,
    required dynamic value,
  })async {
    await _pref!.setString(key, value);
  }
}

