import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/get_transformations_saveds_by_name_repository.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_transformation_saved_by_name_usecase/get_transformation_saved_by_name_usecase.dart';

class GetTransformationsSavedByNameUseCaseImp
    implements GetTransformationsSavedByNameUseCase {
  GetTransformationsSavedsByNameRepository
      _getTransformationsSavedsByNameRepository;
  GetTransformationsSavedByNameUseCaseImp(
      this._getTransformationsSavedsByNameRepository);

  @override
  Future<TransformationEntity?> call(String name) async {
    return await _getTransformationsSavedsByNameRepository(name);
  }
}
