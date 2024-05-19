import 'dart:convert';

import 'package:dbz_app/layers/core/utils/consts/dbz_api_const.dart';
import 'package:dbz_app/layers/data/datasources/character_datasource/get_character_by_name_datasource.dart';
import 'package:dbz_app/layers/data/dtos/character_dto.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:http/http.dart' as http;

class GetCharacterByNameApiDataSourceImp
    implements GetCharacterByNameDataSoruce {
  @override
  Future<List<CharacterEntity>> call(String name) async {
    try {
      final response = await http
          .get(Uri.parse('${URL_BASE}characters?limit=1000&name=${name}'));

      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        return List<CharacterEntity>.from(
            json.map((e) => CharacterDto.fromJson(e)).toList());
      } else {
        throw Exception('Falha ao carregar personagem!');
      }
    } catch (e) {
      throw Exception('Falha ao conectar no serviço!');
    }
  }
}
