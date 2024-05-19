import 'package:dbz_app/layers/domain/entities/character_entity.dart';

abstract class GetCharacterByNameRepository {
  Future<List<CharacterEntity>> call(String name);
}
