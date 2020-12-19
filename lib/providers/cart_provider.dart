import 'package:flutter/widgets.dart';

class Cart {
  final String id;
  final String productName;
  final double price;
  final int quantity;

  Cart({
    this.id,
    this.productName,
    this.price,
    this.quantity,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, Cart> _items = {};

  Map<String, Cart> get items {
    return {..._items};
  }

  void addProduct(String productId, double price, String productName) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (oldValue) => Cart(
              id: oldValue.id,
              productName: oldValue.productName,
              price: oldValue.price,
              quantity: oldValue.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => Cart(
              id: productId,
              productName: productName,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.quantity * value.price;
    });
    return total;
  }

  void removeCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
