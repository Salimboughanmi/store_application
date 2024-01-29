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
    ProductModels product =
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
                  onTap: () {
                    isloading = true;
                    setState(() {});
                    try {
                      UpdateProduct(product);
                      print("success");
                    } on Exception catch (e) {
                      print(e.toString());
                      isloading = false;
                      setState(() {});
                    }
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

  void UpdateProduct(ProductModels product) {
    UpdateProductService().updateProduct(
        title: productname!,
        price: price!,
        desc: desc!,
        image: image!,
        category: product.category);
    isloading = false;
  }
}
