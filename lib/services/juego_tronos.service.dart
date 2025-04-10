import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/models/character.model.dart';

class JuegoTronosService{
  final String baseUrl;

  JuegoTronosService({required this.baseUrl});

  Future<List<Character>> getCharacters() async{
    final response = await http.get(Uri.parse('$baseUrl/Characters'));

    if (response.statusCode == 200){
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((char) => Character.fromJson(char)).toList();
    }else{
      throw Exception('No se pudieron cargar los personajes');
    }
  }
}
