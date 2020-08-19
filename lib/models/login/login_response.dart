import 'login.dart';

class LoginResponse {
  final Login login;
  final String error;

  LoginResponse(this.login, this.error);

  LoginResponse.fromJson(Map<String, dynamic> json)
      : login = Login.fromJson(json),
        error = "";

  LoginResponse.withError(String errorValue)
      : login = Login(false, ""),
        error = errorValue;
}
