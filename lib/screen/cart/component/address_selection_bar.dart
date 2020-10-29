import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/util/size_config.dart';

import 'dart:math' as math;

class AddressSelectionBar extends StatelessWidget {
  const AddressSelectionBar({
    Key key,
    this.address,
  }) : super(key: key);

  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(106),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xFFDEDEDE),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(12),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(11),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Send To",
                  style: TextStyle(
                    height: 1.5,
                    color: Colors.grey,
                    fontSize: getProportionateScreenWidth(12),
                  ),
                ),
                Container(
                  width: getProportionateScreenWidth(18),
                  height: getProportionateScreenWidth(18),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(6),
                    vertical: getProportionateScreenWidth(4),
                  ),
                  child: Transform.rotate(
                    angle: math.pi,
                    child: SvgPicture.asset(
                      'assets/icons/Vector.svg',
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(7),
            ),
            Row(
              children: [
                Container(
                  width: getProportionateScreenWidth(52),
                  height: getProportionateScreenWidth(52),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(8),
                    ),
                  ),
                  child: Image.asset(
                    "assets/images/map.png",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(15),
                ),
                Container(
                  width: SizeConfig.screenWidth * 0.5,
                  child: Text(
                    address,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
