import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/delete_favorite_transformation_usecase/delete_favorite_transformation_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_all_transformations_saveds_usecase/get_all_transformations_saveds_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_transformation_saved_by_name_usecase/get_transformation_saved_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/save_favorites_transformations_usecase/save_favorites_transformations_usecase.dart';

class TransformationsDaoController {
  DeleteFavoriteTransformationUseCase _deleteFavoriteTransformationUseCase;
  GetAllTransformationsSavedsUseCase _getAllTransformationsSavedsUseCase;
  GetTransformationsSavedByNameUseCase _getTransformationsSavedByNameUseCase;
  SaveFavoritesTransformationsUseCase _saveFavoritesTransformationsUseCase;

  TransformationsDaoController(
    this._deleteFavoriteTransformationUseCase,
    this._getAllTransformationsSavedsUseCase,
    this._getTransformationsSavedByNameUseCase,
    this._saveFavoritesTransformationsUseCase,
  );

  Future<void> deleteTransformation(TransformationEntity transformation) async {
    await _deleteFavoriteTransformationUseCase(transformation);
  }

  Future<List<TransformationEntity>> getAllTransformations() async {
    return await _getAllTransformationsSavedsUseCase();
  }

  Future<TransformationEntity?> getAllTransformationsSavedByName(
      String name) async {
    return await _getTransformationsSavedByNameUseCase(name);
  }

  Future<void> saveTransformation(TransformationEntity transformation) async {
    await _saveFavoritesTransformationsUseCase(transformation);
  }
}
