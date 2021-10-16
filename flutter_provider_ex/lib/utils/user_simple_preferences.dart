import 'dart:convert';

import 'package:flutter_provider_ex/models/user_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;
  static const keyUserName = "username";
  static const keyUserList = "userlist";

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

  static addUsers(UserDetail user) async {
    final idUsers = _preferences.getStringList(keyUserList) ?? <String>[];
    List<String> newIdUsers = [];
    if (!idUsers.contains(user.id)) {
      newIdUsers = List.of(idUsers)..add(user.id!);
    }
    await _preferences.setStringList(keyUserList, newIdUsers);
  }

  static List<UserDetail> getUsers() {
    final idUsers = _preferences.getStringList(keyUserList);
    if (idUsers == null) {
      return <UserDetail>[];
    } else {
      return idUsers.map<UserDetail>(getUser).toList();
    }
  }

  static Future removeAll() async {
    await _preferences.remove(keyUserList);
  }

  static Future setUserName(String userName) async {
    await _preferences.setString(keyUserName, userName);
  }

  static String? getUserName() {
    return _preferences.getString(keyUserName);
  }
}
