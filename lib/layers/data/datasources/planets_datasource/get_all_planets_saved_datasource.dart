import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

abstract class GetAllPlanetsSavedDataSource {
  Future<List<PlanetEntity>> call();
}
