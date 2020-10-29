import 'product.dart';

class CartItem {
  final Product product;
  int numOfItem;

  CartItem({
    this.product,
    this.numOfItem,
  });

  CartItem.fromJson(Map json)
      : product = json['product'],
        numOfItem = json['numOfItem'];

  Map toJSon() => {
        'product': product,
        'numOfItem': numOfItem,
      };
}
