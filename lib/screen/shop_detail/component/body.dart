import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/model/shop.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';
import 'package:food_app/screen/product_detail/component/body.dart';

import 'map_button.dart';
import 'product_section.dart';

class Body extends StatelessWidget {
  final Shop shop;

  const Body({
    Key key,
    @required this.shop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenWidth(24),
                left: getProportionateScreenWidth(24),
                right: getProportionateScreenWidth(24),
              ),
              child: Stack(
                children: [
                  Container(
                    width: getProportionateScreenWidth(327),
                    height: getProportionateScreenWidth(327),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(16),
                      ),
                      image: DecorationImage(
                        image: AssetImage(shop.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: getProportionateScreenHeight(18),
                    left: getProportionateScreenWidth(19),
                    child: MapButton(
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(18),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // shop massage
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        shop.title,
                        style: kHeadingStyle,
                      ),
                      RatingStar(
                        rating: shop.rating,
                      ),
                    ],
                  ),
                  Text(
                    shop.location,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: getProportionateScreenWidth(14),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  // rewards
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: getProportionateScreenHeight(62),
                      decoration: BoxDecoration(
                        color: Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(8),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenWidth(9),
                        horizontal: getProportionateScreenWidth(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Check the reward in this resto",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14),
                                ),
                              ),
                              Text(
                                "${shop.rewards.length} Reward",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(12),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: getProportionateScreenWidth(24),
                            height: getProportionateScreenWidth(24),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            ProductSection(
              shop: shop,
            ),
          ],
        ),
      ),
    );
  }
}
