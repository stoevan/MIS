import 'package:flutter/material.dart';
import '../models/clothes.dart';

class ClothingCard extends StatelessWidget {
  final Clothes item;

  const ClothingCard({super.key, required this.item});


  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap:()=>
      Navigator.pushNamed(context,'/details',arguments:Clothes(id: item.id, name: item.name, imagePath: item.imagePath, description: item.description, price: item.price)),
      child:
      Card
        (elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

          Expanded(
            child: Image.asset(
              item.imagePath,
              fit: BoxFit.cover,


            ),
          ),
          Text(
            item.name,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    );


  }
}
