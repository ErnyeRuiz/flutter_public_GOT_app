import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/models/usuarios/login.model.dart';
import 'package:my_app/models/usuarios/usuario.model.dart';

class UsuariosService{
  final String baseUrl;

  UsuariosService({required this.baseUrl});

  Future<Usuario?> login(Login login) async{
    final response = await http.post(
      Uri.parse('$baseUrl/users/login'), 
      body: (loginToJson(login)),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200){ 
      final jsonResponse = json.decode(response.body);
      return Usuario.fromJson(jsonResponse);
      // return del usuario si existe
    }else{
      return null;
    }
  }
}