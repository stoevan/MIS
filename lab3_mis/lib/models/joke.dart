class Joke
{

  final String type;
  final String setup;
  final String punchline;
  bool isFavorite = false;



  Joke({required this.type,required this.setup,required this.punchline});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      type: json['type'],
      setup: json['setup'],
      punchline: json['punchline'],

    );
}
}

