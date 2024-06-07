import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/save_favorites_transformations_repository.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/save_favorites_transformations_usecase/save_favorites_transformations_usecase.dart';

class SaveFavoritesTransformationsUseCaseImp
    implements SaveFavoritesTransformationsUseCase {
  SaveFavoritesTransformationsRepository
      _saveFavoritesTransformationsRepository;
  SaveFavoritesTransformationsUseCaseImp(
      this._saveFavoritesTransformationsRepository);

  @override
  Future<void> call(TransformationEntity transformation) async {
    await _saveFavoritesTransformationsRepository(transformation);
  }
}
