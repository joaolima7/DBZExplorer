import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dbz_app/layers/core/utils/consts/dbz_api_const.dart';
import 'package:dbz_app/layers/data/datasources/planets_datasource/get_planets_by_name_datasource.dart';
import 'package:dbz_app/layers/data/dtos/planet_dto.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';

class GetPlanetsByNameApiDataSourceImp implements GetPlanetsByNameDataSource {
  @override
  Future<List<PlanetEntity>> call(String name) async {
    try {
      final response =
          await http.get(Uri.parse('${URL_BASE}planets?limit=1000&name=$name'));

      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        return List<PlanetEntity>.from(
            json.map((e) => PlanetDto.fromJson(e)).toList());
      } else {
        throw Exception('Falha ao carregar personagem!');
      }
    } catch (e) {
      throw Exception('Falha ao conectar no serviço!');
    }
  }
}
