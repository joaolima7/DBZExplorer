import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/presentation/controllers/searching_controller.dart';
import 'package:dbz_app/layers/presentation/ui/components/card_custom.dart';
import 'package:dbz_app/layers/presentation/ui/pages/character/character_detail_page.dart';
import 'package:dbz_app/layers/presentation/ui/pages/planets/planets_detail_page.dart';
import 'package:dbz_app/layers/presentation/ui/pages/transformations/transformations_detail_page.dart';
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

  void _onFilterSelected(String selectedFilter) {
    setState(() {
      _filter = selectedFilter;
      _onSearchChanged();
    });
  }

  List<dynamic> _applyFilter(List<dynamic> items) {
    if (_filter == 'Todos') {
      return items;
    } else if (_filter == 'Personagens') {
      return items.where((item) => item is CharacterEntity).toList();
    } else if (_filter == 'Planetas') {
      return items.where((item) => item is PlanetEntity).toList();
    }
    return items;
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
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: Container(
          height: sizeScreen.width * .1,
          child: TextField(
            controller: _searchTextController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Pesquisar...',
              hintStyle: const TextStyle(color: Colors.white54),
              filled: true,
              fillColor: Colors.white.withOpacity(0.1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              prefixIcon: const Icon(Icons.search, color: Colors.white54),
            ),
            onChanged: (text) => _onSearchChanged(),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onSelected: _onFilterSelected,
            itemBuilder: (BuildContext context) {
              return ['Todos', 'Personagens', 'Planetas'].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: _searchTextController.text.isEmpty
          ? const Center(
              child: Text(
                'Nada encontrado...',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : FutureBuilder<List<dynamic>>(
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
                      final results = _applyFilter(snapshot.data!);
                      if (results.isEmpty) {
                        return const Center(
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
                              } else if (item is TransformationEntity) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TransformationDetailPage(
                                            transformation: item),
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
