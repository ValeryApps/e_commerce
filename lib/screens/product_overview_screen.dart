import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final List<Product> products = productData.productItems;
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
            return ChangeNotifierProvider<Product>(
              create: (context) => product,
              child: ProductItem(),
            );
          },
        ),
      ),
    );
  }
}
