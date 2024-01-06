import 'dart:convert';

import 'package:store_application/models/product_models.dart';
import 'package:http/http.dart' as http;

class GetAllProductService {
  Future<List<ProductModels>> getAllProduct() async {
    http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      List<dynamic> data =
          jsonDecode(response.body); // jsonDecode convertir string vers list

      List<ProductModels> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(
          ProductModels.fromJson(
            data[i],
          ),
        );
      }
      return productsList;
    } else {
      throw Exception(
          "there is problem with status code ${response.statusCode}");
    }
  }
}
