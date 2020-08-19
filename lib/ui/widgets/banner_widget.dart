part of 'widgets.dart';

class BannerWidget extends StatefulWidget {
  @override
  _BannerWidget createState() => _BannerWidget();
}

class _BannerWidget extends State<BannerWidget> {
  @override
  void initState() {
    super.initState();
    bannerBloc..getBanner();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BannerResponse>(
      stream: bannerBloc.subject.stream,
      builder: (context, AsyncSnapshot<BannerResponse> snapshot) {
        if (snapshot.hasData) {
          return _buildBannerWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        }
        return _buildLoadingWidget();
      },
    );
  }

  Widget _buildBannerWidget(BannerResponse data) {
    List<Banner.Banner> banner = data.banner;
    return Container(
      height: 184,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
          itemCount: banner.length,
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            viewportFraction: 0.87,
          ),
          itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 12.0),
                    ],
                    image: DecorationImage(
                        image: NetworkImage(banner[index].image),
                        fit: BoxFit.cover)),
              )),
    );
  }

  Widget _buildLoadingWidget() {
    return Shimmer(
      gradient: LinearGradient(
          stops: [0.4, 0.5, 0.6],
          colors: [Colors.grey[300], Colors.white, Colors.grey[300]]),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        height: 184,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }
}
