// Mocks generated by Mockito 5.3.0 from annotations
// in nontonin_with_clean_arcitectur_and_test_driven_development_flutter/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:convert' as _i25;
import 'dart:typed_data' as _i26;

import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/failure.dart'
    as _i12;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/datasources/db/movie_db/database_helper.dart'
    as _i22;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/datasources/db/tv_db/tv_database_helper.dart'
    as _i9;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/datasources/movie_datasource/movie_local_data_source.dart'
    as _i20;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/datasources/movie_datasource/movie_remote_data_source.dart'
    as _i18;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/datasources/tv_datasource/tv_local_data_source..dart'
    as _i6;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/datasources/tv_datasource/tv_remote_data_source.dart'
    as _i23;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/models/movie_model/movie_detail_model.dart'
    as _i3;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/models/movie_model/movie_model.dart'
    as _i19;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/models/movie_model/movie_table.dart'
    as _i21;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/models/tv_model/tv_detail_model.dart'
    as _i4;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/models/tv_model/tv_model.dart'
    as _i24;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/models/tv_model/tv_table.dart'
    as _i8;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/movie.dart'
    as _i13;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/movie_detail.dart'
    as _i14;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart'
    as _i17;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv_detail.dart'
    as _i16;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/repositories/movie_repository.dart'
    as _i11;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/repositories/tv_repository.dart'
    as _i15;
