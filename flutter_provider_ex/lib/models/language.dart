class Language {
  int? id;
  String? name;
  String? languageCode;
  String? imagePath;

  Language(this.id, this.name, this.languageCode, this.imagePath);

  Language.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    languageCode = json["languageCode"];
    imagePath = json["imagePath"];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["languageCode"] = this.languageCode;
    data["imagePath"] = this.imagePath;
    return data;
  }
}
