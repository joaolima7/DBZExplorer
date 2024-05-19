import 'dart:convert';

import 'package:dbz_app/layers/core/utils/consts/dbz_api_const.dart';
import 'package:dbz_app/layers/data/datasources/character_datasource/get_character_all_datasource.dart';
import 'package:dbz_app/layers/data/dtos/character_dto.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:http/http.dart' as http;

class GetCharacterAllApiDataSourceImp implements GetCharacterAllDataSource {
  @override
  Future<List<CharacterEntity>> call() async {
    try {
      final response =
          await http.get(Uri.parse('${URL_BASE}characters?limit=1000'));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> items = json['items'];

        return List<CharacterEntity>.from(
            items.map((e) => CharacterDto.fromJson(e)).toList());
      } else {
        throw Exception('Falha na busca dos personagens!');
      }
    } catch (e) {
      throw Exception('Falha na comunicação com o serviço!');
    }
  }
}
