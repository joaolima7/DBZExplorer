import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/repositories/planets/get_planets_all_repository.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planets_all_usecase/get_planets_all_usecase.dart';

class GetPlanetsAllUseCaseImp implements GetPlanetsAllUseCase {
  GetPlanetsAllRepository _getPlanetsAllRepository;
  GetPlanetsAllUseCaseImp(this._getPlanetsAllRepository);

  @override
  Future<List<PlanetEntity>> call() async {
    return await _getPlanetsAllRepository();
  }
}
