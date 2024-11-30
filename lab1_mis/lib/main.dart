import 'package:flutter/material.dart';
import 'package:lab1_mis/screens/home.dart';
import 'package:lab1_mis/screens/details.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/details": (context) => const  Details(),
      },

    );
  }
}

