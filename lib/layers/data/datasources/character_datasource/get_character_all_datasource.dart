import 'package:dbz_app/layers/domain/entities/character_entity.dart';

abstract class GetCharacterAllDataSource {
  Future<List<CharacterEntity>> call();
}
