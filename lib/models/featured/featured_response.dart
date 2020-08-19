import 'featured.dart';

class FeaturedResponse {
  final List<Featured> featured;
  final String error;

  FeaturedResponse(this.featured, this.error);

  FeaturedResponse.fromJson(Map<String, dynamic> json)
      : featured = (json["featured"] as List)
            .map((e) => new Featured.fromJson(e))
            .toList(),
        error = "";

  FeaturedResponse.withError(String errorValue)
      : featured = List(),
        error = errorValue;
}
