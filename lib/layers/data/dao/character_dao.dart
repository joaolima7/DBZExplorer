import 'package:dbz_app/layers/data/dao/models/character_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class CharacterDao {
  @Query('SELECT * FROM CHARACTERENTITY')
  Future<List<CharacterModel>> getAllCharacters();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addCharacter(CharacterModel character);

  @delete
  Future<void> removeCharacter(CharacterModel character);
}
