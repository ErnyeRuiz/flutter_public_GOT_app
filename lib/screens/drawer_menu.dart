import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              )
            )
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/home');
            }
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Personajes'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/characters');
            }
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/profile');
            }
          ),
           ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Salir'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/login');
            }
          ),

        ]
      )
    );
  }
}