import 'package:flutter/material.dart';

class RandomjokeData extends StatelessWidget {
  final String setup;
  final String punchline;
  const RandomjokeData({super.key, required this.setup, required this.punchline});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[100],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                setup,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,

                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                punchline,
                style: const TextStyle(
                  fontSize: 16,

                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
