import 'dart:convert';

import 'package:store_application/models/product_models.dart';
import 'package:http/http.dart' as http;

class GetCategorytService {
  Future<List<ProductModels>> getCategoryProduct(
      {required categoryName}) async {
    http.Response response = await http.get(
        Uri.parse('"https://fakestoreapi.com/products/category/$categoryName'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<ProductModels> categoryList = [];
      for (int i = 0; i < data.length; i++) {
        categoryList.add(
          ProductModels.fromJson(
            data[i],
          ),
        );
      }

      return categoryList;
    } else {
      throw Exception(
          "there is problem with status code ${response.statusCode}");
    }
  }
}
