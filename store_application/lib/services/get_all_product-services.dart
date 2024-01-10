import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_application/helper/api.dart';
import 'package:store_application/models/product_models.dart';

class GetAllProductService {
  Future<List<ProductModels>> getAllProduct() async {
    Response response =
        await Api().get(url: "https://fakestoreapi.com/products");

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
  }
}
