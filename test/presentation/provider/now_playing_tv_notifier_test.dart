import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/failure.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_now_playing_tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/tv_nowPlaying_notifier.dart';

import 'list_tv_notifier_test.mocks.dart';

@GenerateMocks([GetNowPlayingTv])
void main() {
  late MockGetNowPlayingTv mockGetOnTheAirTv;
  late TvNowPlayingNotifieer notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetOnTheAirTv = MockGetNowPlayingTv();
    notifier = TvNowPlayingNotifieer(getTvOnTheAir: mockGetOnTheAirTv)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  final testTv = Television(
      backdropPath: "backdropPath",
      genreIds: [1, 2, 3],
      id: 1,
      name: "name",
      originCountry: ["CO"],
      originalLanguage: "es",
      originalName: "originalName",
      overview: "overview",
      popularity: 1,
      posterPath: "posterPath",
      voteAverage: 1,
      voteCount: 1);
  final tvList = <Television>[testTv];

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetOnTheAirTv.execute()).thenAnswer((_) async => Right(tvList));
    // act
    notifier.fetchTvOnTheAir();
    // assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change tvs data when data is gotten successfully', () async {
    // arrange
    when(mockGetOnTheAirTv.execute()).thenAnswer((_) async => Right(tvList));
    // act
    await notifier.fetchTvOnTheAir();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.tv, tvList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetOnTheAirTv.execute())
        .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchTvOnTheAir();
    // assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
