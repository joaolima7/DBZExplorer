import 'package:dbz_app/layers/data/dao/database.dart';
import 'package:dbz_app/layers/data/dao/planet_dao.dart';
import 'package:dbz_app/layers/data/datasources/planets_datasource/save_favorites_planets_datasource.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

class SaveFavoritesPlanetsLocalDataSourceImp
    implements SaveFavoritesPlanetsDataSource {
  @override
  Future<void> call(PlanetEntity planet) async {
    try {
      final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      PlanetDao characterDao = database.planetDao;
      await characterDao.addPlanets(planet);
    } catch (e) {
      throw Exception('Falha ao Salvar Planeta!');
    }
  }
}
