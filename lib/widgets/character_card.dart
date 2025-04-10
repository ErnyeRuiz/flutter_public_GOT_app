import 'package:flutter/material.dart';
import 'package:my_app/models/character.model.dart';
import 'package:my_app/screens/character_detail_screen.dart';

class CharacterCard extends StatelessWidget{
  final Character character;

  CharacterCard({required this.character});

  @override
  Widget build(BuildContext context){
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CharacterDetailScreen(character: character)
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Hero(
                tag: 'character-image-${character.id}',
                child: CircleAvatar(
                  backgroundImage: NetworkImage(character.imageUrl),
                  radius: 30,
                )
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.fullName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      character.family,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600]
                      ),
                    ),
                  ]
                )
              ),
            ],
          )
        )
      )
    );
  }
}