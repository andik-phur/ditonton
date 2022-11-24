import 'package:dartz/dartz.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/failure.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv_detail.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/repositories/tv_repository.dart';

class RemoveTvWatchlist {
  final TvRepository repository;
  RemoveTvWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvDetail tvDetail) {
    return repository.removeTvWatchlist(tvDetail);
  }
}
