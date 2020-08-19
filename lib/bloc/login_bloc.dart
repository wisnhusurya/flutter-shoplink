part of 'blocs.dart';

class LoginBloc {
  final ShopLinkRepository _repository = ShopLinkRepository();
  final BehaviorSubject<LoginResponse> _subject =
      BehaviorSubject<LoginResponse>();

  login(String id, String password) async {
    LoginResponse response = await _repository.login(id, password);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<LoginResponse> get subject => _subject;
}

final loginBloc = LoginBloc();