import 'package:sqflite/sqflite.dart' as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeMovieDetailResponse_1 extends _i1.SmartFake
    implements _i3.MovieDetailResponse {
  _FakeMovieDetailResponse_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeDetailTvModelResponse_2 extends _i1.SmartFake
    implements _i4.DetailTvModelResponse {
  _FakeDetailTvModelResponse_2(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeResponse_3 extends _i1.SmartFake implements _i5.Response {
  _FakeResponse_3(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeStreamedResponse_4 extends _i1.SmartFake
    implements _i5.StreamedResponse {
  _FakeStreamedResponse_4(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [TvLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvLocalDataSource extends _i1.Mock implements _i6.TvLocalDataSource {
  MockTvLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlistTv(_i8.TvTables? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTv, [tv]),
          returnValue: _i7.Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchlistTv(_i8.TvTables? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tv]),
          returnValue: _i7.Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i8.TvTables?> getTvById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvById, [id]),
              returnValue: _i7.Future<_i8.TvTables?>.value())
          as _i7.Future<_i8.TvTables?>);
  @override
  _i7.Future<List<_i8.TvTables>> getWatchlistTv() => (super.noSuchMethod(
          Invocation.method(#getWatchlistTv, []),
          returnValue: _i7.Future<List<_i8.TvTables>>.value(<_i8.TvTables>[]))
      as _i7.Future<List<_i8.TvTables>>);
}

/// A class which mocks [DatabaseHelperTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperTv extends _i1.Mock implements _i9.DatabaseHelperTv {
  MockDatabaseHelperTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i10.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: _i7.Future<_i10.Database?>.value())
          as _i7.Future<_i10.Database?>);
  @override
  _i7.Future<int> insertWatchlistTv(_i8.TvTables? tvTable) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTv, [tvTable]),
          returnValue: _i7.Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchList(_i8.TvTables? tvTable) =>
      (super.noSuchMethod(Invocation.method(#removeWatchList, [tvTable]),
          returnValue: _i7.Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getTvById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvById, [id]),
              returnValue: _i7.Future<Map<String, dynamic>?>.value())
          as _i7.Future<Map<String, dynamic>?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
              returnValue: _i7.Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i7.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i11.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>>
      getNowPlayingMovies() => (super.noSuchMethod(
              Invocation.method(#getNowPlayingMovies, []),
              returnValue:
                  _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>>.value(
                      _FakeEither_0<_i12.Failure, List<_i13.Movie>>(
                          this, Invocation.method(#getNowPlayingMovies, []))))
          as _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(Invocation.method(#getPopularMovies, []),
              returnValue:
                  _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>>.value(
                      _FakeEither_0<_i12.Failure, List<_i13.Movie>>(
                          this, Invocation.method(#getPopularMovies, []))))
          as _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedMovies, []),
              returnValue:
                  _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>>.value(
                      _FakeEither_0<_i12.Failure, List<_i13.Movie>>(
                          this, Invocation.method(#getTopRatedMovies, []))))
          as _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, _i14.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
              returnValue:
                  _i7.Future<_i2.Either<_i12.Failure, _i14.MovieDetail>>.value(
                      _FakeEither_0<_i12.Failure, _i14.MovieDetail>(
                          this, Invocation.method(#getMovieDetail, [id]))))
          as _i7.Future<_i2.Either<_i12.Failure, _i14.MovieDetail>>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>>
      getMovieRecommendations(int? id) => (super.noSuchMethod(
              Invocation.method(#getMovieRecommendations, [id]),
              returnValue:
                  _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>>.value(
                      _FakeEither_0<_i12.Failure, List<_i13.Movie>>(this,
                          Invocation.method(#getMovieRecommendations, [id]))))
          as _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
              returnValue:
                  _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>>.value(
                      _FakeEither_0<_i12.Failure, List<_i13.Movie>>(
                          this, Invocation.method(#searchMovies, [query]))))
          as _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, String>> saveWatchlist(
          _i14.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [movie]),
              returnValue: _i7.Future<_i2.Either<_i12.Failure, String>>.value(
                  _FakeEither_0<_i12.Failure, String>(
                      this, Invocation.method(#saveWatchlist, [movie]))))
          as _i7.Future<_i2.Either<_i12.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, String>> removeWatchlist(
          _i14.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
              returnValue: _i7.Future<_i2.Either<_i12.Failure, String>>.value(
                  _FakeEither_0<_i12.Failure, String>(
                      this, Invocation.method(#removeWatchlist, [movie]))))
          as _i7.Future<_i2.Either<_i12.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: _i7.Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue:
                  _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>>.value(
                      _FakeEither_0<_i12.Failure, List<_i13.Movie>>(
                          this, Invocation.method(#getWatchlistMovies, []))))
          as _i7.Future<_i2.Either<_i12.Failure, List<_i13.Movie>>>);
}

/// A class which mocks [TvRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRepository extends _i1.Mock implements _i15.TvRepository {
  MockTvRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i12.Failure, _i16.TvDetail>> getDetailTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#getDetailTv, [id]),
              returnValue:
                  _i7.Future<_i2.Either<_i12.Failure, _i16.TvDetail>>.value(
                      _FakeEither_0<_i12.Failure, _i16.TvDetail>(
                          this, Invocation.method(#getDetailTv, [id]))))
          as _i7.Future<_i2.Either<_i12.Failure, _i16.TvDetail>>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, List<_i17.Television>>> getOnTheAirTv() =>
      (super.noSuchMethod(Invocation.method(#getOnTheAirTv, []),
          returnValue:
              _i7.Future<_i2.Either<_i12.Failure, List<_i17.Television>>>.value(
                  _FakeEither_0<_i12.Failure, List<_i17.Television>>(
                      this, Invocation.method(#getOnTheAirTv, [])))) as _i7
          .Future<_i2.Either<_i12.Failure, List<_i17.Television>>>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, List<_i17.Television>>> getTopRatedtv() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedtv, []),
          returnValue:
              _i7.Future<_i2.Either<_i12.Failure, List<_i17.Television>>>.value(
                  _FakeEither_0<_i12.Failure, List<_i17.Television>>(
                      this, Invocation.method(#getTopRatedtv, [])))) as _i7
          .Future<_i2.Either<_i12.Failure, List<_i17.Television>>>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, List<_i17.Television>>> getPopularTv() =>
      (super.noSuchMethod(Invocation.method(#getPopularTv, []),
          returnValue:
              _i7.Future<_i2.Either<_i12.Failure, List<_i17.Television>>>.value(
                  _FakeEither_0<_i12.Failure, List<_i17.Television>>(
                      this, Invocation.method(#getPopularTv, [])))) as _i7
          .Future<_i2.Either<_i12.Failure, List<_i17.Television>>>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, List<_i17.Television>>> Tvsearch(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#Tvsearch, [query]),
          returnValue:
              _i7.Future<_i2.Either<_i12.Failure, List<_i17.Television>>>.value(
                  _FakeEither_0<_i12.Failure, List<_i17.Television>>(
                      this, Invocation.method(#Tvsearch, [query])))) as _i7
          .Future<_i2.Either<_i12.Failure, List<_i17.Television>>>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, List<_i17.Television>>>
      getTvRecommendations(int? id) => (super.noSuchMethod(
          Invocation.method(#getTvRecommendations, [id]),
          returnValue:
              _i7.Future<_i2.Either<_i12.Failure, List<_i17.Television>>>.value(
                  _FakeEither_0<_i12.Failure, List<_i17.Television>>(this,
                      Invocation.method(#getTvRecommendations, [id])))) as _i7
          .Future<_i2.Either<_i12.Failure, List<_i17.Television>>>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, String>> saveTvWatchlist(
          _i16.TvDetail? tvDetail) =>
      (super.noSuchMethod(Invocation.method(#saveTvWatchlist, [tvDetail]),
              returnValue: _i7.Future<_i2.Either<_i12.Failure, String>>.value(
                  _FakeEither_0<_i12.Failure, String>(
                      this, Invocation.method(#saveTvWatchlist, [tvDetail]))))
          as _i7.Future<_i2.Either<_i12.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, String>> removeTvWatchlist(
          _i16.TvDetail? tvDetail) =>
      (super.noSuchMethod(Invocation.method(#removeTvWatchlist, [tvDetail]),
              returnValue: _i7.Future<_i2.Either<_i12.Failure, String>>.value(
                  _FakeEither_0<_i12.Failure, String>(
                      this, Invocation.method(#removeTvWatchlist, [tvDetail]))))
          as _i7.Future<_i2.Either<_i12.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToTvWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToTvWatchlist, [id]),
          returnValue: _i7.Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<_i2.Either<_i12.Failure, List<_i17.Television>>>
      getTvWatchlist() => (super.noSuchMethod(
          Invocation.method(#getTvWatchlist, []),
          returnValue:
              _i7.Future<_i2.Either<_i12.Failure, List<_i17.Television>>>.value(
                  _FakeEither_0<_i12.Failure, List<_i17.Television>>(
                      this, Invocation.method(#getTvWatchlist, [])))) as _i7
          .Future<_i2.Either<_i12.Failure, List<_i17.Television>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i18.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i19.MovieModel>> getNowPlayingMovies() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingMovies, []),
              returnValue:
                  _i7.Future<List<_i19.MovieModel>>.value(<_i19.MovieModel>[]))
          as _i7.Future<List<_i19.MovieModel>>);
  @override
  _i7.Future<List<_i19.MovieModel>> getPopularMovies() =>
      (super.noSuchMethod(Invocation.method(#getPopularMovies, []),
              returnValue:
                  _i7.Future<List<_i19.MovieModel>>.value(<_i19.MovieModel>[]))
          as _i7.Future<List<_i19.MovieModel>>);
  @override
  _i7.Future<List<_i19.MovieModel>> getTopRatedMovies() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedMovies, []),
              returnValue:
                  _i7.Future<List<_i19.MovieModel>>.value(<_i19.MovieModel>[]))
          as _i7.Future<List<_i19.MovieModel>>);
  @override
  _i7.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
              returnValue: _i7.Future<_i3.MovieDetailResponse>.value(
                  _FakeMovieDetailResponse_1(
                      this, Invocation.method(#getMovieDetail, [id]))))
          as _i7.Future<_i3.MovieDetailResponse>);
  @override
  _i7.Future<List<_i19.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
              returnValue:
                  _i7.Future<List<_i19.MovieModel>>.value(<_i19.MovieModel>[]))
          as _i7.Future<List<_i19.MovieModel>>);
  @override
  _i7.Future<List<_i19.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
              returnValue:
                  _i7.Future<List<_i19.MovieModel>>.value(<_i19.MovieModel>[]))
          as _i7.Future<List<_i19.MovieModel>>);
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i20.MovieLocalDataSource {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlist(_i21.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: _i7.Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchlist(_i21.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: _i7.Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i21.MovieTable?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: _i7.Future<_i21.MovieTable?>.value())
          as _i7.Future<_i21.MovieTable?>);
  @override
  _i7.Future<List<_i21.MovieTable>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue:
                  _i7.Future<List<_i21.MovieTable>>.value(<_i21.MovieTable>[]))
          as _i7.Future<List<_i21.MovieTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i22.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i10.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: _i7.Future<_i10.Database?>.value())
          as _i7.Future<_i10.Database?>);
  @override
  _i7.Future<int> insertWatchlist(_i21.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: _i7.Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchlist(_i21.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: _i7.Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: _i7.Future<Map<String, dynamic>?>.value())
          as _i7.Future<Map<String, dynamic>?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue: _i7.Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i7.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [TvRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRemoteDataSource extends _i1.Mock
    implements _i23.TvRemoteDataSource {
  MockTvRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i24.ModelTv>> getTvPopular() => (super.noSuchMethod(
          Invocation.method(#getTvPopular, []),
          returnValue: _i7.Future<List<_i24.ModelTv>>.value(<_i24.ModelTv>[]))
      as _i7.Future<List<_i24.ModelTv>>);
  @override
  _i7.Future<List<_i24.ModelTv>> searchTv(String? query) => (super.noSuchMethod(
          Invocation.method(#searchTv, [query]),
          returnValue: _i7.Future<List<_i24.ModelTv>>.value(<_i24.ModelTv>[]))
      as _i7.Future<List<_i24.ModelTv>>);
  @override
  _i7.Future<_i4.DetailTvModelResponse> getDetailTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#getDetailTv, [id]),
              returnValue: _i7.Future<_i4.DetailTvModelResponse>.value(
                  _FakeDetailTvModelResponse_2(
                      this, Invocation.method(#getDetailTv, [id]))))
          as _i7.Future<_i4.DetailTvModelResponse>);
  @override
  _i7.Future<List<_i24.ModelTv>> getTvOnTheAir() => (super.noSuchMethod(
          Invocation.method(#getTvOnTheAir, []),
          returnValue: _i7.Future<List<_i24.ModelTv>>.value(<_i24.ModelTv>[]))
      as _i7.Future<List<_i24.ModelTv>>);
  @override
  _i7.Future<List<_i24.ModelTv>> getTvRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvRecommendations, [id]),
              returnValue:
                  _i7.Future<List<_i24.ModelTv>>.value(<_i24.ModelTv>[]))
          as _i7.Future<List<_i24.ModelTv>>);
  @override
  _i7.Future<List<_i24.ModelTv>> getTvTopRated() => (super.noSuchMethod(
          Invocation.method(#getTvTopRated, []),
          returnValue: _i7.Future<List<_i24.ModelTv>>.value(<_i24.ModelTv>[]))
      as _i7.Future<List<_i24.ModelTv>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i5.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
                  this, Invocation.method(#head, [url], {#headers: headers}))))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
                  this, Invocation.method(#get, [url], {#headers: headers}))))
          as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i25.Encoding? encoding}) =>
      (super
          .noSuchMethod(Invocation.method(#post, [url], {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
                  this,
                  Invocation.method(#post, [
                    url
                  ], {
                    #headers: headers,
                    #body: body,
                    #encoding: encoding
                  })))) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i25.Encoding? encoding}) =>
      (super
          .noSuchMethod(Invocation.method(#put, [url], {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
                  this,
                  Invocation.method(#put, [
                    url
                  ], {
                    #headers: headers,
                    #body: body,
                    #encoding: encoding
                  })))) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i25.Encoding? encoding}) =>
      (super
          .noSuchMethod(Invocation.method(#patch, [url], {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
                  this,
                  Invocation.method(#patch, [
                    url
                  ], {
                    #headers: headers,
                    #body: body,
                    #encoding: encoding
                  })))) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i25.Encoding? encoding}) =>
      (super
          .noSuchMethod(Invocation.method(#delete, [url], {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
                  this,
                  Invocation.method(#delete, [
                    url
                  ], {
                    #headers: headers,
                    #body: body,
                    #encoding: encoding
                  })))) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: _i7.Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i26.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: _i7.Future<_i26.Uint8List>.value(_i26.Uint8List(0)))
          as _i7.Future<_i26.Uint8List>);
  @override
  _i7.Future<_i5.StreamedResponse> send(_i5.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue: _i7.Future<_i5.StreamedResponse>.value(
                  _FakeStreamedResponse_4(
                      this, Invocation.method(#send, [request]))))
          as _i7.Future<_i5.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}