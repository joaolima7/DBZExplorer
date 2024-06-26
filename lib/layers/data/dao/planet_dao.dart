import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class PlanetDao {
  @Query('SELECT * FROM planets')
  Future<List<PlanetEntity>> getAllPlanets();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addPlanets(PlanetEntity planet);

  @delete
  Future<void> removePlanet(PlanetEntity planet);

  @Query('SELECT * FROM planets WHERE name = :name')
  Future<PlanetEntity?> findPlanetByName(String name);
}
