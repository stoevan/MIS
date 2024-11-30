import 'package:flutter/material.dart';
import '../models/clothes.dart';
import '../widgets/clothing_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
final List<Clothes> clothingItems = Clothes.listAll();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(backgroundColor: Colors.blue[100],
        leading: IconButton(onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white, size: 29,),),

        title:const Text("213131",style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [

          IconButton(onPressed: () {},
            icon: const Icon(Icons.shopping_cart, color: Colors.white, size: 24,),),

        ],
      ),
        body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 5,
          ),
          child: const Row(
            children: [
               Icon(
                Icons.search,
                color: Colors.grey,
              ),
              SizedBox(width: 10),
               Flexible(
                flex: 4,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    border: InputBorder.none,
                  ),
                ),
              ),


            ],
          ),
        ),
     const SizedBox(height: 20),
          const Text(
            'Recommended',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.black54),
          ),


    Expanded(
      child:
      GridView.builder(

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 290,
          childAspectRatio: 0.8,

        ),
        itemCount:clothingItems .length,
        itemBuilder: (context, index) {
          return ClothingCard(item: clothingItems[index]);
        },
      ),

    )
        ],

        )
    )

    );
  }
}
