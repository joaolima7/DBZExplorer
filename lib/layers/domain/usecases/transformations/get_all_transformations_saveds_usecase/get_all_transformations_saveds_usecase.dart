import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

abstract class GetAllTransformationsSavedsUseCase {
  Future<List<TransformationEntity>> call();
}
