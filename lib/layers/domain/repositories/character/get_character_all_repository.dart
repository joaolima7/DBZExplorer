import 'package:dbz_app/layers/domain/entities/character_entity.dart';

abstract class GetCharacterAllRepository {
  Future<List<CharacterEntity>> call();
}
