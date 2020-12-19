import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/order_provider.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderItem extends StatefulWidget {
  final Order orderItem;

  const OrderItem({
    Key key,
    this.orderItem,
  }) : super(key: key);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            title: Text("${widget.orderItem.totalAmount.toStringAsFixed(2)}"),
            subtitle: Text(
                DateFormat("MM-dd-yyyy h:mm").format(widget.orderItem.date)),
            trailing: IconButton(
              icon: _isExpanded ? Icon(Icons.remove) : Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
        ),
        if (_isExpanded)
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: widget.orderItem.cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                final Product prod = product.productItems.firstWhere(
                    (element) =>
                        element.id == widget.orderItem.cartItems[index].id);
                final Cart cart = widget.orderItem.cartItems[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      prod.imageUrl,
                    ),
                  ),
                  title: Text(" ${cart.productName}"),
                  subtitle: Text(" price: \$${cart.price}"),
                  trailing: Text("quantity: ${cart.quantity}"),
                );
              },
            ),
          )
      ],
    );
  }
}
