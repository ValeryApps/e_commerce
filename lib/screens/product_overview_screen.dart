import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SelectedItem { all, favorites }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _isFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final List<Product> products = _isFavoriteOnly
        ? productData.favoriteProducts
        : productData.productItems;
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Commerce APP"),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (SelectedItem selectedItem) {
                if (selectedItem == SelectedItem.favorites)
                  setState(() {
                    _isFavoriteOnly = true;
                  });
                else
                  setState(() {
                    _isFavoriteOnly = false;
                  });
              },
              itemBuilder: (item) => [
                    PopupMenuItem(
                      child: Text("Favorite"),
                      value: SelectedItem.favorites,
                    ),
                    PopupMenuItem(
                      child: Text("All"),
                      value: SelectedItem.all,
                    ),
                  ])
        ],
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = products[index];
            return ChangeNotifierProvider<Product>.value(
              value: product,
              child: ProductItem(),
            );
          },
        ),
      ),
    );
  }
}
