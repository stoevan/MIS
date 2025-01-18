import 'package:flutter/material.dart';
import 'package:lab2_mis/models/joke.dart';
import 'package:lab2_mis/services/api_service.dart';

class JokesProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isObscure = true;


  List<String> _jokeTypes = [];
  List<Joke> _jokes = [];
  List<Joke> _favoriteJokes = [];


  List<String> get jokeTypes => _jokeTypes;
  List<Joke> get jokes => _jokes;
  List<Joke> get favoriteJokes => _favoriteJokes;


  bool get isObscure => _isObscure;
  void toggleVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }



  Future<void> fetchJokeTypes() async {
    try {
      final types = await ApiService.fetchJokeTypes();
      _jokeTypes = List<String>.from(types);
      notifyListeners();
    } catch (error) {
      throw Exception("Failed to fetch joke types: $error");
    }
  }


  Future<void> fetchJokesByType(String type) async {
    try {
      final fetchedJokes = await ApiService.fetchJokesByType(type);
      _jokes = fetchedJokes.map((jokeData) => Joke.fromJson(jokeData)).toList();
      notifyListeners();
    } catch (error) {
      throw Exception("Failed to fetch jokes: $error");
    }
  }


  void toggleFavorite(Joke joke) {
    joke.isFavorite = !joke.isFavorite;
    if (joke.isFavorite) {
      _favoriteJokes.add(joke);
    } else {
      _favoriteJokes.removeWhere((favJoke) => favJoke.setup == joke.setup);
    }
    notifyListeners();
  }

  // Fetch a random joke from API
  Future<Joke> fetchRandomJoke() async {
    try {
      final randomJoke = await _apiService.fetchRandomJoke();
      return randomJoke;
    } catch (error) {
      throw Exception("Failed to fetch random joke: $error");
    }
  }
}
