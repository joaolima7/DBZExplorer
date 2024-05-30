import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dbz_app/layers/core/utils/consts/dbz_api_const.dart';
import 'package:dbz_app/layers/data/datasources/planets/get_planets_all_datasource.dart';
import 'package:dbz_app/layers/data/dtos/planet_dto.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

class GetPlanetsAllApiDataSourceImp implements GetPlanetsAllDataSource {
  @override
  Future<List<PlanetEntity>> call() async {
    try {
      final response =
          await http.get(Uri.parse('${URL_BASE}planets?limit=1000'));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> items = json['items'];
        return List<PlanetEntity>.from(
            items.map((e) => PlanetDto.fromJson(e)).toList());
      } else {
        throw Exception('Falha ao carregar personagem!');
      }
    } catch (e) {
      throw Exception('Falha ao conectar no serviço!');
    }
  }
}
