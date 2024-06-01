import 'package:dbz_app/layers/presentation/controllers/character_controller.dart';
import 'package:dbz_app/layers/presentation/ui/components/card_custom.dart';
import 'package:dbz_app/layers/presentation/ui/pages/character/character_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CharacterResultPage extends StatefulWidget {
  CharacterResultPage({
    super.key,
  });

  @override
  State<CharacterResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<CharacterResultPage> {
  CharacterController _characterController = GetIt.I.get<CharacterController>();
  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: Text(
          'Personagens',
          style: TextStyle(
            color: Colors.white,
            fontSize: sizeScreen.width / 1.8 * .1,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _characterController.getAllCharacters(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;

            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );

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
                    return CardCustom(
                      item: character,
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CharacterDatailsPage(
                                    character: character)));
                      },
                    );
                  },
                );
              }

            case ConnectionState.active:
              break;
          }
          return Container();
        },
      ),
    );
  }
}
