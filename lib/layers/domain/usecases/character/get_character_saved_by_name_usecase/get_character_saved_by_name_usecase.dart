import 'package:dbz_app/layers/domain/entities/character_entity.dart';

abstract class GetCharacterSavedByNameUseCase {
  Future<CharacterEntity?> call(String name);
}
