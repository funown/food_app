import 'package:flutter/material.dart';
import 'package:food_app/service/cart_api.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';

class TotalCost extends StatefulWidget {
  const TotalCost({
    Key key,
  }) : super(key: key);

  @override
  _TotalCostState createState() => _TotalCostState();
}

class _TotalCostState extends State<TotalCost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(95),
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
      ),
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(19),
        left: getProportionateScreenWidth(24),
        right: getProportionateScreenWidth(24),
        bottom: getProportionateScreenHeight(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total Cost",
            style: kSectionTitleStyle,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text.rich(
                TextSpan(
                  text: "Delivery Fee ",
                  style: TextStyle(
                    color: Color(0xFF747474),
                    fontWeight: FontWeight.w400,
                    fontSize: getProportionateScreenWidth(12),
                  ),
                  children: [
                    TextSpan(
                      text: "\$ 4.00",
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(12),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "\$ ${getTotal()}",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF54A5DA),
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(16),
                ),
              ),
            ],
          ),
        ],
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
}
