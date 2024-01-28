import 'package:flutter/material.dart';
import 'package:store_application/widgets/custom_button.dart';
import 'package:store_application/widgets/custom_text_field.dart';

class UpdateProductPage extends StatelessWidget {
  UpdateProductPage({super.key});
  static String id = 'UpdatePage';
  String? productname, desc, image;
  int? price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  price = int.parse(data);
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
                text: "Update Product",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
