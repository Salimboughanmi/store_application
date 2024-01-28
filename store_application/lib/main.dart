import 'package:flutter/material.dart';
import 'package:store_application/screens/home_page.dart';
import 'package:store_application/screens/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProductPage.id: (context) => UpdateProductPage()
      },
      initialRoute: HomePage.id,
    );
  }
}
