import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

abstract class GetAllPlanetsSavedUseCase {
  Future<List<PlanetEntity>> call();
}
