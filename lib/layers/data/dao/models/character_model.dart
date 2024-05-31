import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'characters')
class CharacterModel extends CharacterEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;

  CharacterModel({
    required this.id,
    required String name,
    required String ki,
    required String race,
    required String gender,
    required String description,
    required String image,
  }) : super(
          id: id,
          name: name,
          ki: ki,
          race: race,
          gender: gender,
          description: description,
          image: image,
        );
}