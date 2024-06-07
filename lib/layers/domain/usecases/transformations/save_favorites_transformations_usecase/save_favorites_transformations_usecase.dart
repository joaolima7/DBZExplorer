import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

abstract class SaveFavoritesTransformationsUseCase {
  Future<void> call(TransformationEntity transformation);
}
