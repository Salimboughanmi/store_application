import 'package:store_application/helper/api.dart';
import 'package:store_application/models/product_models.dart';

class AddProduct {
  Future<ProductModels> addProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    // ignore: missing_required_param
    Map<String, dynamic> data = await Api().post(
      url: "https://fakestoreapi.com/products",
      body: {
        "title": title,
        "price": price,
        "description": desc,
        "image": image,
        "category": category
      },
    );
    return ProductModels.fromJson(data);
  }
}
