import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/tv.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_popular_tv.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularTv usecase;
  late MockTvRepository mockTvRepository;
  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetPopularTv(mockTvRepository);
  });

  final tv = <Television>[];
  group('Get Popular TV Series', () {
    test(
        'should get list of tv from the repository when execute function is called',
        () async {
      ///arrange
      when(mockTvRepository.getPopularTv()).thenAnswer((_) async => Right(tv));

      ///act
      final result = await usecase.execute();

      ///assert
      expect(result, Right(tv));
    });
  });
}
