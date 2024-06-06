import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

abstract class GetTransformationsAllDataSource {
  Future<List<TransformationEntity>> call();
}
