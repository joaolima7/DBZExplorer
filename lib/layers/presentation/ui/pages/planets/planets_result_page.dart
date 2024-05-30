import 'package:dbz_app/layers/presentation/controllers/planets_controller.dart';
import 'package:dbz_app/layers/presentation/ui/components/card_custom.dart';
import 'package:dbz_app/layers/presentation/ui/pages/planets/planets_detail_page.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PlanetaResultPage extends StatefulWidget {
  PlanetaResultPage({super.key});

  @override
  State<PlanetaResultPage> createState() => _PlanetaResultPageState();
}

class _PlanetaResultPageState extends State<PlanetaResultPage> {
  PlanetsController _planetController = GetIt.I.get<PlanetsController>();

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: Text(
          'Planetas',
          style: TextStyle(
            color: Colors.white,
            fontSize: sizeScreen.width / 1.8 * .1,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _planetController.getAllPlanets(),
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
                return Center(
                  child: Text('ERRO ${snapshot.error.toString()}'),
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
                    final planet = snapshot.data![index];
                    return CardCustom(
                      item: planet,
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlanetsDetailPage(
                              planet: planet,
                            ),
                          ),
                        );
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
