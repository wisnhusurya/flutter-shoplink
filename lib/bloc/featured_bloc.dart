part of 'blocs.dart';

class FeaturedBloc {
  final ShopLinkRepository _repository = ShopLinkRepository();
  final BehaviorSubject<FeaturedResponse> _subject =
      BehaviorSubject<FeaturedResponse>();

  getFeatured() async {
    FeaturedResponse response = await _repository.getFeatured();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<FeaturedResponse> get subject => _subject;
}

final featuredBloc = FeaturedBloc();
