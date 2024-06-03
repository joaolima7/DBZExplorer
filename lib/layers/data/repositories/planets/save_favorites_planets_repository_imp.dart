import 'package:dbz_app/layers/data/datasources/planets_datasource/save_favorites_planets_datasource.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/repositories/planets/save_favorites_planets_repository.dart';

class SaveFavoritesPlanetsRepositoryImp
    implements SaveFavoritesPlanetsRepository {
  SaveFavoritesPlanetsDataSource _saveFavoritesPlanetsDaaSource;
  SaveFavoritesPlanetsRepositoryImp(this._saveFavoritesPlanetsDaaSource);

  @override
  Future<void> call(PlanetEntity planet) async {
    await _saveFavoritesPlanetsDaaSource(planet);
  }
}
