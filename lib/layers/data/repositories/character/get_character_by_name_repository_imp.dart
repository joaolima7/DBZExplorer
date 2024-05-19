import 'package:dbz_app/layers/data/datasources/character_datasource/get_character_by_name_datasource.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/repositories/character/get_character_by_name_repository.dart';

class GetCharacterByNameRepositoryImp implements GetCharacterByNameRepository {
  GetCharacterByNameDataSoruce _getCharacterByNameDataSoruce;
  GetCharacterByNameRepositoryImp(this._getCharacterByNameDataSoruce);

  @override
  Future<List<CharacterEntity>> call(String name) async {
    return await _getCharacterByNameDataSoruce(name);
  }
}
