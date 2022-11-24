import 'package:flutter/cupertino.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_now_playing_tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_popular_tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_top_rate_tv.dart';

class TvListNotifier extends ChangeNotifier {
  final GetNowPlayingTv getTvOnTheAir;
  final GetPopularTv getTvPopular;
  final GetTopRatedTv getTvTopRated;

  TvListNotifier({
    required this.getTvOnTheAir,
    required this.getTvPopular,
    required this.getTvTopRated,
  });

  ///
  String _message = '';
  String get message => _message;

  ///tv airing today
  var _airingTodayTv = <Television>[];
  List<Television> get airingTodayTv => _airingTodayTv;

  RequestState _airingTodayState = RequestState.Empty;
  RequestState get airingTodayState => _airingTodayState;

  ///tv on the air
  var _onTheAirTv = <Television>[];
  List<Television> get onTheAirTv => _onTheAirTv;

  RequestState _onTheAirTvState = RequestState.Empty;
  RequestState get onTheAirTvState => _onTheAirTvState;

  ///tv popular
  var _popularTv = <Television>[];
  List<Television> get popularTv => _popularTv;

  RequestState _popularTvState = RequestState.Empty;
  RequestState get popularTvState => _popularTvState;

  ///tv top rated
  var _topRatedTv = <Television>[];
  List<Television> get topRatedTv => _topRatedTv;

  RequestState _topRatedTvState = RequestState.Empty;
  RequestState get topRatedTvState => _topRatedTvState;

  Future<void> fetchOnTheAirTv() async {
    _airingTodayState = RequestState.Loading;
    notifyListeners();

    final result = await getTvOnTheAir.execute();
    result.fold((failure) {
      _onTheAirTvState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (dataTv) {
      _onTheAirTvState = RequestState.Loaded;
      _onTheAirTv = dataTv;
      notifyListeners();
    });
  }

  Future<void> fetchPopularTv() async {
    _popularTvState = RequestState.Loading;
    notifyListeners();

    final result = await getTvPopular.execute();
    result.fold((failure) {
      _popularTvState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (dataTv) {
      _popularTvState = RequestState.Loaded;
      _popularTv = dataTv;
      notifyListeners();
    });
  }

  Future<void> fetchTopRatedTv() async {
    _topRatedTvState = RequestState.Loading;
    notifyListeners();
    final result = await getTvTopRated.execute();
    result.fold((failure) {
      _topRatedTvState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (dataTv) {
      _topRatedTvState = RequestState.Loaded;
      _topRatedTv = dataTv;
      notifyListeners();
    });
  }
}
