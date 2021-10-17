import 'dart:ui';

class Setting {
  bool? allowNotification;
  bool? allowNewsletter;
  Locale? language;

  Setting({this.allowNewsletter, this.allowNotification, this.language});

  Setting.fromJSON(Map<String, dynamic> json) {
    allowNotification = json["allowNotification"];
    allowNewsletter = json["allowNewsletter"];
    language = json["language"];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["allowNotification"] = this.allowNotification;
    data["allowNewsletter"] = this.allowNewsletter;
    data["language"] = this.language;

    return data;
  }
}
