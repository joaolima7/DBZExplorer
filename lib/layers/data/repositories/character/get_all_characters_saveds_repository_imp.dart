import 'package:dbz_app/layers/data/datasources/character_datasource/get_all_characters_saveds_datasource.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/repositories/character/get_all_characters_saveds_repository.dart';

class GetAllCharactersSavedsRepositoryImp
    implements GetAllCharactersSavedsRepository {
  GetAllCharactersSavedsDataSource getAllCharactersSavedsDataSource;
  GetAllCharactersSavedsRepositoryImp(this.getAllCharactersSavedsDataSource);

  @override
  Future<List<CharacterEntity>> call() async {
    return await getAllCharactersSavedsDataSource();
  }
}
