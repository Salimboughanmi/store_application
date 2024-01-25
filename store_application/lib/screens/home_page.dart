import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = "home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.shopping_bag)],
        title: Text("New Trend"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        //stack mettre les widgets l'un sur l'autre
        children: [
          Container(
            height: 130,
            width: 180,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: const Color.fromARGB(255, 196, 204, 196),
                spreadRadius: 0,
                offset: Offset(10, 10),
              ),
            ]),
            child: const Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "HandBag slk",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r"$100",
                        ),
                        Icon(Icons.favorite)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Text("salim boughanmi"),
          )
        ],
      ),
    );
  }
}
