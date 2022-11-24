import 'package:flutter/material.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/top_rated_notifiee.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/widgets/tv_card_list.dart';
import 'package:provider/provider.dart';

class TvTopRated extends StatefulWidget {
  static const ROUTE_NAME = '/tv_top_rated_page';
  const TvTopRated({Key? key}) : super(key: key);

  @override
  State<TvTopRated> createState() => _TvTopRatedState();
}

class _TvTopRatedState extends State<TvTopRated> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TopRatedTvNotifier>(context, listen: false)
            .fetchTopRatedTv());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated TV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer<TopRatedTvNotifier>(
          builder: (context, provider, child) {
            if (provider.state == RequestState.Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (provider.state == RequestState.Loaded) {
              return ListView.builder(
                itemCount: provider.tv.length,
                itemBuilder: (context, index) {
                  final popularTv = provider.tv[index];
                  return CardTvList(popularTv);
                },
              );
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
