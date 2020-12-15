import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  @required
  final String id;
  @required
  final String imageUrl;
  @required
  final String title;
  @required
  final double price;

  const ProductItem({
    Key key,
    this.id,
    this.imageUrl,
    this.title,
    this.price,
  }) : super(key: key);

  void onTap(BuildContext context) {
    print('your ');
    Navigator.of(context)
        .pushNamed(ProductDetailsScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 8.0,
        ),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () => onTap,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    child: CachedNetworkImage(
                      height: 300,
                      width: double.infinity,
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        title,
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
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                      size: 40,
                    ),
                    Text(
                      "price: $price\$",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.blue,
                      size: 40,
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
