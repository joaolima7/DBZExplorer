import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

abstract class GetPlanetSavedByNameDataSource {
  Future<PlanetEntity?> call(String name);
}
