import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/failure.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_detail_tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_recomendations_tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_watch_list_status_tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/remove_tv_watch_list.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/save_tv_watch_list.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/tv_detail_notifier.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetDetailTv,
  GetTvRecommendations,
  GetTvWatchlistStatus,
  SaveTvWatchlist,
  RemoveTvWatchlist,
])
void main() {
  late TvDetailNotifier provider;
  late MockGetDetailTv mockGetTvDetail;
  late MockGetTvRecommendations mockGetTvRecommendations;
  late MockGetTvWatchlistStatus mockGetTvWatchlistStatus;
  late MockSaveTvWatchlist mockSaveTvWatchlist;
  late MockRemoveTvWatchlist mockRemoveTvWatchlist;
  late int listenerCallCount;
  setUp(() {
    listenerCallCount = 0;
    mockGetTvDetail = MockGetDetailTv();
    mockGetTvRecommendations = MockGetTvRecommendations();
    mockGetTvWatchlistStatus = MockGetTvWatchlistStatus();
    mockSaveTvWatchlist = MockSaveTvWatchlist();
    mockRemoveTvWatchlist = MockRemoveTvWatchlist();
    provider = TvDetailNotifier(
        getTvDetail: mockGetTvDetail,
        getTvWatchlistStatus: mockGetTvWatchlistStatus,
        removeWatchlistTv: mockRemoveTvWatchlist,
        saveWatchlistTv: mockSaveTvWatchlist,
        getTvRecommendations: mockGetTvRecommendations)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tId = 1;

  final testTv = Television(
      backdropPath: "/4g5gK5eGWZg8swIZl6eX2AoJp8S.jpg",
      genreIds: [18],
      id: 11250,
      name: "Pasión de gavilanes",
      originCountry: ["CO"],
      originalLanguage: "es",
      originalName: "Pasión de gavilanes",
      overview:
          "The Reyes-Elizondo's idyllic lives are shattered by a murder charge against Eric and León.",
      popularity: 3645.173,
      posterPath: "/lWlsZIsrGVWHtBeoOeLxIKDd9uy.jpg",
      voteAverage: 7.6,
      voteCount: 1765);

  final tv = <Television>[testTv];
  void _arrangeUsecase() {
    when(mockGetTvDetail.execute(tId))
        .thenAnswer((_) async => Right(testTvDetail));
    when(mockGetTvRecommendations.execute(tId))
        .thenAnswer((_) async => Right(tv));
  }

  group('on Error', () {
    test('should return error when data is unsuccessful', () async {
      ///arrange
      when(mockGetTvDetail.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetTvRecommendations.execute(tId))
          .thenAnswer((_) async => Right(tv));

      ///act
      await provider.fetchTvDetail(tId);

      ///assert
      expect(provider.tvDetailState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('Get Movie Detail', () {
    test('should get data from the usecase', () async {
      ///arrange
      _arrangeUsecase();

      ///act
      await provider.fetchTvDetail(tId);

      ///assert
      verify(mockGetTvDetail.execute(tId));
      verify(mockGetTvRecommendations.execute(tId));
    });

    test('should change state to Loading when usecase is called', () {
      ///arrange
      _arrangeUsecase();

      ///act
      provider.fetchTvDetail(tId);

      ///assert
      expect(provider.tvDetailState, RequestState.Loading);
      expect(listenerCallCount, 1);
    });

    test('should change recommendation movies when data is gotten successfully',
        () async {
      ///arrange
      _arrangeUsecase();

      ///act
      await provider.fetchTvDetail(tId);

      ///assert
      expect(provider.tvDetailState, RequestState.Loaded);
      expect(provider.tvRecommendation, tv);
    });
  });

  group('Watchlist', () {
    test('should get the watchlist status', () async {
      ///arrange
      when(mockGetTvWatchlistStatus.execute(1)).thenAnswer((_) async => true);

      ///act
      await provider.loadWatchlistStatusTv(1);

      ///assert
      expect(provider.isAddedToWatchListTv, true);
    });

    test('should execute save watchlist when function called', () async {
      ///arrange
      when(mockSaveTvWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => Right('Success'));
      when(mockGetTvWatchlistStatus.execute(testTvDetail.id))
          .thenAnswer((_) async => true);

      ///act
      await provider.addWatchlist(testTvDetail);
      //assert
      verify(mockSaveTvWatchlist.execute(testTvDetail));
    });

    test('should execute remove watchlist when function called', () async {
      ///arrange
      when(mockRemoveTvWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => Right('Removed'));
      when(mockGetTvWatchlistStatus.execute(testTvDetail.id))
          .thenAnswer((_) async => false);

      ///act
      await provider.removeFromWatchlistTv(testTvDetail);
      //assert
      verify(mockRemoveTvWatchlist.execute(testTvDetail));
    });

    test('should update watchlist status when add watchlist success', () async {
      //arrange
      when(mockSaveTvWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => Right('Added to Watchlist'));
      when(mockGetTvWatchlistStatus.execute(testTvDetail.id))
          .thenAnswer((_) async => true);
      //act
      await provider.addWatchlist(testTvDetail);

      ///assert
      verify(mockGetTvWatchlistStatus.execute(testTvDetail.id));
      expect(provider.isAddedToWatchListTv, true);
      expect(provider.watchlistMessageTv, 'Added to Watchlist');
      expect(listenerCallCount, 1);
    });

    test('should update watchlist message when add watchlist failed', () async {
      ///arrange
      when(mockSaveTvWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      when(mockGetTvWatchlistStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => false);

      ///act
      await provider.addWatchlist(testTvDetail);

      ///assert
      expect(provider.watchlistMessageTv, 'Failed');
      expect(listenerCallCount, 1);
    });
  });

  group('Get Movie Recommendations', () {
    test('should get data from the usecase', () async {
      ///arrange
      _arrangeUsecase();

      ///act
      await provider.fetchTvDetail(tId);

      ///assert
      verify(mockGetTvRecommendations.execute(tId));
      expect(provider.tvRecommendation, tv);
    });

    test('should update recommendation state when data is gotten successfully',
        () async {
      ///arrange
      _arrangeUsecase();

      ///act
      await provider.fetchTvDetail(tId);

      ///assert
      expect(provider.tvRecommendationState, RequestState.Loaded);
      expect(provider.tvRecommendation, tv);
    });

    test('should update error message when request in successful', () async {
      ///arrange
      when(mockGetTvDetail.execute(tId))
          .thenAnswer((_) async => Right(testTvDetail));
      when(mockGetTvRecommendations.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Failed')));

      ///act
      await provider.fetchTvDetail(tId);

      ///assert
      expect(provider.tvRecommendationState, RequestState.Error);
      expect(provider.message, 'Failed');
    });
  });
}
