import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/presentation/controllers/planet_dao_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PlanetsDetailPage extends StatefulWidget {
  final PlanetEntity planet;

  const PlanetsDetailPage({
    Key? key,
    required this.planet,
  }) : super(key: key);

  @override
  State<PlanetsDetailPage> createState() => _PlanetsDetailPageState();
}

class _PlanetsDetailPageState extends State<PlanetsDetailPage> {
  PlanetDaoController planetDaoController = GetIt.I.get<PlanetDaoController>();
  late Future<PlanetEntity?> _savedPlanetFuture;

  @override
  void initState() {
    super.initState();
    _savedPlanetFuture =
        planetDaoController.findPlanetSavedByName(widget.planet.name);
  }

  void _toggleFavorite() async {
    final savedPlanet =
        await planetDaoController.findPlanetSavedByName(widget.planet.name);
    if (savedPlanet == null) {
      await planetDaoController.savePlanetFavorite(widget.planet);
    } else {
      await planetDaoController.deletePlanetFavorite(widget.planet);
    }
    setState(() {
      _savedPlanetFuture =
          planetDaoController.findPlanetSavedByName(widget.planet.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: Text(
          'Informações do Planeta',
          style: TextStyle(
            color: Colors.white,
            fontSize: sizeScreen.width / 1.8 * .1,
          ),
        ),
        actions: [
          FutureBuilder<PlanetEntity?>(
            future: _savedPlanetFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  color: Colors.orange,
                );
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
              widget.planet.image,
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
                  // Planet Image
                  Center(
                    child: Image.network(
                      widget.planet.image,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Planet Name
                  Text(
                    widget.planet.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
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
                    widget.planet.description,
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
}
