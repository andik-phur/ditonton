import 'package:equatable/equatable.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/genre.dart';

class TvDetail extends Equatable {
  TvDetail(
      {required this.backdropPath,
      required this.firstAirDate,
      required this.genres,
      required this.id,
      required this.originalName,
      required this.name,
      required this.originalLanguage,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.voteAverage,
      required this.voteCount});

  String? backdropPath;
  String firstAirDate;
  List<Genre> genres;
  int id;
  String originalName;
  String name;
  String originalLanguage;
  String overview;
  double popularity;
  String posterPath;
  double voteAverage;
  int? voteCount;

  @override
  List<Object?> get props => [
        backdropPath,
        firstAirDate,
        genres,
        id,
        originalName,
        name,
        originalLanguage,
        overview,
        popularity,
        posterPath,
        voteAverage,
        voteCount
      ];
}
