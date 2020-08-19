part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String id = "user";
  String password = "1234";
  bool isLogin = false;

  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("tokenJWT") != null) {
      print("FAAAKKKK" + prefs.getString("tokenJWT"));
      //Get.off(HomePage());
    }
  }

  @override
  void initState() {
    super.initState();
    getSharedPrefs();
    // if (readStringValuesSP("tokenJWT") != null) {
    //   Get.off(HomePage());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
            child: Text("Login"),
            onPressed: () {
              loginBloc..login(id, password);
            }),
      ),
    );
  }
}
