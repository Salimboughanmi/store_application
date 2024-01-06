import 'dart:convert';

import 'package:store_application/models/product_models.dart';
import 'package:http/http.dart' as http;

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    http.Response response = await http.get(
      Uri.parse("https://fakestoreapi.com/products/categories"),
    );

    List<dynamic> data = jsonDecode(response.body);

    return data;
  }
}