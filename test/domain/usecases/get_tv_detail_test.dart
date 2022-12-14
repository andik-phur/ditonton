import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/usecases/get_detail_tv.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetDetailTv usecase;
  late MockTvRepository mockTvRepository;
  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetDetailTv(mockTvRepository);
  });

  final tId = 1;
  test('should get movie detail from the repository', () async {
    ///arrange
    when(mockTvRepository.getDetailTv(tId))
        .thenAnswer((_) async => Right(testTvDetail));

    ///act
    final result = await usecase.execute(tId);

    ///assert
    expect(result, Right(testTvDetail));
  });
}
