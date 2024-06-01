import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/presentation/controllers/character_dao_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CharacterDatailsPage extends StatelessWidget {
  final CharacterEntity character;

  const CharacterDatailsPage({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharacterDaoController characterDaoController =
        GetIt.I.get<CharacterDaoController>();
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: Text(
          'Informações do Personagem',
          style: TextStyle(
            color: Colors.white,
            fontSize: sizeScreen.width / 1.8 * .1,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              characterDaoController.saveCharacterFavorite(character);
            },
            icon: Icon(Icons.bookmark_add_outlined),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              character.image,
              fit: BoxFit.contain,
            ),
          ),
          // Content with Transparency
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.8)
                  ],
                ),
              ),
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Character Image
                  Center(
                    child: Image.network(
                      character.image,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Character Name
                  Text(
                    character.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIconText('POWERS', Icons.flash_on),
                      _buildIconText('ENDURANCE', Icons.shield),
                      _buildIconText('STRENGTH', Icons.fitness_center),
                      _buildIconText('WEAKNESS', Icons.warning),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Descrição:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    character.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconText(String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 40),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
