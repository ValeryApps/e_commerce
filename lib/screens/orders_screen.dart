import 'package:e_commerce/providers/order_provider.dart';
import 'package:e_commerce/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "order_screen";
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: order.orders.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderItem(
            orderItem: order.orders[index],
          );
        },
      ),
    );
  }
}
