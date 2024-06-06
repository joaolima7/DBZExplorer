import 'dart:convert';

import 'package:dbz_app/layers/core/utils/consts/dbz_api_const.dart';
import 'package:dbz_app/layers/data/datasources/transformations_datasource/get_transformations_by_name_datasource.dart';
import 'package:dbz_app/layers/data/dtos/transformation_dto.dart';
import 'package:dbz_app/layers/domain/entities/transformation_entity.dart';
import 'package:http/http.dart' as http;

class GetTransformationsByNameApiDataSourceImp
    implements GetTransformationsByNameDataSource {
  @override
  Future<List<TransformationEntity>> call(String name) async {
    try {
      final response = await http
          .get(Uri.parse('${URL_BASE}transformations?limit=1000&name=$name'));

      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        return List<TransformationEntity>.from(
            json.map((e) => TransformationDto.fromJson(e)).toList());
      } else {
        throw Exception('Falha ao carregar transformação!');
      }
    } catch (e) {
      throw Exception('Falha ao conectar no serviço!');
    }
  }
}
