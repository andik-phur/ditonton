import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/failure.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_tv_watcha_list.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/watch_list_tv_notifier.dart';
import '../../dummy_data/dummy_objects.dart';
import 'tv_watchlist_notifier_test.mocks.dart';

@GenerateMocks([GetTvWatchlist])
void main() {
  late WatchlistTvNotifier provider;
  late MockGetTvWatchlist mockGetWatchlistTv;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetWatchlistTv = MockGetTvWatchlist();
    provider = WatchlistTvNotifier(
      getWatchlistTv: mockGetWatchlistTv,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  test('should change tvs data when data is gotten successfully', () async {
    // arrange
    when(mockGetWatchlistTv.execute())
        .thenAnswer((_) async => Right([testWatchlistTv]));
    // act
    await provider.fetchWatchlistTv();
    // assert
    expect(provider.watchlistStateTv, RequestState.Loaded);
    expect(provider.watchlistTv, [testWatchlistTv]);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetWatchlistTv.execute())
        .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
    // act
    await provider.fetchWatchlistTv();
    // assert
    expect(provider.watchlistStateTv, RequestState.Error);
    expect(provider.message, "Can't get data");
    expect(listenerCallCount, 2);
  });
}
