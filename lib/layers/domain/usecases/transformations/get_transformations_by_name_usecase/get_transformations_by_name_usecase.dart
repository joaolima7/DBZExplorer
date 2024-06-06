import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

abstract class GetTransformationsByNameUseCase {
  Future<List<TransformationEntity>> call(String name);
}
