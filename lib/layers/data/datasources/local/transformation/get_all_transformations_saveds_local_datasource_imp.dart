import 'package:dbz_app/layers/data/dao/database.dart';
import 'package:dbz_app/layers/data/dao/transformation_dao.dart';
import 'package:dbz_app/layers/data/datasources/transformations_datasource/get_all_transformations_saveds_datasource.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

class GetAllTransformationsSavedsLocalDataSourceImp
    implements GetAllTransformationsSavedsDataSource {
  @override
  Future<List<TransformationEntity>> call() async {
    try {
      final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      TransformationDao transformationDao = database.transformationDao;
      return await transformationDao.getAllTransformations();
    } catch (e) {
      throw Exception('Falha ao recuperar Transformações!');
    }
  }
}
