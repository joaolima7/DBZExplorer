import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_transformations_all_usecase/get_transformations_all_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_transformations_by_name_usecase/get_transformations_by_name_usecase.dart';

class TransformationsController {
  GetTransformationsAllUseCase _getTransformationsAllUseCase;
  GetTransformationsByNameUseCase _getTransformationsByNameUseCase;

  TransformationsController(
    this._getTransformationsAllUseCase,
    this._getTransformationsByNameUseCase,
  );

  Future<List<TransformationEntity>> getAllTransformations() async {
    return await _getTransformationsAllUseCase();
  }

  Future<List<TransformationEntity>> getTrasnformationsByName(
      String name) async {
    return await _getTransformationsByNameUseCase(name);
  }
}
