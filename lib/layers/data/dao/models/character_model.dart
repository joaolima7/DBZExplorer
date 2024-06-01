import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:floor/floor.dart';

//@Entity(tableName: 'characters')
class CharacterModel {
  //@PrimaryKey(autoGenerate: true)
  final int id;
  final String name;
  final String ki;
  final String race;
  final String gender;
  final String description;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.ki,
    required this.race,
    required this.gender,
    required this.description,
    required this.image,
  });

  CharacterEntity toEntity() {
    return CharacterEntity(
      id: id,
      name: name,
      ki: ki,
      race: race,
      gender: gender,
      description: description,
      image: image,
    );
  }

  factory CharacterModel.fromEntity(CharacterEntity entity) {
    return CharacterModel(
      id: entity.id,
      name: entity.name,
      ki: entity.ki,
      race: entity.race,
      gender: entity.gender,
      description: entity.description,
      image: entity.image,
    );
  }
}
