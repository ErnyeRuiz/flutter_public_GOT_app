import 'package:flutter/material.dart';
import 'package:my_app/models/usuarios/usuario.model.dart';
import 'package:my_app/screens/characters_screen.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/services/juego_tronos.service.dart';
import 'package:my_app/services/usuarios.service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<JuegoTronosService>(
          create: (context) => JuegoTronosService(baseUrl: 'https://thronesapi.com/api/v2'),
        ),
        Provider<UsuariosService>(
          create: (context) => UsuariosService(baseUrl: 'https://api-usuarios-python.onrender.com'),
        ),
      ],         
      child: MaterialApp(
        title: 'Game of Thrones',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/characters': (context) => CharactersScreen()
        },
      )
    );
  }
}
