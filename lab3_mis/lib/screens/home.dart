import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lab2_mis/screens/randomJoke.dart';
import 'package:lab2_mis/services/api_service.dart';

import '../widgets/jokeCard.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Future<List<dynamic>> _jokes;
  @override
  void initState() {
    super.initState();
    _jokes = ApiService.fetchJokeTypes();
    

  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: Text('Jokes'),
        backgroundColor: Colors.yellow[100],
        actions: [
          const Text("Click emoji for random joke"),
               IconButton(
                icon: const Icon(Icons.emoji_emotions),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RandomJokeScreen(),
                          )
                      );
                    }

    ),
          PopupMenuButton<String>(
            color: Colors.yellow[100],
            onSelected: (value) {
              if (value == "Login") {
                Navigator.pushNamed(context, "/login");
              } else if (value == "Register") {
                Navigator.pushNamed(context, "/register");
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "Login",
                child: Text("Login"),
              ),
              const PopupMenuItem(
                value: "Register",
                child: Text("Register"),
              ),
            ],
          ),



      ],),
      body:FutureBuilder<List<dynamic>>(
        future: _jokes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No jokes found.'));
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 3,
                mainAxisExtent: 95,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return JokeCard(jokeType:snapshot.data![index]);
              },
            );
          }
        },
      ),


    );
  }
}

