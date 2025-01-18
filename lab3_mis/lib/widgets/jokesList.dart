import 'package:flutter/material.dart';


class Jokeslist extends StatefulWidget {

  final Map<String, dynamic> joke;
  final Function(Map<String, dynamic>) toggleFavorite;
  const Jokeslist({super.key, required this.joke, required this.toggleFavorite});


  @override
  State<Jokeslist> createState() => _JokeslistState();
}

class _JokeslistState extends State<Jokeslist> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.green[200],
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Text(
            widget.joke['setup'],
            style: TextStyle(
                fontSize: 21,
                fontWeight:FontWeight.bold,

            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5,),
          Text(
           widget.joke['punchline'],
            style: TextStyle(
                fontSize: 16,

            ),
            textAlign: TextAlign.center,
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              // color: Colors.red,
              onPressed: () => widget.toggleFavorite(widget.joke),
              color: (widget.joke['isFavorite'] ?? false) ? Colors.red : Colors.blueGrey,
              icon: const Icon(Icons.favorite),
            ),
          ),
        ],
      ),
    );

  }
}














