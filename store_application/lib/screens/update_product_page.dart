import 'package:flutter/material.dart';
import 'package:store_application/models/product_models.dart';
import 'package:store_application/services/update_product.dart';
import 'package:store_application/widgets/custom_button.dart';
import 'package:store_application/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'UpdatePage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productname, desc, image;
  String? price;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    ProductModels productR =
        ModalRoute.of(context)!.settings.arguments as ProductModels;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "update product",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 10,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  hintText: 'Product Name',
                  onChanged: (data) {
                    productname = data;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: "Description",
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  inputType: TextInputType.number,
                  hintText: 'price',
                  onChanged: (data) {
                    price = data;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: 'image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButon(
                  onTap: () async {
                    isloading = true;
                    setState(() {});
                    try {
                      await UpdateProduct(productR);
                      print("success");
                    } catch (e) {
                      print(e.toString());
                    }
                    isloading = false;
                    setState(() {});
                  },
                  text: "Update Product",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UpdateProduct(ProductModels product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: productname == null ? product.title : productname!,
      price: price == null ? product.price.toString() : price!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
