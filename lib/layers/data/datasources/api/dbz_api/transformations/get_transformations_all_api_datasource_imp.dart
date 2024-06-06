import 'dart:convert';

import 'package:dbz_app/layers/core/utils/consts/dbz_api_const.dart';
import 'package:dbz_app/layers/data/datasources/transformations_datasource/get_transformations_all_datasource.dart';
import 'package:dbz_app/layers/data/dtos/transformation_dto.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:http/http.dart' as http;

class GetTransformationsAllApiDataSourceImp
    implements GetTransformationsAllDataSource {
  @override
  Future<List<TransformationEntity>> call() async {
    try {
      var response =
          await http.get(Uri.parse('${URL_BASE}transformations?limit=1000'));

      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        return List<TransformationEntity>.from(
            json.map((e) => TransformationDto.fromJson(e)).toList());
      } else {
        throw Exception('Falha ao carregar transformações!');
      }
    } catch (e) {
      throw Exception('Falha ao conectar no serviço!');
    }
  }
}
