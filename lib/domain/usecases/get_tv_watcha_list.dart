import 'package:dartz/dartz.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/failure.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/repositories/tv_repository.dart';

class GetTvWatchlist {
  final TvRepository _repository;
  GetTvWatchlist(this._repository);

  Future<Either<Failure, List<Television>>> execute() {
    return _repository.getTvWatchlist();
  }
}
