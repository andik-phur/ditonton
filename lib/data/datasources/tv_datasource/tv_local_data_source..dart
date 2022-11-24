import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/exception.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/datasources/db/tv_db/tv_database_helper.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/models/tv_model/tv_table.dart';

abstract class TvLocalDataSource {
  Future<String> insertWatchlistTv(TvTables tv);
  Future<String> removeWatchlistTv(TvTables tv);
  Future<TvTables?> getTvById(int id);
  Future<List<TvTables>> getWatchlistTv();
}

class TvLocalDataSourceImpl implements TvLocalDataSource {
  final DatabaseHelperTv databaseHelperTv;

  TvLocalDataSourceImpl({required this.databaseHelperTv});
  @override
  Future<String> insertWatchlistTv(TvTables tvTable) async {
    try {
      await databaseHelperTv.insertWatchlistTv(tvTable);
      return 'Added to watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<TvTables?> getTvById(int id) async {
    final result = await databaseHelperTv.getTvById(id);
    if (result != null) {
      return TvTables.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TvTables>> getWatchlistTv() async {
    final result = await databaseHelperTv.getWatchlistTv();
    return result.map((e) => TvTables.fromMap(e)).toList();
  }

  @override
  Future<String> removeWatchlistTv(TvTables tvTable) async {
    try {
      await databaseHelperTv.removeWatchList(tvTable);
      return 'Remove from watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
