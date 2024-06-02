import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/presentation/controllers/character_dao_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CharacterDatailsPage extends StatefulWidget {
  final CharacterEntity character;

  const CharacterDatailsPage({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  State<CharacterDatailsPage> createState() => _CharacterDatailsPageState();
}

class _CharacterDatailsPageState extends State<CharacterDatailsPage> {
  CharacterDaoController characterDaoController =
      GetIt.I.get<CharacterDaoController>();
  late Future<CharacterEntity?> _savedCharacterFuture;

  @override
  void initState() {
    super.initState();
    _savedCharacterFuture =
        characterDaoController.findCharacterSaved(widget.character.name);
  }

  void _toggleFavorite() async {
    final savedCharacter =
        await characterDaoController.findCharacterSaved(widget.character.name);
    if (savedCharacter == null) {
      await characterDaoController.saveCharacterFavorite(widget.character);
    } else {
      await characterDaoController.deleteCharacterFavorite(widget.character);
    }
    setState(() {
      _savedCharacterFuture =
          characterDaoController.findCharacterSaved(widget.character.name);
    });
  }

  @override
  Widget build(BuildContext context) {
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
          FutureBuilder<CharacterEntity?>(
            future: _savedCharacterFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              bool isFavorite = snapshot.data != null;

              return IconButton(
                onPressed: _toggleFavorite,
                icon: Icon(
                  isFavorite
                      ? Icons.bookmark_added
                      : Icons.bookmark_add_outlined,
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              widget.character.image,
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
                      widget.character.image,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Character Name
                  Text(
                    widget.character.name,
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
                    widget.character.description,
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
