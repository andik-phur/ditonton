import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/constants.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/about_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/home_movie_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_now_playing_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_popular_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_search_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_top_rated_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_watchlist_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_detail_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/tv_list_notifier.dart';
import 'package:provider/provider.dart';

class HomeTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/tv_home_page';

  const HomeTvPage({Key? key}) : super(key: key);

  @override
  _HomeTvPageState createState() => _HomeTvPageState();
}

class _HomeTvPageState extends State<HomeTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<TvListNotifier>(context, listen: false)
      ..fetchOnTheAirTv()
      ..fetchPopularTv()
      ..fetchTopRatedTv());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/circle-g.png'),
                ),
                accountName: Text('Nontonin'),
                accountEmail: Text('')),
            ListTile(
              leading: const Icon(Icons.tv_outlined),
              title: const Text('TV'),
              onTap: () => {Navigator.pop(context)},
            ),
            ListTile(
              leading: const Icon(Icons.movie_outlined),
              title: const Text('Movies'),
              onTap: () =>
                  {Navigator.pushNamed(context, HomeMoviePage.ROUTE_NAME)},
            ),
            ListTile(
              leading: const Icon(Icons.save_alt_outlined),
              title: const Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistTVPage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outlined),
              title: const Text('About'),
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('DiTonton'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchTvPage.ROUTE_NAME);
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSubHeading(
                title: 'Top Rated TV',
                onTap: () =>
                    Navigator.pushNamed(context, TvTopRated.ROUTE_NAME),
              ),
              Consumer<TvListNotifier>(
                builder: (context, data, child) {
                  final state = data.topRatedTvState;
                  if (state == RequestState.Loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state == RequestState.Loaded) {
                    return TvList(data.topRatedTv);
                  } else {
                    return Text(data.message);
                  }
                },
              ),
              _buildSubHeading(
                  title: 'Populars',
                  onTap: () {
                    Navigator.pushNamed(context, PopularTvPage.ROUTE_NAME);
                  }),
              Consumer<TvListNotifier>(
                builder: (context, data, child) {
                  final state = data.popularTvState;
                  if (state == RequestState.Loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state == RequestState.Loaded) {
                    return TvList(data.popularTv);
                  } else {
                    return Text(data.message);
                  }
                },
              ),
              _buildSubHeading(
                  title: 'Now Playing Tv',
                  onTap: () {
                    Navigator.pushNamed(context, TvNowPlayingPage.ROUTE_NAME);
                  }),
              Consumer<TvListNotifier>(
                builder: (context, data, child) {
                  final state = data.onTheAirTvState;
                  if (state == RequestState.Loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state == RequestState.Loaded) {
                    return TvList(data.onTheAirTv);
                  } else {
                    return Text(data.message);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: const [Text('See more'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        )
      ],
    );
  }
}

class TvList extends StatelessWidget {
  final List<Television> tv;

  TvList(this.tv);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tv.length,
        itemBuilder: (context, index) {
          final movieTv = tv[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                debugPrint('${movieTv.id}');
                Navigator.pushNamed(context, DetailPageTv.ROUTE_NAME,
                    arguments: movieTv.id);
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movieTv.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
