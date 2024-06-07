import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

abstract class DeleteFavoriteTransformationDataSource {
  Future<void> call(TransformationEntity transformation);
}
