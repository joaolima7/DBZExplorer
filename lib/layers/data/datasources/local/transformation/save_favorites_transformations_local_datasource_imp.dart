import 'package:dbz_app/layers/data/dao/database.dart';
import 'package:dbz_app/layers/data/dao/transformation_dao.dart';
import 'package:dbz_app/layers/data/datasources/transformations_datasource/save_favorites_transformations_datasource.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

class SaveFavoritesTransformationsLocalDataSourceImp
    implements SaveFavoritesTransformationsDataSource {
  @override
  Future<void> call(TransformationEntity transformation) async {
    try {
      final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      TransformationDao transformationDao = database.transformationDao;
      await transformationDao.addTransformations(transformation);
    } catch (e) {}
  }
}
