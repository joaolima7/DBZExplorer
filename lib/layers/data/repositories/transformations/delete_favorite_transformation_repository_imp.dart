import 'package:dbz_app/layers/data/datasources/transformations_datasource/delete_favorite_transformation_datasource.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/delete_favorite_transformation_repository.dart';

class DeleteFavoriteTransformationRepositoryImp
    implements DeleteFavoriteTransformationRepository {
  DeleteFavoriteTransformationDataSource
      _deleteFavoriteTransformationDataSource;
  DeleteFavoriteTransformationRepositoryImp(
      this._deleteFavoriteTransformationDataSource);

  @override
  Future<void> call(TransformationEntity transformation) async {
    await _deleteFavoriteTransformationDataSource(transformation);
  }
}
