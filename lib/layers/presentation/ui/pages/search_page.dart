import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/presentation/controllers/searching_controller.dart';
import 'package:dbz_app/layers/presentation/ui/components/card_custom.dart';
import 'package:dbz_app/layers/presentation/ui/components/filter_dialog_custom.dart';
import 'package:dbz_app/layers/presentation/ui/pages/character/character_detail_page.dart';
import 'package:dbz_app/layers/presentation/ui/pages/planets/planets_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchTextController = TextEditingController();
  SearchingController searchingController = GetIt.I.get<SearchingController>();
  String _filter = 'Todos';
  Future<List<dynamic>>? _searchResults;

  void _onSearchChanged() {
    if (_searchTextController.text.isEmpty) {
      setState(() {
        _searchResults = null;
      });
    } else {
      setState(() {
        _searchResults = searchingController.search(_searchTextController.text);
      });
    }
  }

  void _showFilterDialog() {
    showFilterDialogCustom(
      context: context,
      onSelected: (selectedOption) {
        setState(() {
          _filter = selectedOption;
          _onSearchChanged();
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _onSearchChanged();
  }

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: Container(
          height: sizeScreen.width * .1,
          child: TextField(
            controller: _searchTextController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Pesquisar...',
              hintStyle: TextStyle(color: Colors.white54),
              filled: true,
              fillColor: Colors.white.withOpacity(0.1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              prefixIcon: Icon(Icons.search, color: Colors.white54),
            ),
            onChanged: (text) => _onSearchChanged(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: _showFilterDialog,
            icon: Icon(Icons.filter_list_outlined),
          ),
        ],
      ),
      body: _searchTextController.text.isEmpty
          ? Center(
              child: Text(
                'Nada encontrado...',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : FutureBuilder(
              future: _searchResults,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    );

                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('ERRO ${snapshot.error.toString()}'),
                      );
                    } else {
                      final results = snapshot.data!;
                      if (results.isEmpty) {
                        return Center(
                          child: Text(
                            'Nada encontrado',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        );
                      }
                      return GridView.builder(
                        itemCount: results.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          final item = results[index];
                          return CardCustom(
                            item: item,
                            function: () {
                              if (item is CharacterEntity) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CharacterDatailsPage(character: item),
                                  ),
                                );
                              } else if (item is PlanetEntity) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PlanetsDetailPage(planet: item),
                                  ),
                                );
                              }
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
