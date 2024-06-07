import 'package:dbz_app/layers/domain/usecases/character/get_characters_by_name_usecase/get_characters_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planets_by_name_usecase/get_planets_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_transformations_by_name_usecase/get_transformations_by_name_usecase.dart';

class SearchingController {
  GetCharactersByNameUseCase _getCharactersByNameUseCase;
  GetPlanetsByNameUseCase _getPlanetsByNameUseCase;
  GetTransformationsByNameUseCase _getTransformationsByNameUseCase;

  SearchingController(this._getCharactersByNameUseCase,
      this._getPlanetsByNameUseCase, this._getTransformationsByNameUseCase);

  Future<List<dynamic>> search(String query) async {
    if (query.isEmpty) {
      return [];
    }
    final characters = await _getCharactersByNameUseCase(query);
    final planets = await _getPlanetsByNameUseCase(query);
    final transformations = await _getTransformationsByNameUseCase(query);
    return [...characters, ...planets, ...transformations];
  }
}
