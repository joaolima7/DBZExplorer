// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:floor/floor.dart';

@Entity(tableName: 'characters')
class CharacterEntity {
  @PrimaryKey(autoGenerate: true)
  int id;

  String name;
  String ki;
  String race;
  String gender;
  String description;
  String image;

  CharacterEntity({
    required this.id,
    required this.name,
    required this.ki,
    required this.race,
    required this.gender,
    required this.description,
    required this.image,
  });
}
