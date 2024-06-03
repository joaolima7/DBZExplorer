import 'package:dbz_app/layers/data/datasources/planets_datasource/get_all_planets_saved_datasource.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/repositories/planets/get_all_planets_saved_repository.dart';

class GetAllPlanetsSavedRespositoryImp implements GetAllPlanetsSavedRepository {
  GetAllPlanetsSavedDataSource _getAllPlanetsSavedDataSource;
  GetAllPlanetsSavedRespositoryImp(this._getAllPlanetsSavedDataSource);

  @override
  Future<List<PlanetEntity>> call() async {
    return await _getAllPlanetsSavedDataSource();
  }
}
