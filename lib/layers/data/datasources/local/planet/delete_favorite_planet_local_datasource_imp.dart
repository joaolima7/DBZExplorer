import 'package:dbz_app/layers/data/dao/database.dart';
import 'package:dbz_app/layers/data/dao/planet_dao.dart';
import 'package:dbz_app/layers/data/datasources/planets_datasource/delete_favorite_planet_datasource.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

class DeleteFavoritePlanetLocalDataSourceImp
    implements DeleteFavoritePlanetDataSource {
  @override
  Future<void> call(PlanetEntity planet) async {
    try {
      final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      PlanetDao planetDao = database.planetDao;
      await planetDao.removePlanet(planet);
    } catch (e) {
      throw Exception('Falha ao excluir planeta!');
    }
  }
}
