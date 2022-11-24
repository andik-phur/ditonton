import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/common/exception.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/models/tv_model/tv_detail_model.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/models/tv_model/tv_model.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/models/tv_model/tv_respone.dart';

abstract class TvRemoteDataSource {
  Future<List<ModelTv>> getTvPopular();
  Future<List<ModelTv>> searchTv(String query);
  Future<DetailTvModelResponse> getDetailTv(int id);
  Future<List<ModelTv>> getTvOnTheAir();
  Future<List<ModelTv>> getTvRecommendations(int id);
  Future<List<ModelTv>> getTvTopRated();
}

class TvRemoteDataSourceImpl implements TvRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';
  final http.Client client;
  TvRemoteDataSourceImpl({required this.client});

  @override
  Future<DetailTvModelResponse> getDetailTv(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));
    if (response.statusCode == 200) {
      return DetailTvModelResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ModelTv>> getTvRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));
    if (response.statusCode == 200) {
      return ResponseTv.fromJson(json.decode(response.body)).tvList;
    }
    throw ServerException();
  }

  @override
  Future<List<ModelTv>> getTvOnTheAir() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));
    if (response.statusCode == 200) {
      return ResponseTv.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ModelTv>> getTvPopular() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));
    if (response.statusCode == 200) {
      return ResponseTv.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ModelTv>> getTvTopRated() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));
    if (response.statusCode == 200) {
      return ResponseTv.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ModelTv>> searchTv(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'));
    if (response.statusCode == 200) {
      return ResponseTv.fromJson(json.decode(response.body)).tvList;
    } else {
      throw ServerException();
    }
  }
}
