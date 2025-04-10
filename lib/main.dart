import 'package:flutter/material.dart';
import 'package:my_app/screens/characters_screen.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/services/juego_tronos.service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => JuegoTronosService(baseUrl: 'https://thronesapi.com/api/v2'),
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
