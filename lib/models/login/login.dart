class Login {
  final bool success;
  final String jwt;

  Login(this.success, this.jwt);

  Login.fromJson(Map<String, dynamic> json)
      : success = json["success"],
        jwt = json["jwt"];
}
