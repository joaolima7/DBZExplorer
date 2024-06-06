import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/get_transformations_by_name_repository.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_transformations_by_name_usecase/get_transformations_by_name_usecase.dart';

class GetTransformationsByNameUseCaseImp
    implements GetTransformationsByNameUseCase {
  GetTransformationsByNameRepository _getTransformationsByNameRepository;
  GetTransformationsByNameUseCaseImp(this._getTransformationsByNameRepository);

  @override
  Future<List<TransformationEntity>> call(String name) async {
    return await _getTransformationsByNameRepository(name);
  }
}
