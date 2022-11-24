import 'package:flutter/cupertino.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/search_tv.dart';

class TvSearchNotifier extends ChangeNotifier {
  final TvSearch searchTv;
  TvSearchNotifier({required this.searchTv});

  String _message = '';
  String get message => _message;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Television> _searchResultTv = [];
  List<Television> get searchResultTv => _searchResultTv;

  Future<void> fetchTvSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();
    final result = await searchTv.execute(query);
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.Error;
      notifyListeners();
    }, (success) {
      _searchResultTv = success;
      _state = RequestState.Loaded;
      notifyListeners();
    });
  }
}
