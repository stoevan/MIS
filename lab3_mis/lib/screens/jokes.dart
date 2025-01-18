import 'package:flutter/material.dart';
import 'package:lab2_mis/widgets/jokesList.dart';
import '../services/api_service.dart';
import 'favoriteJoke.dart';

class JokesListScreen extends StatefulWidget {
  final String jokeType;

  const JokesListScreen({Key? key, required this.jokeType}) : super(key: key);

  @override
  State<JokesListScreen> createState() => _JokesListScreenState();
}

class _JokesListScreenState extends State<JokesListScreen> {
  late Future<List<dynamic>> _jokes;
  final List<Map<String, dynamic>> favoriteJokes = [];

  @override
  void initState() {
    super.initState();
    _jokes = ApiService.fetchJokesByType(widget.jokeType);
  }
  void toggleFavorite(Map<String, dynamic> joke) {
    setState(() {
      joke['isFavorite'] = !(joke['isFavorite'] ?? false);

      if (joke['isFavorite'] == true) {
        favoriteJokes.add(joke);
      } else {
        favoriteJokes.removeWhere((favJoke) => favJoke['setup'] == joke['setup']);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(title: Text('${widget.jokeType} Jokes'),
        backgroundColor: Colors.yellow[100],
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // Navigate to Favorite Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(favoriteJokes: favoriteJokes),
                ),
              );
            },
          ),
        ],
      ),

      body: FutureBuilder<List<dynamic>>(
        future: _jokes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No jokes found.'));
          } else {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final joke = snapshot.data![index];
                return
                  Jokeslist(
                      joke: joke,
                    toggleFavorite: toggleFavorite,);





              },
            );
          }
        },
      ),
    );
  }
}
