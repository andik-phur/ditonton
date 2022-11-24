import 'package:flutter/cupertino.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv_detail.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_detail_tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_recomendations_tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_watch_list_status_tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/remove_tv_watch_list.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/save_tv_watch_list.dart';

class TvDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to watchlist';
  static const watchlistRemoveSuccessMessage = 'Remove from watchlist';
  final GetDetailTv getTvDetail;
  final GetTvRecommendations getTvRecommendations;
  final SaveTvWatchlist saveWatchlistTv;
  final GetTvWatchlistStatus getTvWatchlistStatus;
  final RemoveTvWatchlist removeWatchlistTv;

  TvDetailNotifier({
    required this.getTvDetail,
    required this.getTvWatchlistStatus,
    required this.removeWatchlistTv,
    required this.saveWatchlistTv,
    required this.getTvRecommendations,
  });

  String _message = '';
  String get message => _message;

  RequestState _tvDetailState = RequestState.Empty;
  RequestState get tvDetailState => _tvDetailState;

  late TvDetail _tvDetail;
  TvDetail get tvDetail => _tvDetail;

  ///
  bool _isAddedToWatchListTv = false;
  bool get isAddedToWatchListTv => _isAddedToWatchListTv;
  String _watchlistMessageTv = '';
  String get watchlistMessageTv => _watchlistMessageTv;

  ///
  List<Television> _tvRecommendation = [];
  List<Television> get tvRecommendation => _tvRecommendation;

  RequestState _tvRecommendationState = RequestState.Empty;
  RequestState get tvRecommendationState => _tvRecommendationState;

  Future<void> fetchTvDetail(int id) async {
    _tvDetailState = RequestState.Loading;
    notifyListeners();

    final detailTvResult = await getTvDetail.execute(id);
    final tvRecommendationResult = await getTvRecommendations.execute(id);

    detailTvResult.fold((failure) {
      _tvDetailState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (dataTvDetail) {
      _tvRecommendationState = RequestState.Loading;
      _tvDetail = dataTvDetail;
      notifyListeners();
      _tvDetailState = RequestState.Loaded;
      notifyListeners();
      tvRecommendationResult.fold((failure) {
        _tvRecommendationState = RequestState.Error;
        _message = failure.message;
      }, (success) {
        _tvRecommendationState = RequestState.Loaded;
        _tvRecommendation = success;
      });
    });
  }

  Future<void> addWatchlist(TvDetail tvDetail) async {
    final result = await saveWatchlistTv.execute(tvDetail);
    result.fold((failure) {
      _watchlistMessageTv = failure.message;
    }, (success) {
      _watchlistMessageTv = success;
    });
    await loadWatchlistStatusTv(tvDetail.id);
  }

  Future<void> loadWatchlistStatusTv(int id) async {
    final result = await getTvWatchlistStatus.execute(id);
    _isAddedToWatchListTv = result;
    notifyListeners();
  }

  Future<void> removeFromWatchlistTv(TvDetail tvDetail) async {
    final result = await removeWatchlistTv.execute(tvDetail);
    result.fold((failure) {
      _watchlistMessageTv = failure.message;
    }, (success) {
      _watchlistMessageTv = success;
    });
    await loadWatchlistStatusTv(tvDetail.id);
  }
}
