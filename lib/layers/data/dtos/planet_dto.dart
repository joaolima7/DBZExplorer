import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

class PlanetDto extends PlanetEntity {
  PlanetDto({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
  });

  factory PlanetDto.fromJson(Map<String, dynamic> json) {
    return PlanetDto(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
