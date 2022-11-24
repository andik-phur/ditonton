import 'package:flutter/cupertino.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_popular_tv.dart';

class TvPopularNotifier extends ChangeNotifier {
  final GetPopularTv getTvPopular;

  TvPopularNotifier(this.getTvPopular);

  String _message = '';
  String get message => _message;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Television> _popularTv = [];
  List<Television> get popularTv => _popularTv;

  Future<void> fetchTvPopular() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTvPopular.execute();
    result.fold((failure) {
      _state = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (dataTv) {
      _state = RequestState.Loaded;
      _popularTv = dataTv;
      notifyListeners();
    });
  }
}
