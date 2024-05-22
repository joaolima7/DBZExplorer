import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

abstract class GetPlanetsByNameRepository {
  Future<List<PlanetEntity>> call(String name);
}
