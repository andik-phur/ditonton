import 'package:flutter_test/flutter_test.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/data/models/genre_model.dart';
import 'package:nontonin_with_clean_arcitectur_and_test_driven_development_flutter/domain/entities/genre.dart';

void main() {
  final genreModel = GenresModel(id: 1, name: 'name');
  final genre = Genre(id: 1, name: 'name');

  test('should be a subclass of genre entity', () async {
    final result = genreModel.toEntity();
    expect(result, genre);
  });
}
