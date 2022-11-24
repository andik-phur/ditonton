import 'package:flutter/cupertino.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_now_playing_tv.dart';

class TvNowPlayingNotifieer extends ChangeNotifier {
  final GetNowPlayingTv getTvOnTheAir;

  TvNowPlayingNotifieer({required this.getTvOnTheAir});

  String _message = '';
  String get message => _message;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Television> _tv = [];
  List<Television> get tv => _tv;

  Future<void> fetchTvOnTheAir() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTvOnTheAir.execute();

    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.Error;
      notifyListeners();
    }, (tvData) {
      _tv = tvData;
      _state = RequestState.Loaded;
      notifyListeners();
    });
  }
}
