import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  final dynamic item;
  final VoidCallback function;

  const CardCustom({
    Key? key,
    required this.item,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';
    String name = '';
    String number = '';

    if (item is CharacterEntity) {
      imageUrl = item.image;
      name = item.name;
      number = '#${item.id}';
    } else if (item is PlanetEntity) {
      imageUrl = item.image;
      name = item.name;
      number = '#${item.id}';
    } else if (item is TransformationEntity) {
      imageUrl = item.image;
      name = item.name;
      number = '#${item.id}';
    }

    return InkWell(
      onTap: function,
      child: Card(
        elevation: 10,
        shadowColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: [
                Colors.black87,
                Colors.black54,
                Colors.black45,
                Colors.orange.shade200,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    number,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, exception, stackTrace) {
                    return Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
