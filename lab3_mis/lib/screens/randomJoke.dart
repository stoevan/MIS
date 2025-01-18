import 'package:flutter/material.dart';
import 'package:lab2_mis/services/api_service.dart';
import 'package:lab2_mis/widgets/randomJoke_data.dart';

import '../models/joke.dart';
class RandomJokeScreen extends StatefulWidget {
  const RandomJokeScreen({super.key});

  @override
  State<RandomJokeScreen> createState() => _State();
}

class _State extends State<RandomJokeScreen> {
  late Future<Joke> joke;
  @override
  void initState() {
    super.initState();
    joke=ApiService().fetchRandomJoke();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[100],
        title: const Text('Joke of the Day'),
      ),
      body: FutureBuilder<Joke>(
    future: joke,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));

        } else {
          final joke = snapshot.data!;
          return

              RandomjokeData(setup: joke.setup, punchline: joke.punchline);

        }
      },
      ),
    );
  }
}