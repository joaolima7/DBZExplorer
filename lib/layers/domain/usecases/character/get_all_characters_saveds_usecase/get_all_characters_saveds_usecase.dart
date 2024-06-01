import 'package:dbz_app/layers/domain/entities/character_entity.dart';

abstract class GetAllCharactersSavedsUseCase {
  Future<List<CharacterEntity>> call();
}
