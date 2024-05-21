import 'package:dbz_app/layers/presentation/controllers/character_controller.dart';
import 'package:get_it/get_it.dart';

CharacterController _characterController = GetIt.I.get<CharacterController>();

const List<String> contentsTitle = [
  'Personagens',
  'Planetas',
  'Transformações'
];

const Map<String, dynamic> contentsTrailing = {
  'Personagens': 'assets/images/characters_logo.png',
  'Planetas': 'assets/images/planets.png',
  'Transformações': 'assets/images/goku_transformed.png',
};
