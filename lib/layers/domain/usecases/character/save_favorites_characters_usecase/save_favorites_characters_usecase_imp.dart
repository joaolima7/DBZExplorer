import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/repositories/character/save_favorites_characters_repository.dart';
import 'package:dbz_app/layers/domain/usecases/character/save_favorites_characters_usecase/save_favorites_characters_usecase.dart';

class SaveFavoritesCharactersUseCaseImp
    implements SaveFavoritesCharactersUseCase {
  SaveFavoritesCharactersRepository saveFavoritesCharactersRepository;
  SaveFavoritesCharactersUseCaseImp(this.saveFavoritesCharactersRepository);

  @override
  Future<void> call(CharacterEntity character) async {
    saveFavoritesCharactersRepository(character);
  }
}
