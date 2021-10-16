class UserDetail {
  String? id;
  String? displayName;
  String? email;
  String? photoURL;

  UserDetail({this.id, this.displayName, this.email, this.photoURL});

  UserDetail.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    displayName = json["displayName"];
    email = json["email"];
    photoURL = json["photoURL"];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["displayName"] = this.displayName;
    data["email"] = this.email;
    data["photoURL"] = this.photoURL;

    return data;
  }
}
