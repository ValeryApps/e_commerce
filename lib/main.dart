import 'package:e_commerce/providers/order_provider.dart';
import 'package:e_commerce/screens/cart_screen.dart';
import 'package:e_commerce/screens/edit_prpduct_screen.dart';
import 'package:e_commerce/screens/orders_screen.dart';
import 'package:e_commerce/screens/user_product_screen.dart';

import 'providers/cart_provider.dart';
import 'screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/product_provider.dart';
import 'screens/product_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider<OrderProvider>(
          create: (cxt) => OrderProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: ProductOverviewScreen(),
        routes: {
          ProductOverviewScreen.routeName: (cxt) => ProductOverviewScreen(),
          ProductDetailsScreen.routeName: (cxt) => ProductDetailsScreen(),
          CartScreen.routeName: (cxt) => CartScreen(),
          OrderScreen.routeName: (cxt) => OrderScreen(),
          UserProductScreen.routeName: (cxt) => UserProductScreen(),
          EditProductScreen.routeName: (cxt) => EditProductScreen(),
        },
      ),
    );
  }
}
