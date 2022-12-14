import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/exception.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/datasources/tv_datasource/tv_remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/models/tv_model/tv_detail_model.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/models/tv_model/tv_respone.dart';

import '../../json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const BASE_URL = 'https://api.themoviedb.org/3';

  late TvRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = TvRemoteDataSourceImpl(client: mockHttpClient);
  });
  group('Get Now Playing Tv Series', () {
    final tvList = ResponseTv.fromJson(
            json.decode(readJson('dummy_data/now_playing_tv.json')))
        .tvList;

    test('should return list of tv when response code is 200 ', () async {
      ///arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/now_playing_tv.json'), 200));

      ///act
      final result = await dataSource.getTvOnTheAir();

      ///assert
      expect(result, tvList);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      ///arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      ///act
      final call = dataSource.getTvOnTheAir();

      ///assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
  group('Get Top Rated Tv ', () {
    final tvList = ResponseTv.fromJson(
            json.decode(readJson('dummy_data/tv_top_rated.json')))
        .tvList;

    test('should return list of tv when response code is 200 ', () async {
      ///arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/tv_top_rated.json'), 200));

      ///act
      final result = await dataSource.getTvTopRated();

      ///assert
      expect(result, tvList);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      ///arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      ///act
      final call = dataSource.getTvTopRated();

      ///assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
  group('search tv', () {
    final tSearchResult =
        ResponseTv.fromJson(json.decode(readJson('dummy_data/search_tv.json')))
            .tvList;
    final tQuery = 'Spiderman';

    test('should return list of movies when response code is 200', () async {
      ///arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$tQuery')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/search_tv.json'), 200));

      ///act
      final result = await dataSource.searchTv(tQuery);

      ///assert
      expect(result, tSearchResult);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      ///arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$tQuery')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      ///act
      final call = dataSource.searchTv(tQuery);

      ///assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get tv detail', () {
    final tId = 1;
    final tvDetail = DetailTvModelResponse.fromJson(
        json.decode(readJson('dummy_data/tv_detail.json')));

    test('should return movie detail when the response code is 200', () async {
      ///arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$tId?$API_KEY')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/tv_detail.json'), 200));

      ///act
      final result = await dataSource.getDetailTv(tId);

      ///assert
      expect(result, equals(tvDetail));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      ///arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$tId?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      ///act
      final call = dataSource.getDetailTv(tId);

      ///assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('Get Popular Tv Series', () {
    final tvList =
        ResponseTv.fromJson(json.decode(readJson('dummy_data/tv_popular.json')))
            .tvList;

    test('should return list of tv when response code is 200 ', () async {
      ///arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/tv_popular.json'), 200));

      ///act
      final result = await dataSource.getTvPopular();

      ///assert
      expect(result, tvList);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      ///arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      ///act
      final call = dataSource.getTvPopular();

      ///assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
