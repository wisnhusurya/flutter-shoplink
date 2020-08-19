import 'dart:convert';
import 'package:get/get.dart';
import 'package:shoplink/models/banner/banner_response.dart';
import 'package:shoplink/models/featured/featured_response.dart';
import 'package:shoplink/models/login/login_response.dart';
import 'package:shoplink/shared/shared.dart';
import 'package:http/http.dart' as http;
import 'package:shoplink/ui/pages/pages.dart';

class ShopLinkRepository {
  Map<String, String> headers = {"Authorization": "Bearer " + tokenJWT};

  Future<LoginResponse> login(String id, String password) async {
    try {
      var response =
          await http.post(loginURL, body: {'id': id, 'password': password});
      var data = json.decode(response.body);
      print("Response Data => " + response.body);
      if (LoginResponse.fromJson(data).login.success == true) {
        tokenJWT = LoginResponse.fromJson(data).login.jwt;
        Get.off(HomePage());
      }
      return LoginResponse.fromJson(data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return LoginResponse.withError("$error");
    }
  }

  Future<BannerResponse> getBanner() async {
    try {
      var response = await http.get(getDataURL, headers: headers);
      var data = json.decode(response.body);
      print("Response Data => " + response.body);
      return BannerResponse.fromJson(data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BannerResponse.withError("$error");
    }
  }

  Future<FeaturedResponse> getFeatured() async {
    try {
      var response = await http.get(getDataURL, headers: headers);
      var data = json.decode(response.body);
      print("Response Data => " + response.body);
      return FeaturedResponse.fromJson(data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return FeaturedResponse.withError("$error");
    }
  }
}
