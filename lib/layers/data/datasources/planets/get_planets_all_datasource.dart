import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

abstract class GetPlanetsAllDataSource {
  Future<List<PlanetEntity>> call();
}
