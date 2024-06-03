import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/repositories/planets/delete_favorite_planet_repository.dart';
import 'package:dbz_app/layers/domain/usecases/planets/delete_favorite_planet_usecase/delete_favorite_planet_usecase.dart';

class DeleteFavoritePlanetUseCaseImp implements DeleteFavoritePlanetUseCase {
  DeleteFavoritePlanetRepository _deleteFavoritePlanetRepository;
  DeleteFavoritePlanetUseCaseImp(this._deleteFavoritePlanetRepository);

  @override
  Future<void> call(PlanetEntity planet) async {
    _deleteFavoritePlanetRepository;
  }
}
