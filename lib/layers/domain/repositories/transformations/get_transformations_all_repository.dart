import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

abstract class GetTransformationsAllRepository {
  Future<List<TransformationEntity>> call();
}
