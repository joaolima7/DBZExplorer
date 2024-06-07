import 'package:dbz_app/layers/data/dao/database.dart';
import 'package:dbz_app/layers/data/dao/transformation_dao.dart';
import 'package:dbz_app/layers/data/datasources/transformations_datasource/delete_favorite_transformation_datasource.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

class DeleteFavoriteTransformationLocalDataSourceImp
    implements DeleteFavoriteTransformationDataSource {
  @override
  Future<void> call(TransformationEntity transformation) async {
    try {
      final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      TransformationDao transformationDao = database.transformationDao;
      await transformationDao.removeTransformations(transformation);
    } catch (e) {
      throw Exception('Falha o excluir Transformação!');
    }
  }
}
