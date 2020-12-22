import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/screens/edit_prpduct_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = 'user_products_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your products'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
            )
          ],
        ),
        body: Consumer<ProductProvider>(
          builder: (context, product, _) => Padding(
            padding: EdgeInsets.all(4),
            child: ListView.builder(
              itemCount: product.productItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    _productListTile(product.productItems[index], context),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}

Widget _productListTile(Product product, BuildContext context) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: CachedNetworkImageProvider(
        product.imageUrl,
      ),
    ),
    title: Text(product.title),
    subtitle: Text("${product.price}"),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.edit,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.of(context)
                .pushNamed(EditProductScreen.routeName, arguments: product.id);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            Provider.of<ProductProvider>(context, listen: false)
                .deleteProduct(product.id);
          },
        ),
      ],
    ),
  );
}
