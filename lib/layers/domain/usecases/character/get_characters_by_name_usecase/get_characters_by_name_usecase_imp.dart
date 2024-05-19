import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/repositories/character/get_character_by_name_repository.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_by_name_usecase/get_characters_by_name_usecase.dart';

class GetCharactersByNameUseCaseImp implements GetCharactersByNameUseCase {
  GetCharacterByNameRepository _getCharacterByNameRepository;
  GetCharactersByNameUseCaseImp(this._getCharacterByNameRepository);

  @override
  Future<List<CharacterEntity>> call(String name) async {
    return await _getCharacterByNameRepository(name);
  }
}
