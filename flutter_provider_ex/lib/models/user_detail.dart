import 'package:flutter_provider_ex/models/setting.dart';

class UserDetail {
  String? id;
  String? displayName;
  String? email;
  String? photoURL;
  DateTime? birthday;
  List<String>? pets;
  Setting? setting;

  UserDetail({
    this.id,
    this.displayName,
    this.email,
    this.photoURL,
    this.birthday,
    this.pets,
    this.setting,
  });

  UserDetail.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    displayName = json["displayName"];
    email = json["email"];
    photoURL = json["photoURL"];
    birthday = DateTime.tryParse(json["birthday"]);
    pets = List<String>.from(json["pets"]);
    setting = Setting.fromJSON(json["setting"]);
    // pets = List<String>.from(json["pets"]);
    // birthday = DateTime.tryParse(json["birthday"]);
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["displayName"] = this.displayName;
    data["email"] = this.email;
    data["photoURL"] = this.photoURL;
    data["birthday"] = this.birthday?.toIso8601String();
    data["pets"] = this.pets;
    data["setting"] = this.setting!.toJSON();

    return data;
  }
}
