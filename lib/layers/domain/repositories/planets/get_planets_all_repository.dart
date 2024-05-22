import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

abstract class GetPlanetsAllRepository {
  Future<List<PlanetEntity>> call();
}
