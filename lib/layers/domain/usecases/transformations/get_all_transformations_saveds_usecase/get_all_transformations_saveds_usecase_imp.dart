import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/get_all_transformations_saveds_repository.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_all_transformations_saveds_usecase/get_all_transformations_saveds_usecase.dart';

class GetAllTransformationsSavedsUseCaseImp
    implements GetAllTransformationsSavedsUseCase {
  GetAllTransformationsSavedsRepository _getAllTransformationsSavedsRepository;
  GetAllTransformationsSavedsUseCaseImp(
      this._getAllTransformationsSavedsRepository);

  @override
  Future<List<TransformationEntity>> call() async {
    return await _getAllTransformationsSavedsRepository();
  }
}
