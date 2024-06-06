import 'package:floor/floor.dart';

@Entity(tableName: 'transformations')
class TransformationEntity {
  @PrimaryKey(autoGenerate: true)
  int id;

  String name;
  String image;
  String ki;

  TransformationEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.ki,
  });
}
