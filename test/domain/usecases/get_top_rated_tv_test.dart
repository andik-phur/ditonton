import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_top_rate_tv.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTopRatedTv usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTopRatedTv(mockTvRepository);
  });
  final tv = <Television>[];
  test('should get list of movies from repository', () async {
    ///arrange
    when(mockTvRepository.getTopRatedtv()).thenAnswer((_) async => Right(tv));

    ///act
    final result = await usecase.execute();

    ///assert
    expect(result, Right(tv));
  });
}
