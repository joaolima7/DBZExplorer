import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/usecases/character/delete_favorite_character_usecase/delete_favorite_character_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_all_characters_saveds_usecase/get_all_characters_saveds_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_character_saved_by_name_usecase/get_character_saved_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/save_favorites_characters_usecase/save_favorites_characters_usecase.dart';

class CharacterDaoController {
  SaveFavoritesCharactersUseCase _saveFavoritesCharactersUseCase;
  DeleteFavoriteCharacterUseCase _deleteFavoriteCharacterUseCase;
  GetAllCharactersSavedsUseCase _getAllCharactersSavedsUseCase;
  GetCharacterSavedByNameUseCase _getCharacterSavedByNameUseCase;

  CharacterDaoController(
      this._deleteFavoriteCharacterUseCase,
      this._saveFavoritesCharactersUseCase,
      this._getAllCharactersSavedsUseCase,
      this._getCharacterSavedByNameUseCase);

  Future<List<CharacterEntity>> getAllCharactersFavorites() async {
    return await _getAllCharactersSavedsUseCase();
  }

  Future<void> saveCharacterFavorite(CharacterEntity character) async {
    await _saveFavoritesCharactersUseCase(character);
  }

  Future<void> deleteCharacterFavorite(CharacterEntity character) async {
    await _deleteFavoriteCharacterUseCase(character);
  }

  Future<CharacterEntity?> findCharacterSaved(String name) async {
    return await _getCharacterSavedByNameUseCase(name);
  }
}
