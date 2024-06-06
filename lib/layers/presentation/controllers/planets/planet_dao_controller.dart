import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/usecases/planets/delete_favorite_planet_usecase/delete_favorite_planet_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_all_planets_saved_usecase/get_all_planets_saved_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planet_saved_by_name_usecase/get_planet_saved_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/planets/save_favorites_planets_usecase/save_favorites_planets_usecase.dart';

class PlanetDaoController {
  DeleteFavoritePlanetUseCase _deleteFavoritePlanetUseCase;
  GetAllPlanetsSavedUseCase _getAllPlanetsSavedUseCase;
  GetPlanetSavedByNameUseCase _getPlanetSavedByNameUseCase;
  SaveFavoritesPlanetsUsecase _saveFavoritesPlanetsUsecase;

  PlanetDaoController(
    this._deleteFavoritePlanetUseCase,
    this._getAllPlanetsSavedUseCase,
    this._getPlanetSavedByNameUseCase,
    this._saveFavoritesPlanetsUsecase,
  );

  Future<List<PlanetEntity>> getAllPlanetsFavorites() async {
    return await _getAllPlanetsSavedUseCase();
  }

  Future<void> savePlanetFavorite(PlanetEntity planet) async {
    await _saveFavoritesPlanetsUsecase(planet);
  }

  Future<void> deletePlanetFavorite(PlanetEntity planet) async {
    await _deleteFavoritePlanetUseCase(planet);
  }

  Future<PlanetEntity?> findPlanetSavedByName(String name) async {
    return await _getPlanetSavedByNameUseCase(name);
  }
}
