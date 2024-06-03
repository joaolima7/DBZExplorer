import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

abstract class DeleteFavoritePlanetUseCase {
  Future<void> call(PlanetEntity planet);
}
