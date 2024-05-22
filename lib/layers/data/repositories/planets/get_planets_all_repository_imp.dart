import 'package:dbz_app/layers/data/datasources/planets/get_planets_all_datasource.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/repositories/planets/get_planets_all_repository.dart';

class GetPlanetsAllRepositoryImp implements GetPlanetsAllRepository {
  GetPlanetsAllDataSource _getPlanetsAllDataSource;
  GetPlanetsAllRepositoryImp(this._getPlanetsAllDataSource);

  @override
  Future<List<PlanetEntity>> call() async {
    return await _getPlanetsAllDataSource();
  }
}
