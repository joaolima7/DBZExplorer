import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

abstract class GetAllPlanetsSavedRepository {
  Future<List<PlanetEntity>> call();
}
