import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return Character not null', () {
    CharacterEntity character = CharacterEntity(
      id: 1,
      name: 'Goku',
      ki: '20.000',
      race: 'Saiyan',
      gender: 'Male',
      description: 'Muito forte!',
      image: 'image.png',
    );

    expect(character, isNotNull);
  });
}
