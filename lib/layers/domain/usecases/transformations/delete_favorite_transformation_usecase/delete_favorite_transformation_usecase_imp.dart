import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/delete_favorite_transformation_repository.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/delete_favorite_transformation_usecase/delete_favorite_transformation_usecase.dart';

class DeleteFavoriteTransformationUseCaseImp
    implements DeleteFavoriteTransformationUseCase {
  DeleteFavoriteTransformationRepository
      _deleteFavoriteTransformationRepository;
  DeleteFavoriteTransformationUseCaseImp(
      this._deleteFavoriteTransformationRepository);

  @override
  Future<void> call(TransformationEntity transformation) async {
    await _deleteFavoriteTransformationRepository(transformation);
  }
}
