import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/presentation/controllers/character_dao_controller.dart';
import 'package:dbz_app/layers/presentation/ui/components/card_custom.dart';
import 'package:dbz_app/layers/presentation/ui/pages/character/character_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Future<List<CharacterEntity>> _futureAllCharacters;
  CharacterDaoController _characterDaoController =
      GetIt.I.get<CharacterDaoController>();

  @override
  void initState() {
    super.initState();
    _futureAllCharacters = _characterDaoController.getAllCharactersFavorites();
  }

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: Text(
          'Favoritos',
          style: TextStyle(
            color: Colors.white,
            fontSize: sizeScreen.width / 1.8 * .1,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _futureAllCharacters,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );

            case ConnectionState.active:
              break;

            case ConnectionState.none:
              break;

            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Center(
                  child: Text('ERRO'),
                );
              } else {
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final character = snapshot.data![index];
                    return InkWell(
                      onLongPress: () async {
                        await _characterDaoController
                            .deleteCharacterFavorite(character);
                        setState(() {
                          _futureAllCharacters = _characterDaoController
                              .getAllCharactersFavorites();
                        });
                      },
                      child: CardCustom(
                        item: character,
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CharacterDatailsPage(
                                      character: character)));
                        },
                      ),
                    );
                  },
                );
              }
          }
          return Container();
        },
      ),
    );
  }
}
