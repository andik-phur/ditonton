import 'package:equatable/equatable.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/models/tv_model/tv_model.dart';

class ResponseTv extends Equatable {
  final List<ModelTv> tvList;

  const ResponseTv({required this.tvList});

  factory ResponseTv.fromJson(Map<String, dynamic> json) => ResponseTv(
        tvList: List<ModelTv>.from((json['results'] as List)
            .map((e) => ModelTv.fromJson(e))
            .where((element) => element.backdropPath != null)),
      );

  Map<String, dynamic> toJson() => {
        'results': List<dynamic>.from(tvList.map((e) => e.toJson())),
      };

  @override
  List<Object?> get props => [
        tvList,
      ];
}
