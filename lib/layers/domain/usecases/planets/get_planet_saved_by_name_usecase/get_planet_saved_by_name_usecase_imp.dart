import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/repositories/planets/get_planet_saved_by_name_repository.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planet_saved_by_name_usecase/get_planet_saved_by_name_usecase.dart';

class GetPlanetSavedByNameUseCaseImp implements GetPlanetSavedByNameUseCase {
  GetPlanetSavedByNameRepository _getPlanetSavedByNameRepository;
  GetPlanetSavedByNameUseCaseImp(this._getPlanetSavedByNameRepository);

  @override
  Future<PlanetEntity?> call(String name) async {
    return await _getPlanetSavedByNameRepository(name);
  }
}
