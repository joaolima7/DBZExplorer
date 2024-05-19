import 'package:dbz_app/layers/data/datasources/api/dbz_api/character/get_character_all_api_datasource_imp.dart';
import 'package:dbz_app/layers/data/repositories/character/get_character_all_repository_imp.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_all_usecase/get_characters_all_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_all_usecase/get_characters_all_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return a list of characters', () async {
    GetCharactersAllUseCase _useCase = GetCharacterAllUseCaseImp(
        GetCharacterAllRepositoryImp(GetCharacterAllApiDataSourceImp()));
    var result = await _useCase();

    expect(result, isInstanceOf<List<CharacterEntity>>());
  });
}
