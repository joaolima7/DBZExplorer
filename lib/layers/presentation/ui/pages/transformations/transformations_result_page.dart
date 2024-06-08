import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/presentation/controllers/transformations/transformations_controller.dart';
import 'package:dbz_app/layers/presentation/ui/components/card_custom.dart';
import 'package:dbz_app/layers/presentation/ui/pages/transformations/transformations_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TransformationResultPage extends StatefulWidget {
  TransformationResultPage({super.key});

  @override
  State<TransformationResultPage> createState() =>
      _TransformationResultPageState();
}

class _TransformationResultPageState extends State<TransformationResultPage> {
  TransformationsController _transformationController =
      GetIt.I.get<TransformationsController>();

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: Text(
          'Transformações',
          style: TextStyle(
            color: Colors.white,
            fontSize: sizeScreen.width / 1.8 * .1,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _transformationController.getAllTransformations(),
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
                    final transformation = snapshot.data![index];
                    return CardCustom(
                      item: transformation,
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransformationDetailPage(
                              transformation: transformation,
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
