import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/repositories/planets/get_planets_by_name_repository.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planets_by_name_usecase/get_planets_by_name_usecase.dart';

class GetPlanetsByNameUseCaseImp implements GetPlanetsByNameUseCase {
  GetPlanetsByNameRepository _getPlanetsByNameRepository;
  GetPlanetsByNameUseCaseImp(this._getPlanetsByNameRepository);

  @override
  Future<List<PlanetEntity>> call(String name) async {
    return await _getPlanetsByNameRepository(name);
  }
}
