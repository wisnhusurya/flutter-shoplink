part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Shoplink"),
      // ),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          BannerWidget(),
          SizedBox(
            height: 11,
          ),
          FeaturedWidget()
        ],
      ),
    );
  }
}
