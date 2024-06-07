import 'package:dbz_app/layers/data/datasources/transformations_datasource/get_transformations_saveds_by_name_datasource.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/get_transformations_saveds_by_name_repository.dart';

class GetTransformationsSavedsByNameRepositoryImp
    implements GetTransformationsSavedsByNameRepository {
  GetTransformationsSavedsByNameDataSource
      _getTransformationsSavedsByNameDataSource;
  GetTransformationsSavedsByNameRepositoryImp(
      this._getTransformationsSavedsByNameDataSource);

  @override
  Future<TransformationEntity?> call(String name) async {
    return await _getTransformationsSavedsByNameDataSource(name);
  }
}
