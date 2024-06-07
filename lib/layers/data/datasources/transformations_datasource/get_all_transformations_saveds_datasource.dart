import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

abstract class GetAllTransformationsSavedsDataSource {
  Future<List<TransformationEntity>> call();
}
