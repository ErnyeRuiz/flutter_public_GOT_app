import 'package:flutter/material.dart';
import 'package:my_app/models/character.model.dart';
import 'package:my_app/screens/drawer_menu.dart';
import 'package:my_app/services/juego_tronos.service.dart';
import 'package:my_app/widgets/character_card.dart';
import 'package:provider/provider.dart';

class CharactersScreen extends StatefulWidget{
  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen>{
  late Future<List<Character>> futureCharacters;

  @override
  void initState(){
    super.initState();
    final juegoTronosService = Provider.of<JuegoTronosService>(context, listen: false);
    futureCharacters = juegoTronosService.getCharacters();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Personajes'),
      ),
      drawer: DrawerMenu(),
      body: FutureBuilder<List<Character>>(
        future: futureCharacters,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator()
            );
          }else if (snapshot.hasError){
            return Center(
              child: Text(
                'Error en la carga de los personajes', 
                style: TextStyle(decorationColor: Colors.redAccent),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty){
            return Center(
              child: Text('No hay personajes para mostrar')
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return CharacterCard(character: snapshot.data![index]);
            },
          );
        }
      )

    );
  }
}