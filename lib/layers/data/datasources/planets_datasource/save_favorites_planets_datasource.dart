import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

abstract class SaveFavoritesPlanetsDataSource {
  Future<void> call(PlanetEntity planet);
}
