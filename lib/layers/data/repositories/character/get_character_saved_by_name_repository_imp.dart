import 'package:dbz_app/layers/data/datasources/character_datasource/get_character_saved_by_name_datasource.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/repositories/character/get_character_saved_by_name_repository.dart';

class GetCharacterSavedByNameRepositoryImp
    implements GetCharacterSavedByNameRepository {
  GetCharacterSavedByNameDataSource _getCharacterSavedByNameDataSource;
  GetCharacterSavedByNameRepositoryImp(this._getCharacterSavedByNameDataSource);

  @override
  Future<CharacterEntity?> call(String name) async {
    return await _getCharacterSavedByNameDataSource(name);
  }
}
