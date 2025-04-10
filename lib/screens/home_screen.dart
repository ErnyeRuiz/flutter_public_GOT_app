import 'package:flutter/material.dart';
import 'package:my_app/screens/drawer_menu.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio')),
        drawer: DrawerMenu(),
        body: Center(
            child: Text(
              'Bienvenido a la app de GOT', 
              style: TextStyle(fontSize: 24)
            ),
        )
    );
  }
}