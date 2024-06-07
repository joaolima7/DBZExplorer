import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/presentation/controllers/characters/character_dao_controller.dart';
import 'package:dbz_app/layers/presentation/controllers/planets/planet_dao_controller.dart';
import 'package:dbz_app/layers/presentation/controllers/transformations/transformations_dao_controller.dart';
import 'package:dbz_app/layers/presentation/ui/components/card_custom.dart';
import 'package:dbz_app/layers/presentation/ui/pages/character/character_detail_page.dart';
import 'package:dbz_app/layers/presentation/ui/pages/planets/planets_detail_page.dart';
import 'package:dbz_app/layers/presentation/ui/pages/transformations/transformations_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Future<List<dynamic>> _futureAllFavorites;
  final CharacterDaoController _characterDaoController =
      GetIt.I.get<CharacterDaoController>();
  final PlanetDaoController _planetDaoController =
      GetIt.I.get<PlanetDaoController>();
  final TransformationsDaoController _transformationsDaoController =
      GetIt.I.get<TransformationsDaoController>();

  String _selectedFilter = 'Todos';

  @override
  void initState() {
    super.initState();
    _futureAllFavorites = _getAllFavorites();
  }

  Future<List<dynamic>> _getAllFavorites() async {
    final characters =
        await _characterDaoController.getAllCharactersFavorites();
    final planets = await _planetDaoController.getAllPlanetsFavorites();
    final transformations =
        await _transformationsDaoController.getAllTransformations();
    return [...characters, ...planets, ...transformations];
  }

  List<dynamic> _applyFilter(List<dynamic> items) {
    if (_selectedFilter == 'Todos') {
      return items;
    } else if (_selectedFilter == 'Personagens') {
      return items.where((item) => item is CharacterEntity).toList();
    } else if (_selectedFilter == 'Planetas') {
      return items.where((item) => item is PlanetEntity).toList();
    } else if (_selectedFilter == 'Transformações') {
      return items.where((item) => item is TransformationEntity).toList();
    }
    return items;
  }

  void _onFilterSelected(String selectedFilter) {
    setState(() {
      _selectedFilter = selectedFilter;
      _futureAllFavorites = _getAllFavorites();
    });
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
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onSelected: _onFilterSelected,
            itemBuilder: (BuildContext context) {
              return ['Todos', 'Personagens', 'Planetas', 'Transformações']
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _futureAllFavorites,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );

            case ConnectionState.none:
            case ConnectionState.active:
              break;

            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Center(
                  child: Text('ERRO'),
                );
              } else {
                final results = _applyFilter(snapshot.data!);
                if (results.isEmpty) {
                  return const Center(
                    child: Text(
                      'Nenhum favorito encontrado',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                }
                return GridView.builder(
                  itemCount: results.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final item = results[index];
                    return InkWell(
                      onLongPress: () async {
                        if (item is CharacterEntity) {
                          await _characterDaoController
                              .deleteCharacterFavorite(item);
                        } else if (item is PlanetEntity) {
                          await _planetDaoController.deletePlanetFavorite(item);
                        } else if (item is TransformationEntity) {
                          await _transformationsDaoController
                              .deleteTransformation(item);
                        }
                        setState(() {
                          _futureAllFavorites = _getAllFavorites();
                        });
                      },
                      child: CardCustom(
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
                                builder: (context) => TransformationDetailPage(
                                    transformation: item),
                              ),
                            );
                          }
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
