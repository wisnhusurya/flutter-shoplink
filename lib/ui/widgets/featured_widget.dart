part of 'widgets.dart';

class FeaturedWidget extends StatefulWidget {
  @override
  _FeaturedWidget createState() => _FeaturedWidget();
}

class _FeaturedWidget extends State<FeaturedWidget> {
  @override
  void initState() {
    super.initState();
    featuredBloc..getFeatured();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FeaturedResponse>(
      stream: featuredBloc.subject.stream,
      builder: (context, AsyncSnapshot<FeaturedResponse> snapshot) {
        if (snapshot.hasData) {
          return _buildFeaturedWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        }
        return _buildLoadingWidget();
      },
    );
  }

  Widget _buildFeaturedWidget(FeaturedResponse data) {
    List<Featured> featured = data.featured;
    double width = (MediaQuery.of(context).size.width - 82) / 3;
    return Container(
      height: width * 1.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: featured.length,
          itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(
                    left: (index == 0) ? 25 : 0,
                    right: (index == featured.length - 1) ? 25 : 16),
                height: width * 3,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 12.0),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  children: [
                    Container(
                      height: width,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: NetworkImage(featured[index].image),
                              fit: BoxFit.cover)),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 11, right: 11, top: 8, bottom: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(featured[index].name,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300)),
                            Text(
                              featured[index].price,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
    );
  }

  Widget _buildLoadingWidget() {
    return Shimmer(
        gradient: LinearGradient(
            stops: [0.4, 0.5, 0.6],
            colors: [Colors.grey[300], Colors.white, Colors.grey[300]]),
        child: Container(
          height: 135,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(
                        left: (index == 0) ? 25 : 0,
                        right: (index == 3 - 1) ? 25 : 16),
                    height: 135,
                    width: (MediaQuery.of(context).size.width - 82) / 3,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  )),
        ));
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
