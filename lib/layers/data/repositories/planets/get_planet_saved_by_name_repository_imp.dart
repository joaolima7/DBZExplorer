import 'package:dbz_app/layers/data/datasources/planets_datasource/get_planet_saved_by_name_datasource.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/repositories/planets/get_planet_saved_by_name_repository.dart';

class GetPlanetSavedByNameRepositoryImp
    implements GetPlanetSavedByNameRepository {
  GetPlanetSavedByNameDataSource _getPlanetSavedByNameDataSource;
  GetPlanetSavedByNameRepositoryImp(this._getPlanetSavedByNameDataSource);

  @override
  Future<PlanetEntity?> call(String name) async {
    return await _getPlanetSavedByNameDataSource(name);
  }
}
