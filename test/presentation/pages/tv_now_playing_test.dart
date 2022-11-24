import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_now_playing_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/tv_nowPlaying_notifier.dart';
import 'package:provider/provider.dart';
import 'tv_now_playing_test.mocks.dart';

@GenerateMocks([TvNowPlayingNotifieer])
void main() {
  late MockTvNowPlayingNotifieer mockNotifier;

  setUp(() {
    mockNotifier = MockTvNowPlayingNotifieer();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvNowPlayingNotifieer>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(mockNotifier.state).thenReturn(RequestState.Loading);

    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(TvNowPlayingPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockNotifier.state).thenReturn(RequestState.Error);
    when(mockNotifier.message).thenReturn('Error message');

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(TvNowPlayingPage()));

    expect(textFinder, findsOneWidget);
  });
}
