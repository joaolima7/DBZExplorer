import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

abstract class GetTransformationsSavedByNameUseCase {
  Future<TransformationEntity?> call(String name);
}
