import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/widgets/app_drawer.dart';
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
      drawer: AppDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            CachedNetworkImage(imageUrl: product.imageUrl, fit: BoxFit.cover),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "price: ${product.price}\$",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        product.description,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                        softWrap: true,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
