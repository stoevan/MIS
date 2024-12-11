import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lab2_mis/models/joke.dart';


class ApiService
{
  static Future<List<dynamic>> fetchJokeTypes() async {
  final response = await http.get(Uri.parse("https://official-joke-api.appspot.com/types"));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
  throw Exception('Failed to load joke types');
  }
  }


  static Future<List<dynamic>> fetchJokesByType(String type) async {
    final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/jokes/$type/ten'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load jokes');
    }
  }
  Future<Joke> fetchRandomJoke() async {
    final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));
      if (response.statusCode == 200) {
       return  Joke.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load joke');
      }
    }
}









