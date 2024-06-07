import 'package:dbz_app/layers/data/datasources/transformations_datasource/save_favorites_transformations_datasource.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/save_favorites_transformations_repository.dart';

class SaveFavoritesTransformationsRepositoryImp
    implements SaveFavoritesTransformationsRepository {
  SaveFavoritesTransformationsDataSource
      _saveFavoritesTransformationsDataSource;
  SaveFavoritesTransformationsRepositoryImp(
      this._saveFavoritesTransformationsDataSource);

  @override
  Future<void> call(TransformationEntity transformation) async {
    await _saveFavoritesTransformationsDataSource(transformation);
  }
}
