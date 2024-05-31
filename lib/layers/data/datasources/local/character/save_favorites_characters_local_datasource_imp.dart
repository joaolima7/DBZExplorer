import 'package:dbz_app/layers/data/dao/character_dao.dart';
import 'package:dbz_app/layers/data/dao/database.dart';
import 'package:dbz_app/layers/data/dao/models/character_model.dart';
import 'package:dbz_app/layers/data/datasources/character_datasource/save_favorites_characters_datasource.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';

class SaveFavoritesCharactersLocalDataSourceImp
    implements SaveFavoritesCharactersDataSource {
  @override
  Future<void> call(CharacterEntity character) async {
    try {
      final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      CharacterDao characterDao = database.characterDao;
      await characterDao.addCharacter(CharacterModel.fromEntity(character));
    } catch (e) {
      throw Exception('Falha ao carregar Favoritos!');
    }
  }
}
