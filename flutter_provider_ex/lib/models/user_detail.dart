class UserDetail {
  String? displayName;
  String? email;
  String? photoURL;

  UserDetail({this.displayName, this.email, this.photoURL});

  UserDetail.fromJSON(Map<String, dynamic> json) {
    displayName = json["displayName"];
    email = json["email"];
    photoURL = json["photoURL"];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["displayName"] = this.displayName;
    data["email"] = this.email;
    data["photoURL"] = this.photoURL;

    return data;
  }
}
