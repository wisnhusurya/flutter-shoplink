class Banner {
  final String image;
  final String url;

  Banner(this.image, this.url);

  Banner.fromJson(Map<String, dynamic> json)
      : image = json["image"],
        url = json["url"];
}
