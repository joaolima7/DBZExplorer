import 'package:dbz_app/layers/data/datasources/planets/get_planets_by_name_datasource.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/repositories/planets/get_planets_by_name_repository.dart';

class GetPlanetsByNameRepositoryImp implements GetPlanetsByNameRepository {
  GetPlanetsByNameDataSource _getPlanetsByNameDataSource;
  GetPlanetsByNameRepositoryImp(this._getPlanetsByNameDataSource);

  @override
  Future<List<PlanetEntity>> call(String name) async {
    return await _getPlanetsByNameDataSource(name);
  }
}
