import 'package:dbz_app/layers/data/datasources/api/dbz_api/character/get_character_by_name_api_datasource_imp.dart';
import 'package:dbz_app/layers/data/repositories/character/get_character_by_name_repository_imp.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_by_name_usecase/get_characters_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_by_name_usecase/get_characters_by_name_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return a list of character', () async {
    GetCharactersByNameUseCase _useCase = GetCharactersByNameUseCaseImp(
        GetCharacterByNameRepositoryImp(GetCharacterByNameApiDataSourceImp()));

    var result = await _useCase('goku');

    expect(result, isInstanceOf<List<CharacterEntity>>());
  });
}
