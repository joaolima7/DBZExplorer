import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/repositories/character/get_all_characters_saveds_repository.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_all_characters_saveds_usecase/get_all_characters_saveds_usecase.dart';

class GetAllCharactersSavedsUseCaseImp
    implements GetAllCharactersSavedsUseCase {
  GetAllCharactersSavedsRepository getAllCharactersSavedsRepository;
  GetAllCharactersSavedsUseCaseImp(this.getAllCharactersSavedsRepository);

  @override
  Future<List<CharacterEntity>> call() async {
    return await getAllCharactersSavedsRepository();
  }
}
