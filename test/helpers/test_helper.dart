import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/datasources/db/movie_db/database_helper.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/datasources/db/tv_db/tv_database_helper.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/datasources/movie_datasource/movie_local_data_source.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/datasources/movie_datasource/movie_remote_data_source.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/datasources/tv_datasource/tv_local_data_source..dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/datasources/tv_datasource/tv_remote_data_source.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/repositories/movie_repository.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/repositories/tv_repository.dart';

@GenerateMocks([
  TvLocalDataSource,
  DatabaseHelperTv,
  MovieRepository,
  TvRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
  TvRemoteDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
