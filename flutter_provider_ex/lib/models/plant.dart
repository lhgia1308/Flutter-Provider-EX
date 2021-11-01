class Plant {
  int? id;
  String? name;
  String? image;
  String? country;
  double? price;

  Plant({this.id, this.name, this.image, this.country, this.price});

  Plant.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    country = json["country"];
    price = json["price"];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["image"] = this.image;
    data["country"] = this.country;
    data["price"] = this.price;
    return data;
  }
}
