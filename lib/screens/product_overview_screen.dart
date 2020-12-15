import 'package:e_commerce/data/product-data.dart';
import 'package:e_commerce/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Commerce APP"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = products[index];
            return ProductItem(
              id: product.id,
              title: product.title,
              imageUrl: product.imageUrl,
              price: product.price,
            );
          },
        ),
      ),
    );
  }
}
