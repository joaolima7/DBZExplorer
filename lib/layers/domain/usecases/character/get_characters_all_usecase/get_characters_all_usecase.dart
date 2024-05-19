import 'package:dbz_app/layers/domain/entities/character_entity.dart';

abstract class GetCharactersAllUseCase {
  Future<List<CharacterEntity>> call();
}
