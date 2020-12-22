import 'package:e_commerce/data/product-data.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _productItems = products;

  List<Product> get productItems {
    return [..._productItems];
  }

  void addProduct(Product product) {
    _productItems.add(product);
    notifyListeners();
  }

  void editProduct(String id, Product product) {
    int productIndex = _productItems.indexWhere((element) => element.id == id);
    _productItems.removeAt(productIndex);
    _productItems.insert(productIndex, product);
    notifyListeners();
  }

  Product findProductById(String id) {
    return _productItems.firstWhere((prod) => prod.id == id);
  }

  List<Product> get favoriteProducts {
    return _productItems.where((prod) => prod.isFavorite).toList();
  }

  void deleteProduct(String id) {
    _productItems.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
