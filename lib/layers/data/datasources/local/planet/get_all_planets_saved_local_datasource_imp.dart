import 'package:dbz_app/layers/data/dao/database.dart';
import 'package:dbz_app/layers/data/dao/planet_dao.dart';
import 'package:dbz_app/layers/data/datasources/planets_datasource/get_all_planets_saved_datasource.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

class GetAllPlanetsSavedLocalDataSourceImp
    implements GetAllPlanetsSavedDataSource {
  @override
  Future<List<PlanetEntity>> call() async {
    try {
      final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      PlanetDao planetDao = database.planetDao;
      return await planetDao.getAllPlanets();
    } catch (e) {
      throw Exception('Falha ao carregar Planetas favoritos!');
    }
  }
}
