import 'package:dbz_app/layers/domain/usecases/character/get_characters_by_name_usecase/get_characters_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planets_by_name_usecase/get_planets_by_name_usecase.dart';

class SearchingController {
  GetCharactersByNameUseCase _getCharactersByNameUseCase;
  GetPlanetsByNameUseCase _getPlanetsByNameUseCase;

  SearchingController(
    this._getCharactersByNameUseCase,
    this._getPlanetsByNameUseCase,
  );

  Future<List<dynamic>> search(String query) async {
    if (query.isEmpty) {
      return [];
    }
    final characters = await _getCharactersByNameUseCase(query);
    final planets = await _getPlanetsByNameUseCase(query);
    return [...characters, ...planets];
  }
}
