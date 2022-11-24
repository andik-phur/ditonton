import 'package:dartz/dartz.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/failure.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/repositories/tv_repository.dart';

class TvSearch {
  final TvRepository repository;
  TvSearch(this.repository);

  Future<Either<Failure, List<Television>>> execute(String query) {
    return repository.Tvsearch(query);
  }
}
