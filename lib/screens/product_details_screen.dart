import 'package:e_commerce/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = 'product_details';
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    //print(id);
    final product = Provider.of<ProductProvider>(context, listen: false)
        .findProductById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Container(
        child: Text(product.description),
      ),
    );
  }
}
