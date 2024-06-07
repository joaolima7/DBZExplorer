import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

abstract class GetAllTransformationsSavedsRepository {
  Future<List<TransformationEntity>> call();
}
