import 'package:dartz/dartz.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/failure.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv_detail.dart';

abstract class TvRepository {
  Future<Either<Failure, TvDetail>> getDetailTv(int id);
  Future<Either<Failure, List<Television>>> getOnTheAirTv();
  Future<Either<Failure, List<Television>>> getTopRatedtv();
  Future<Either<Failure, List<Television>>> getPopularTv();

  Future<Either<Failure, List<Television>>> Tvsearch(String query);

  Future<Either<Failure, List<Television>>> getTvRecommendations(int id);

  Future<Either<Failure, String>> saveTvWatchlist(TvDetail tvDetail);
  Future<Either<Failure, String>> removeTvWatchlist(TvDetail tvDetail);
  Future<bool> isAddedToTvWatchlist(int id);
  Future<Either<Failure, List<Television>>> getTvWatchlist();
}
