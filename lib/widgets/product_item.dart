import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    void onTap() {
      print('your ');
      Navigator.of(context)
          .pushNamed(ProductDetailsScreen.routeName, arguments: product.id);
    }

    return Container(
      height: 410,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 8.0,
        ),
        child: Column(
          children: <Widget>[
            InkWell(
              splashColor: Colors.white30,
              onTap: onTap,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    child: CachedNetworkImage(
                      height: 300,
                      width: double.infinity,
                      imageUrl: product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        product.title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.black45,
                    ),
                    bottom: 10,
                    right: 10,
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Consumer<Product>(
                      builder: (cxt, product, child) => IconButton(
                        icon: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.pink,
                          size: 40,
                        ),
                        onPressed: () {
                          product.toggleIsFavorite();
                        },
                      ),
                    ),
                    Text(
                      "price: ${product.price}\$",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.blue,
                        size: 40,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
