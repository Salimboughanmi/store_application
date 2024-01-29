import 'package:store_application/helper/api.dart';
import 'package:store_application/models/product_models.dart';

class UpdateProductService {
  Future<ProductModels> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
    required int id,
  }) async {
    print("prudact id = $id");

    Map<String, dynamic> data = await Api().put(
      url: "https://fakestoreapi.com/products/$id",
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
