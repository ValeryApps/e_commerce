import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.price,
    @required this.description,
    this.isFavorite = false,
  });
  void toggleIsFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
