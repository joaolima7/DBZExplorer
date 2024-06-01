import 'package:dbz_app/layers/domain/entities/character_entity.dart';

abstract class GetAllCharactersSavedsRepository {
  Future<List<CharacterEntity>> call();
}
