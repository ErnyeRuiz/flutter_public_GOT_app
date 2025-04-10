
import 'package:flutter/material.dart';
import 'package:my_app/models/character.model.dart';

class CharacterDetailScreen extends StatelessWidget{
  final Character character;

  const CharacterDetailScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(character.fullName),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'character-image-${character.id}',
                child: CircleAvatar(
                  backgroundImage: NetworkImage(character.imageUrl),
                  radius: 100,
                )
              )
            ),
            SizedBox(height: 20),
            Text(
              'Nombre : ${character.firstName}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            if(character.lastName != '')
              Text(
                'Apellido : ${character.lastName}',
                style: Theme.of(context).textTheme.headlineMedium
              ), 
               SizedBox(height: 10),
            if(character.title != '')
              Text(
                'Titulo : ${character.title}',
                style: Theme.of(context).textTheme.headlineSmall
              ), 
              if(character.family != '')
              Text(
                'Casa : ${character.family}',
                style: Theme.of(context).textTheme.headlineSmall
              ), 
          ],
        )
      )
    );
  }
}