import 'package:dbz_app/layers/domain/entities/character_entity.dart';

abstract class GetAllCharactersSavedsDataSource {
  Future<List<CharacterEntity>> call();
}
