import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/repositories/planets/save_favorites_planets_repository.dart';
import 'package:dbz_app/layers/domain/usecases/planets/save_favorites_planets_usecase/save_favorites_planets_usecase.dart';

class SaveFavoritesPlanetsUseCaseImp implements SaveFavoritesPlanetsUsecase {
  SaveFavoritesPlanetsRepository _saveFavoritesPlanetsRepository;
  SaveFavoritesPlanetsUseCaseImp(this._saveFavoritesPlanetsRepository);

  @override
  Future<void> call(PlanetEntity planet) async {
    await _saveFavoritesPlanetsRepository(planet);
  }
}
