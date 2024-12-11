import 'package:flutter/material.dart';
import '../screens/jokes.dart';

class JokeCard extends StatelessWidget {
  final String jokeType;

  const JokeCard({Key? key, required this.jokeType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap:()=>
           Navigator.push(
             context,
             MaterialPageRoute(
               builder: (context) => JokesListScreen(jokeType: jokeType),
             ),

           ),
      child:Card(
        color: Colors.green[200],
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            jokeType,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ) ,
    );
  }
}



