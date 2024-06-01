import 'package:dbz_app/layers/data/datasources/character_datasource/delete_favorite_character_datasource.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/repositories/character/delete_favorite_character_repository.dart';

class DeleteFavoriteCharacterRepositoryImp
    implements DeleteFavoriteCharacterRepository {
  DeleteFavoriteCharacterDataSource deleteFavoriteCharacterDataSource;
  DeleteFavoriteCharacterRepositoryImp(this.deleteFavoriteCharacterDataSource);

  @override
  Future<void> call(CharacterEntity character) async {
    await deleteFavoriteCharacterDataSource(character);
  }
}
