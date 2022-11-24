import 'package:flutter/material.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/tv_nowPlaying_notifier.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/widgets/tv_card_list.dart';
import 'package:provider/provider.dart';

class TvNowPlayingPage extends StatefulWidget {
  static const ROUTE_NAME = '/tv_now_PLAYING_page';

  const TvNowPlayingPage({Key? key}) : super(key: key);

  @override
  _TvNowPlayingPageState createState() => _TvNowPlayingPageState();
}

class _TvNowPlayingPageState extends State<TvNowPlayingPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TvNowPlayingNotifieer>(context, listen: false)
            .fetchTvOnTheAir());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Now Playing Tv'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer<TvNowPlayingNotifieer>(
          builder: (context, provider, child) {
            if (provider.state == RequestState.Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (provider.state == RequestState.Loaded) {
              return ListView.builder(
                  itemCount: provider.tv.length,
                  itemBuilder: (context, index) {
                    final movie = provider.tv[index];
                    return CardTvList(movie);
                  });
            } else {
              return Center(
                key: const Key('error_message'),
                child: Text(provider.message),
              );
            }
          },
        ),
      ),
    );
  }
}
