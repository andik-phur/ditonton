import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_detail_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/tv_detail_notifier.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_detail_page_test.mocks.dart';

@GenerateMocks([TvDetailNotifier])
void main() {
  late MockTvDetailNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockTvDetailNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvDetailNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(mockNotifier.tvDetailState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvDetail).thenReturn(testTvDetail);
    when(mockNotifier.tvRecommendationState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvRecommendation).thenReturn(<Television>[]);
    when(mockNotifier.isAddedToWatchListTv).thenReturn(false);

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(DetailPageTv(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(mockNotifier.tvDetailState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvDetail).thenReturn(testTvDetail);
    when(mockNotifier.tvRecommendationState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvRecommendation).thenReturn(<Television>[]);
    when(mockNotifier.isAddedToWatchListTv).thenReturn(true);

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(DetailPageTv(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    when(mockNotifier.tvDetailState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvDetail).thenReturn(testTvDetail);
    when(mockNotifier.tvRecommendationState).thenReturn(RequestState.Loaded);
    when(mockNotifier.tvRecommendation).thenReturn(<Television>[]);
    when(mockNotifier.isAddedToWatchListTv).thenReturn(false);
    when(mockNotifier.watchlistMessageTv).thenReturn('Failed');

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(DetailPageTv(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });
}
