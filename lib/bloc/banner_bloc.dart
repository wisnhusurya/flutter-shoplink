part of 'blocs.dart';

class BannerBloc {
  final ShopLinkRepository _repository = ShopLinkRepository();
  final BehaviorSubject<BannerResponse> _subject =
      BehaviorSubject<BannerResponse>();

  getBanner() async {
    BannerResponse response = await _repository.getBanner();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<BannerResponse> get subject => _subject;
}

final bannerBloc = BannerBloc();
