import 'package:dbz_app/layers/data/datasources/character_datasource/get_character_all_datasource.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/repositories/character/get_character_all_repository.dart';

class GetCharacterAllRepositoryImp implements GetCharacterAllRepository {
  GetCharacterAllDataSource _getCharacterAllDataSource;
  GetCharacterAllRepositoryImp(this._getCharacterAllDataSource);

  @override
  Future<List<CharacterEntity>> call() async {
    return await _getCharacterAllDataSource();
  }
}
