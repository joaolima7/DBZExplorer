import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/repositories/character/get_character_saved_by_name_repository.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_character_saved_by_name_usecase/get_character_saved_by_name_usecase.dart';

class GetCharacterSavedByNameUseCaseImp
    implements GetCharacterSavedByNameUseCase {
  GetCharacterSavedByNameRepository _getCharacterSavedByNameRepository;
  GetCharacterSavedByNameUseCaseImp(this._getCharacterSavedByNameRepository);

  @override
  Future<CharacterEntity?> call(String name) async {
    return await _getCharacterSavedByNameRepository(name);
  }
}
