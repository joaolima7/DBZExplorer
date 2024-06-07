import 'package:dbz_app/layers/data/dao/database.dart';
import 'package:dbz_app/layers/data/dao/transformation_dao.dart';
import 'package:dbz_app/layers/data/datasources/transformations_datasource/get_transformations_saveds_by_name_datasource.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

class GetTransformationsSavedsByNameLocalDataSourceImp
    implements GetTransformationsSavedsByNameDataSource {
  @override
  Future<TransformationEntity?> call(String name) async {
    try {
      final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      TransformationDao transformationDao = database.transformationDao;
      return await transformationDao.findTransformationByName(name);
    } catch (e) {
      throw Exception('Falha ao recuperar Transformações: $e');
    }
  }
}
