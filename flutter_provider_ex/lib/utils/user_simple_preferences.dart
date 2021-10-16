import 'dart:convert';

import 'package:flutter_provider_ex/models/user_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;
  static const keyUserName = "username";
  static const keyUserList = "userlist";
  static List<String>? _userDetailList;
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static UserDetail getUser(String? idUser) {
    final json = _preferences.getString(idUser!);
    return UserDetail.fromJSON(jsonDecode(json!));
  }

  static Future setUser(UserDetail user) async {
    final json = jsonEncode(user.toJSON());
    final idUser = user.id;
    await _preferences.setString(idUser!, json);
  }

  static addUserIntoList(UserDetail user) {
    String json = jsonEncode(user);
    _userDetailList!.add(json);
  }

  static Future setListUser() async {
    await _preferences.setStringList(keyUserList, _userDetailList!);
  }

  static Future setUserName(String userName) async {
    await _preferences.setString(keyUserName, userName);
  }

  static String? getUserName() {
    return _preferences.getString(keyUserName);
  }
}
