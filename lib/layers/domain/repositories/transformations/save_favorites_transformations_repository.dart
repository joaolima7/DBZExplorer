import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

abstract class SaveFavoritesTransformationsRepository {
  Future<void> call(TransformationEntity transformation);
}
