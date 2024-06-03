import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

abstract class GetPlanetSavedByNameRepository {
  Future<PlanetEntity?> call(String name);
}
