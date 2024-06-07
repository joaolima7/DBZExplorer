import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:dbz_app/layers/presentation/controllers/transformations/transformations_dao_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TransformationDetailPage extends StatefulWidget {
  final TransformationEntity transformation;

  const TransformationDetailPage({
    Key? key,
    required this.transformation,
  }) : super(key: key);

  @override
  State<TransformationDetailPage> createState() =>
      _TransformationDetailPageState();
}

class _TransformationDetailPageState extends State<TransformationDetailPage> {
  TransformationsDaoController transformationDaoController =
      GetIt.I.get<TransformationsDaoController>();
  late Future<TransformationEntity?> _savedTransformationFuture;

  @override
  void initState() {
    super.initState();
    _savedTransformationFuture = transformationDaoController
        .getAllTransformationsSavedByName(widget.transformation.name);
  }

  void _toggleFavorite() async {
    final savedTransformation = await transformationDaoController
        .getAllTransformationsSavedByName(widget.transformation.name);
    if (savedTransformation == null) {
      await transformationDaoController
          .saveTransformation(widget.transformation);
    } else {
      await transformationDaoController
          .deleteTransformation(widget.transformation);
    }
    setState(() {
      _savedTransformationFuture = transformationDaoController
          .getAllTransformationsSavedByName(widget.transformation.name);
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
          'Detalhes da Transformação',
          style: TextStyle(
            color: Colors.white,
            fontSize: sizeScreen.width / 1.8 * .1,
          ),
        ),
        actions: [
          FutureBuilder<TransformationEntity?>(
            future: _savedTransformationFuture,
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
          Center(
            child: Positioned.fill(
              child: Image.network(
                widget.transformation.image,
                fit: BoxFit.contain,
                color: Colors.black.withOpacity(0.5),
                colorBlendMode: BlendMode.darken,
                errorBuilder: (context, obj, stackTrace) {
                  return Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png');
                },
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // // Transformation Image
                // Center(
                //   child: Image.network(
                //     widget.transformation.image,
                //     height: 200,
                //   ),
                // ),
                // const SizedBox(height: 16),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: sizeScreen.height * .04),
                  child: _buildInfoCard(widget.transformation.name),
                ),
                // Text(
                //   widget.transformation.name,
                //   style: const TextStyle(
                //     color: Colors.white,
                //     fontSize: 28,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(height: 16),
                // // Example of Additional Information
                // _buildInfoCard(
                //   context,
                //   'Nível de Poder',
                //   '9000',
                // ),
                // const SizedBox(height: 16),
                // _buildInfoCard(
                //   context,
                //   'Habilidade Especial',
                //   'Kamehameha',
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title) {
    return Card(
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Text(
            //   value,
            //   style: const TextStyle(
            //     color: Colors.white,
            //     fontSize: 18,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
