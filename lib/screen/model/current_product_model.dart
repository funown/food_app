import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/model/product.dart';

class CurrentProductModel with ChangeNotifier, DiagnosticableTreeMixin {
  Product _currentProduct;
  Product get currentProduct => _currentProduct;

  void setCurrentProduct(Product product) {
    _currentProduct = product;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties
    //     .add(ObjectFlagProperty<Product>('Current Product', currentProduct));
  }
}
