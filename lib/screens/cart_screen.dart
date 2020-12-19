import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/order_provider.dart';
import 'package:e_commerce/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart_screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Your cart:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Chip(
                      label: Text(
                        "\$${cart.totalAmount.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      backgroundColor: Colors.amber,
                    ),
                    FlatButton(
                      onPressed: cart.itemCount == 0
                          ? null
                          : () {
                              Provider.of<OrderProvider>(context, listen: false)
                                  .addOrder(cart.items.values.toList(),
                                      cart.totalAmount);
                              cart.clearCart();
                            },
                      child: Text(
                        cart.itemCount == 0 ? 'Nothing to order' : 'ORDER NOW',
                        style: TextStyle(
                            color:
                                cart.itemCount == 0 ? Colors.grey : Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Consumer<CartProvider>(
              builder: (cxt, cart, _) => Expanded(
                child: ListView.builder(
                  itemCount: cart.itemCount,
                  itemBuilder: (BuildContext context, int index) {
                    final cartItem = cart.items.values.toList()[index];
                    return CartItem(
                      id: cartItem.id,
                      productId: cart.items.keys.toList()[index],
                      productName: cartItem.productName,
                      price: cartItem.price,
                      quantity: cartItem.quantity,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
