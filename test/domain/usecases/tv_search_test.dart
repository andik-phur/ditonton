import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/search_tv.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvSearch usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = TvSearch(mockTvRepository);
  });

  final tv = <Television>[];
  final tQuery = "Spiderman";
  test('should get list of movies from the repository', () async {
    ///arrange
    when(mockTvRepository.Tvsearch(tQuery)).thenAnswer((_) async => Right(tv));

    ///act
    final result = await usecase.execute(tQuery);

    ///assert
    expect(result, Right(tv));
  });
}
