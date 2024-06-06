import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planets_all_usecase/get_planets_all_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planets_by_name_usecase/get_planets_by_name_usecase.dart';

class PlanetsController {
  GetPlanetsAllUseCase _getPlanetsAllUseCase;
  GetPlanetsByNameUseCase _getPlanetsByNameUseCase;

  PlanetsController(
    this._getPlanetsAllUseCase,
    this._getPlanetsByNameUseCase,
  );

  Future<List<PlanetEntity>> getAllPlanets() async {
    return await _getPlanetsAllUseCase();
  }

  Future<List<PlanetEntity>> getPlanetsByName(String name) async {
    return await _getPlanetsByNameUseCase(name);
  }
}
