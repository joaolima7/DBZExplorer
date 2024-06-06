import 'package:dbz_app/layers/data/datasources/transformations_datasource/get_transformations_all_datasource.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/get_transformations_all_repository.dart';

class GetTransformationsAllRepositoryImp
    implements GetTransformationsAllRepository {
  GetTransformationsAllDataSource _getTransformationsAllDataSource;
  GetTransformationsAllRepositoryImp(this._getTransformationsAllDataSource);

  @override
  Future<List<TransformationEntity>> call() async {
    return await _getTransformationsAllDataSource();
  }
}
