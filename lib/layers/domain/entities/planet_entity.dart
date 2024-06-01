import 'package:floor/floor.dart';

@Entity(tableName: 'planets')
class PlanetEntity {
  @PrimaryKey(autoGenerate: true)
  int id;

  String name;
  String description;
  String image;

  PlanetEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });
}
