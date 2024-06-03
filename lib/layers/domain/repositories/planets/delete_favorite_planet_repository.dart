import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

abstract class DeleteFavoritePlanetRepository {
  Future<void> call(PlanetEntity planet);
}
