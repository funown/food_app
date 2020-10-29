import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/screen/widget/default_button.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';
import 'package:food_app/service/cart_api.dart';
import 'package:food_app/screen/widget/custom_app_bar.dart';

import 'component/body.dart';
import 'component/total_cost.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context),
      body: Body(),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: getProportionateScreenHeight(200),
        child: Column(
          children: [
            TotalCost(),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(24),
                horizontal: getProportionateScreenWidth(24),
              ),
              child: DefaultButton(
                text: "Continue Pay - \$${getTotal()}",
                color: Color(0xFF54A5DA),
                onPress: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  double getTotal() {
    double result = 0;
    cart.forEach((element) {
      result += element.product.isOnSale
          ? element.product.discounts * element.numOfItem
          : element.product.price * element.numOfItem;
    });
    return result;
  }

  CustomAppBar buildCustomAppBar(BuildContext context) {
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
              "Your cart is ready to go",
              style: kHeadingStyle.copyWith(
                fontSize: getProportionateScreenWidth(16),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "${cart.length} Menu",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: getProportionateScreenWidth(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
