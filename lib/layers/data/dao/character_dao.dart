import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class CharacterDao {
  @Query('SELECT * FROM characters')
  Future<List<CharacterEntity>> getAllCharacters();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addCharacter(CharacterEntity character);

  @delete
  Future<void> removeCharacter(CharacterEntity character);

  @Query('SELECT * FROM characters WHERE name = :name')
  Future<CharacterEntity?> findCharacterByName(String name);
}
