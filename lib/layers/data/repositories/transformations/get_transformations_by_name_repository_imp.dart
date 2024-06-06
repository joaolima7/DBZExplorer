import 'package:dbz_app/layers/data/datasources/transformations_datasource/get_transformations_by_name_datasource.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/get_transformations_by_name_repository.dart';

class GetTransformationsByNameRepositoryImp
    implements GetTransformationsByNameRepository {
  GetTransformationsByNameDataSource _getTransformationsByNameDataSource;
  GetTransformationsByNameRepositoryImp(
      this._getTransformationsByNameDataSource);

  @override
  Future<List<TransformationEntity>> call(String name) async {
    return await _getTransformationsByNameDataSource(name);
  }
}
