import 'package:e_commerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String productName;
  final double price;
  final int quantity;

  const CartItem({
    Key key,
    @required this.id,
    @required this.productId,
    @required this.productName,
    @required this.price,
    @required this.quantity,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(productId),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) =>
          Provider.of<CartProvider>(context, listen: false)
              .removeCart(productId),
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(2),
        color: Colors.grey[300],
        child: ListTile(
          leading: Chip(
            label: Text(
              '\$${price.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.amber,
          ),
          title: Text(productName),
          subtitle: Text("\$${(price * quantity)}"),
          trailing: Text("$quantity x"),
        ),
      ),
    );
  }
}
