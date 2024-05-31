import 'package:dbz_app/layers/domain/entities/character_entity.dart';

abstract class SaveFavoritesCharactersRepository {
  Future<void> call(CharacterEntity character);
}
