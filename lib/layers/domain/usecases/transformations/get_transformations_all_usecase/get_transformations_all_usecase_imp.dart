import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/get_transformations_all_repository.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_transformations_all_usecase/get_transformations_all_usecase.dart';

class GetTranformationsAllUseCaseImp implements GetTransformationsAllUseCase {
  GetTransformationsAllRepository _getTransformationsAllRepository;
  GetTranformationsAllUseCaseImp(this._getTransformationsAllRepository);

  @override
  Future<List<TransformationEntity>> call() async {
    return await _getTransformationsAllRepository();
  }
}
