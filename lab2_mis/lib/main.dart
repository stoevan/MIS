import 'package:flutter/material.dart';
import 'package:lab2_mis/screens/home.dart';
import 'package:lab2_mis/screens/jokes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/jokes": (context) => const JokesListScreen(jokeType: ''),

      },
    );
  }
}

