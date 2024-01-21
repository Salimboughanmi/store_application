import 'package:store_application/helper/api.dart';
import 'package:store_application/models/product_models.dart';

class GetCategorytService {
  Future<List<ProductModels>> getCategoryProduct(
      {required categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    // http.Response response = await http.get(
    //   Uri.parse('https://fakestoreapi.com/products/category/$categoryName'));

    //List<dynamic> data = jsonDecode(response.body);

    List<ProductModels> categoryList = [];
    for (int i = 0; i < data.length; i++) {
      categoryList.add(
        ProductModels.fromJson(
          data[i],
        ),
      );
    }

    return categoryList;
  }
}
