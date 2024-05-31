import 'package:dbz_app/layers/data/dao/character_dao.dart';
import 'package:dbz_app/layers/data/dao/database.dart';
import 'package:dbz_app/layers/data/datasources/character_datasource/get_character_all_datasource.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';

class GetCharacterAllLocalDataSourceImp implements GetCharacterAllDataSource {
  @override
  Future<List<CharacterEntity>> call() async {
    try {
      final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      CharacterDao characterDao = database.characterDao;
      return await characterDao.getAllCharacters();
    } catch (e) {
      throw Exception('Falha ao carregar Favoritos!');
    }
  }
}
