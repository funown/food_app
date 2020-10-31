import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/screen/shop_detail/shop_detail_screen.dart';
import 'package:food_app/service/shop_api.dart';
import 'package:provider/provider.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';
import 'package:food_app/service/cart_api.dart';
import 'package:food_app/service/popular_api.dart';
import 'package:food_app/screen/cart/cart_screen.dart';
import 'package:food_app/screen/widget/custom_app_bar.dart';
import 'package:food_app/screen/widget/rounded_icon_btn.dart';
import 'package:food_app/screen/widget/icon_btn_with_num_badge.dart';
import 'package:food_app/screen/model/current_product_model.dart';

import 'component/body.dart';

class ProductDetailScreenArguments {
  final int index;
  final List<Product> productList;

  ProductDetailScreenArguments({
    @required this.index,
    @required this.productList,
  });
}

class ProductDetailScreen extends StatefulWidget {
  static String routeName = "/detail/product";

  @override
  ProductDetailScreenState createState() => ProductDetailScreenState();
}

class ProductDetailScreenState extends State<ProductDetailScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ProductDetailScreenArguments arguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: buildCustomAppBar(context, arguments),
      body: Body(
        index: arguments.index,
        productList: arguments.productList,
        onPageChange: (value) {
          context
              .read<CurrentProductModel>()
              .setCurrentProduct(populars[value]);
        },
      ),
    );
  }

  CustomAppBar buildCustomAppBar(
      BuildContext context, ProductDetailScreenArguments arguments) {
    return CustomAppBar(
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          width: getProportionateScreenWidth(24),
          height: getProportionateScreenWidth(24),
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(5),
            vertical: getProportionateScreenHeight(4),
          ),
          child: SvgPicture.asset(
            'assets/icons/Vector.svg',
          ),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${context.watch<CurrentProductModel>().currentProduct.shop}',
              style: kHeadingStyle.copyWith(
                fontSize: getProportionateScreenWidth(16),
              ),
            ),
            GestureDetector(
              onTap: () {
                // get shop data
                shops.forEach((element) {
                  if (element.title ==
                      context.read<CurrentProductModel>().currentProduct.shop) {
                    Navigator.pushNamed(context, ShopDetailScreen.routeName,
                        arguments: ShopDetailScreenArguments(shop: element));
                  }
                });
              },
              child: Text(
                "Go to restaurant",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: getProportionateScreenWidth(12),
                ),
              ),
            ),
          ],
        ),
      ),
      tailer: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconBtnWithNumBadge(
              iconSrc: 'assets/icons/shopping-cart.svg',
              badgeNum: cart.length,
              onTap: () => Navigator.pushNamed(context, CartScreen.routeName),
            ),
            SizedBox(
              width: getProportionateScreenWidth(15),
            ),
            RoundedIconBtn(
              icon: Icons.favorite_border_rounded,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
