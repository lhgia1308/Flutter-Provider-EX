import 'package:flutter_provider_ex/models/language.dart';

class Setting {
  bool? allowNotification;
  bool? allowNewsletter;
  Language? language;

  Setting({this.allowNewsletter, this.allowNotification, this.language});

  Setting.fromJSON(Map<String, dynamic> json) {
    allowNotification = json["allowNotification"];
    allowNewsletter = json["allowNewsletter"];
    language = Language.fromJSON(json["language"]);
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["allowNotification"] = this.allowNotification;
    data["allowNewsletter"] = this.allowNewsletter;
    data["language"] = this.language!.toJSON();
    return data;
  }
}
