import 'package:dbz_app/layers/data/dao/character_dao.dart';
import 'package:dbz_app/layers/data/dao/database.dart';
import 'package:dbz_app/layers/data/datasources/character_datasource/get_character_saved_by_name_datasource.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';

class GetCharacterSavedByNameLocalDataSourceImp
    implements GetCharacterSavedByNameDataSource {
  @override
  Future<CharacterEntity?> call(String name) async {
    try {
      final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      CharacterDao characterDao = database.characterDao;
      return await characterDao.findCharacterByName(name);
    } catch (e) {}
  }
}
