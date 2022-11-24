import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/repositories/tv_repository.dart';

class GetTvWatchlistStatus {
  final TvRepository repository;
  GetTvWatchlistStatus(this.repository);
  Future<bool> execute(int id) async {
    return repository.isAddedToTvWatchlist(id);
  }
}
