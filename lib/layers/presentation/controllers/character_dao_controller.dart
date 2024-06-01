import 'package:dbz_app/layers/data/datasources/local/character/get_character_all_local_datasource_imp.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_all_characters_saveds_usecase/get_all_characters_saveds_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_all_usecase/get_characters_all_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/save_favorites_characters_usecase/save_favorites_characters_usecase.dart';

class CharacterDaoController {
  SaveFavoritesCharactersUseCase _saveFavoritesCharactersUseCase;
  GetCharactersAllUseCase _getCharactersAllUseCase;
  GetAllCharactersSavedsUseCase _getAllCharactersSavedsUseCase;

  CharacterDaoController(
    this._getCharactersAllUseCase,
    this._saveFavoritesCharactersUseCase,
    this._getAllCharactersSavedsUseCase,
  );

  Future<List<CharacterEntity>> getAllCharactersFavorites() async {
    return await _getAllCharactersSavedsUseCase();
  }

  Future<void> saveCharacterFavorite(CharacterEntity character) async {
    await _saveFavoritesCharactersUseCase(character);
  }
}
