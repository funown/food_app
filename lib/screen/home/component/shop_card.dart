import 'package:flutter/material.dart';
import 'package:food_app/model/shop.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    Key key,
    @required this.shop,
    @required this.onTap,
  }) : super(key: key);

  final Shop shop;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: getProportionateScreenWidth(157),
        padding: EdgeInsets.only(
          top: getProportionateScreenHeight(15),
          left: getProportionateScreenWidth(14),
          right: getProportionateScreenWidth(14),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(12),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(
                0,
                getProportionateScreenWidth(12),
              ),
              blurRadius: getProportionateScreenWidth(24),
              color: Color(0xFF444444).withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: getProportionateScreenWidth(128),
              height: getProportionateScreenWidth(128),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(8),
                ),
              ),
              child: Hero(
                tag: shop.id,
                child: Image.asset(shop.image),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              shop.title,
              style: kHeadingStyle.copyWith(
                fontSize: getProportionateScreenWidth(14),
              ),
              maxLines: 2,
            ),
            Text(
              shop.location,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(12),
                color: kSecondaryColor,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1.2km",
                  style: TextStyle(
                    color: Color(0xFF54A5DA),
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(12),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Color(0xFF54A5DA),
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
