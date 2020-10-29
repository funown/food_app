// demo data
import 'package:food_app/model/cart_item.dart';
import 'package:food_app/service/popular_api.dart';

List<CartItem> cart = [
  CartItem(
    product: populars[0],
    numOfItem: 2,
  ),
  CartItem(
    product: populars[2],
    numOfItem: 3,
  ),
];
