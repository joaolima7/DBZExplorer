import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/repositories/planets/get_all_planets_saved_repository.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_all_planets_saved_usecase/get_all_planets_saved_usecase.dart';

class GetAllPlanetsSavedUseCaseImp implements GetAllPlanetsSavedUseCase {
  GetAllPlanetsSavedRepository _getAllPlanetsSavedRepository;
  GetAllPlanetsSavedUseCaseImp(this._getAllPlanetsSavedRepository);

  @override
  Future<List<PlanetEntity>> call() async {
    return await _getAllPlanetsSavedRepository();
  }
}
