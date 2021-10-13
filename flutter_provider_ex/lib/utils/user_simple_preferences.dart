import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;
  static const keyUserName = "username";
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setUserName(String userName) async {
    await _preferences.setString(keyUserName, userName);
  }

  static String? getUserName() {
    return _preferences.getString(keyUserName);
  }
}
