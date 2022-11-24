import 'package:flutter/material.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/state_enum.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/provider/tv_popular_notifier.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/presentation/widgets/tv_card_list.dart';
import 'package:provider/provider.dart';

class PopularTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/tv_popular_page';
  const PopularTvPage({Key? key}) : super(key: key);

  @override
  State<PopularTvPage> createState() => _PopularTvPageState();
}

class _PopularTvPageState extends State<PopularTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TvPopularNotifier>(context, listen: false)
            .fetchTvPopular());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Populars'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer<TvPopularNotifier>(
          builder: (context, provider, child) {
            if (provider.state == RequestState.Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (provider.state == RequestState.Loaded) {
              return ListView.builder(
                itemCount: provider.popularTv.length,
                itemBuilder: (context, index) {
                  final popularTv = provider.popularTv[index];
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
