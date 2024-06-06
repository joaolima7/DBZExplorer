import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';

class TransformationDto extends TransformationEntity {
  TransformationDto({
    required super.id,
    required super.name,
    required super.image,
    required super.ki,
  });

  factory TransformationDto.fromJson(Map<String, dynamic> json) {
    return TransformationDto(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      ki: json['ki'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'ki': ki,
    };
  }
}
