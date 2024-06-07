import 'package:dbz_app/layers/data/datasources/transformations_datasource/get_all_transformations_saveds_datasource.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/get_all_transformations_saveds_repository.dart';

class GetAllTransformationsSavedsRepositoryImp
    implements GetAllTransformationsSavedsRepository {
  GetAllTransformationsSavedsDataSource _getAllTransformationsSavedsDataSource;
  GetAllTransformationsSavedsRepositoryImp(
      this._getAllTransformationsSavedsDataSource);

  @override
  Future<List<TransformationEntity>> call() async {
    return await _getAllTransformationsSavedsDataSource();
  }
}
