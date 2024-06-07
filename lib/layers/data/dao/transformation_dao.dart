import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class TransformationDao {
  @Query('SELECT * FROM transformations')
  Future<List<TransformationEntity>> getAllTransformations();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addTransformations(TransformationEntity transformation);

  @delete
  Future<void> removeTransformations(TransformationEntity transformation);

  @Query('SELECT * FROM transformations WHERE name = :name')
  Future<TransformationEntity?> findTransformationByName(String name);
}
