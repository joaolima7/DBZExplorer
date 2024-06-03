import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

abstract class GetPlanetSavedByNameUseCase {
  Future<PlanetEntity?> call(String name);
}
