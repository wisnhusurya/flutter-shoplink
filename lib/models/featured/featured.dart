class Featured {
  final String image;
  final String name;
  final String price;
  final String id;

  Featured(this.image, this.name, this.price, this.id);

  Featured.fromJson(Map<String, dynamic> json)
      : image = json["image"],
        name = json["name"],
        price = json["price"],
        id = json["id"];
}
