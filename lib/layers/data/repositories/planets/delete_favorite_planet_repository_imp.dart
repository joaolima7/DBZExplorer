import 'package:dbz_app/layers/data/datasources/planets_datasource/delete_favorite_planet_datasource.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/repositories/planets/delete_favorite_planet_repository.dart';

class DeleteFavoritePlanetRepositoryImp
    implements DeleteFavoritePlanetRepository {
  DeleteFavoritePlanetDataSource _deleteFavoritePlanetDataSource;
  DeleteFavoritePlanetRepositoryImp(this._deleteFavoritePlanetDataSource);

  @override
  Future<void> call(PlanetEntity planet) async {
    await _deleteFavoritePlanetDataSource(planet);
  }
}
