import 'package:dbz_app/layers/domain/entities/character_entity.dart';

abstract class DeleteFavoriteCharacterUseCase {
  Future<void> call(CharacterEntity character);
}
