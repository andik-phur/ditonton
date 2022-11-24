import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/constants.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/utils.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/about_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/home_movie_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/movie_detail_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/popular_movies_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/search_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/top_rated_movies_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_now_playing_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_popular_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_search_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_top_rated_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_watchlist_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_detail_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/tv_home_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/pages/watchlist_movies_page.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/movie_detail_notifier.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/movie_list_notifier.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/movie_search_notifier.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/popular_movies_notifier.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/top_rated_movies_notifier.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/top_rated_notifiee.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/tv_detail_notifier.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/tv_list_notifier.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/tv_nowPlaying_notifier.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/tv_popular_notifier.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/tv_search_notifier.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/watch_list_tv_notifier.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/watchlist_movie_notifier.dart';
import 'package:provider/provider.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/injection.dart'
    as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedTvNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvPopularNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvNowPlayingNotifieer>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistTvNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeTvPage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomeMoviePage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case DetailPageTv.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => DetailPageTv(id: id), settings: settings);
            case TvNowPlayingPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TvNowPlayingPage());
            case TvTopRated.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TvTopRated());
            case PopularTvPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => PopularTvPage());
            case SearchTvPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => SearchTvPage());
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistTVPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistTVPage());
            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            case HomeTvPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => HomeTvPage());

            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
