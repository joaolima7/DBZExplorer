import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/repositories/character/get_character_all_repository.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_all_usecase/get_characters_all_usecase.dart';

class GetCharacterAllUseCaseImp implements GetCharactersAllUseCase {
  GetCharacterAllRepository _getCharacterAllRepository;
  GetCharacterAllUseCaseImp(this._getCharacterAllRepository);

  @override
  Future<List<CharacterEntity>> call() async {
    return await _getCharacterAllRepository();
  }
}
