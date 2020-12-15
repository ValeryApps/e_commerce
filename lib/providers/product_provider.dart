import 'package:e_commerce/data/product-data.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _productItems = products;

  List<Product> get productItems {
    return [..._productItems];
  }

  void addProduct() {
    notifyListeners();
  }

  Product findProductById(String id) {
    return productItems.firstWhere((prod) => prod.id == id);
  }
}
