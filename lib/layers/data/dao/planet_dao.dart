import 'package:dbz_app/layers/data/dao/models/planet_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class PlanetDao {
  @Query('SELECT * FROM planets')
  Future<List<PlanetModel>> getAllPlanets();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addPlanets(PlanetModel planet);

  @delete
  Future<void> removePlanet(PlanetModel planet);
}
