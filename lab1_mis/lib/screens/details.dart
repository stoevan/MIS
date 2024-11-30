import 'package:flutter/material.dart';
import 'package:lab1_mis/models/clothes.dart';


class Details extends StatelessWidget {


  const Details({super.key});



  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Clothes;
    return   Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[100],

      ),
      body:
       Column(
      crossAxisAlignment: CrossAxisAlignment.center,
         children: [

        Container(
          child:
          Image.asset(
              arguments.imagePath,
              fit: BoxFit.fill,
              height: 450,
              alignment: Alignment.center
          ),

        ),
        Container(
          child:
          Text(
              arguments.name,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,

          ),
        ),
        Container(
          child:
          Text(
            arguments.description,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,

          ),
        ),
        Container(
          child:
          Text(
            "\$${arguments.price.toStringAsFixed(2)}",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
           Container(
             child: OutlinedButton(
               child: Text(
                 "Add to cart ",
                 style: TextStyle(
                   color: Colors.blue[200],
                 ),
               ),
               onPressed: () {},
             ),
           )

      ],
    ),

    );
  }
}
