import 'package:flutter/widgets.dart';
import 'package:food_app/screen/cart/cart_screen.dart';
import 'package:food_app/screen/home/home_screen.dart';
import 'package:food_app/screen/product_detail/product_detail_screen.dart';
import 'package:food_app/screen/shop_detail/shop_detail_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  ShopDetailScreen.routeName: (context) => ShopDetailScreen(),
  ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
  CartScreen.routeName: (context) => CartScreen(),
};
