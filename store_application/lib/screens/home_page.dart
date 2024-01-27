import 'package:flutter/material.dart';
import 'package:store_application/models/product_models.dart';
import 'package:store_application/services/get_all_product-services.dart';
import 'package:store_application/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "home_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.shopping_bag)],
        title: Text("New Trend"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 55),
          child: FutureBuilder<List<ProductModels>>(
              future: GetAllProductService().getAllProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                          mainAxisSpacing: 100,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return CustomCard(
                          product: Pro,
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
