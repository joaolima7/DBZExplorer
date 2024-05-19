import 'package:dbz_app/layers/domain/entities/character_entity.dart';

class CharacterDto extends CharacterEntity {
  CharacterDto({
    required super.id,
    required super.name,
    required super.ki,
    required super.race,
    required super.gender,
    required super.description,
    required super.image,
  });

  factory CharacterDto.fromJson(Map<String, dynamic> json) {
    return CharacterDto(
      id: json['id'],
      name: json['name'],
      ki: json['ki'],
      race: json['race'],
      gender: json['gender'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'name': name,
      'ki': ki,
      'race': race,
      'gender': gender,
      'description': description,
      'image': image
    };
  }
}
