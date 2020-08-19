import 'banner.dart';

class BannerResponse {
  final List<Banner> banner;
  final String error;

  BannerResponse(this.banner, this.error);

  BannerResponse.fromJson(Map<String, dynamic> json)
      : banner = (json["banner"] as List)
            .map((e) => new Banner.fromJson(e))
            .toList(),
        error = "";

  BannerResponse.withError(String errorValue)
      : banner = List(),
        error = errorValue;
}
