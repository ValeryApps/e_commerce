import 'package:e_commerce/providers/cart_provider.dart';
import 'package:flutter/widgets.dart';

class Order {
  final String id;
  final double totalAmount;
  final DateTime date;
  final List<Cart> cartItems;

  Order({
    @required this.id,
    @required this.totalAmount,
    @required this.date,
    @required this.cartItems,
  });
}

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];
  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<Cart> items, double amount) {
    _orders.insert(
      0,
      Order(
          id: DateTime.now().toString(),
          totalAmount: amount,
          date: DateTime.now(),
          cartItems: items),
    );
    notifyListeners();
  }
}
