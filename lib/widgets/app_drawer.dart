import 'package:e_commerce/screens/orders_screen.dart';
import 'package:e_commerce/screens/product_overview_screen.dart';
import 'package:e_commerce/screens/user_product_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("E-Commerce"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Orders"),
            onTap: () {
              Navigator.of(context).pushNamed(OrderScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.add_chart),
            title: Text("Products"),
            onTap: () {
              Navigator.of(context).pushNamed(ProductOverviewScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("User Products"),
            onTap: () {
              Navigator.of(context).pushNamed(UserProductScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
