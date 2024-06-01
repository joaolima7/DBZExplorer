import 'package:dbz_app/layers/data/dao/character_dao.dart';
import 'package:dbz_app/layers/data/dao/database.dart';
import 'package:dbz_app/layers/data/datasources/character_datasource/delete_favorite_character_datasource.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';

class DeleteFavoriteCharacterLocalDataSourceImp
    implements DeleteFavoriteCharacterDataSource {
  @override
  Future<void> call(CharacterEntity character) async {
    try {
      final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      CharacterDao characterDao = database.characterDao;
      await characterDao.removeCharacter(character);
    } catch (e) {
      throw Exception('Falha ao excluir personagem!');
    }
  }
}
