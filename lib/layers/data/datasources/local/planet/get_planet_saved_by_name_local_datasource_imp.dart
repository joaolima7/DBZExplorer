import 'package:dbz_app/layers/data/dao/database.dart';
import 'package:dbz_app/layers/data/dao/planet_dao.dart';
import 'package:dbz_app/layers/data/datasources/planets_datasource/get_planet_saved_by_name_datasource.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

class GetPlanetSavedByNameLocalDataSourceImp
    implements GetPlanetSavedByNameDataSource {
  @override
  Future<PlanetEntity?> call(String name) async {
    try {
      final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      PlanetDao planetDao = database.planetDao;
      return await planetDao.findPlanetByName(name);
    } catch (e) {}
  }
}
