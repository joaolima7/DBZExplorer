import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

abstract class GetTransformationsAllUseCase {
  Future<List<TransformationEntity>> call();
}
