import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'planets')
class PlanetModel extends PlanetEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;

  PlanetModel({
    required this.id,
    required String name,
    required String description,
    required String image,
  }) : super(
          id: id,
          name: name,
          description: description,
          image: image,
        );
}
