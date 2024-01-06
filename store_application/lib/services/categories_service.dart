import 'dart:convert';

import 'package:store_application/models/product_models.dart';
import 'package:http/http.dart' as http;

class GetCategorytService {
  Future<List<ProductModels>> getCategory({required}) async {
    http.Response response = await http
        .get(Uri.parse('"https://fakestoreapi.com/products/category/'));
    List<dynamic> data = jsonDecode(response.body);

    List<ProductModels> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModels.fromJson(
          data[i],
        ),
      );
    }

    return productsList;
  }
}
