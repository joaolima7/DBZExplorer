import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/repositories/character/delete_favorite_character_repository.dart';
import 'package:dbz_app/layers/domain/usecases/character/delete_favorite_character/delete_favorite_character_usecase.dart';

class DeleteFavoriteCharacterUseCaseImp
    implements DeleteFavoriteCharacterUseCase {
  DeleteFavoriteCharacterRepository deleteFavoriteCharacterRepository;
  DeleteFavoriteCharacterUseCaseImp(this.deleteFavoriteCharacterRepository);

  @override
  Future<void> call(CharacterEntity character) async {
    await deleteFavoriteCharacterRepository(character);
  }
}
