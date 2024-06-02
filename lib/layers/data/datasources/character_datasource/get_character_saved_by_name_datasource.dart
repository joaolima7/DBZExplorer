import 'package:dbz_app/layers/domain/entities/character_entity.dart';

abstract class GetCharacterSavedByNameDataSource {
  Future<CharacterEntity?> call(String name);
}
