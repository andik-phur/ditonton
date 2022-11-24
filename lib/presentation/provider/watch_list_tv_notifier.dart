import 'package:flutter/cupertino.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_tv_watcha_list.dart';

class WatchlistTvNotifier extends ChangeNotifier {
  var _watchlistTv = <Television>[];
  List<Television> get watchlistTv => _watchlistTv;

  var _watchlistStateTv = RequestState.Empty;
  RequestState get watchlistStateTv => _watchlistStateTv;

  String _message = '';
  String get message => _message;

  WatchlistTvNotifier({required this.getWatchlistTv});
  final GetTvWatchlist getWatchlistTv;

  Future<void> fetchWatchlistTv() async {
    _watchlistStateTv = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTv.execute();
    result.fold((failure) {
      _watchlistStateTv = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (success) {
      _watchlistStateTv = RequestState.Loaded;
      _watchlistTv = success;
      notifyListeners();
    });
  }
}
