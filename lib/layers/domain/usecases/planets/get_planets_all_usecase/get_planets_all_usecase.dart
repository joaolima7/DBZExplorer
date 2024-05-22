import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

abstract class GetPlanetsAllUseCase {
  Future<List<PlanetEntity>> call();
}
