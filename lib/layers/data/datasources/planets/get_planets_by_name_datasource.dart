import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

abstract class GetPlanetsByNameDataSource {
  Future<List<PlanetEntity>> call(String name);
}
