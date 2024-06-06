import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_all_usecase/get_characters_all_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_by_name_usecase/get_characters_by_name_usecase.dart';

class CharacterController {
  GetCharactersAllUseCase _getCharactersAllUseCase;
  GetCharactersByNameUseCase _getCharactersByNameUseCase;

  CharacterController(
    this._getCharactersAllUseCase,
    this._getCharactersByNameUseCase,
  );

  Future<List<CharacterEntity>> getAllCharacters() async {
    return await _getCharactersAllUseCase();
  }

  Future<List<CharacterEntity>> getCharactersByName(String name) async {
    return await _getCharactersByNameUseCase(name);
  }
}
