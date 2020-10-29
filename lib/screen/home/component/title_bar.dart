import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';
import 'package:food_app/screen/widget/icon_btn.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(15),
        left: getProportionateScreenWidth(24),
        right: getProportionateScreenWidth(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: getProportionateScreenWidth(246),
            child: Text(
              "What do you want to eat today?",
              style: kHeadingStyle,
              maxLines: 2,
            ),
          ),
          // Search button
          IconBtn(
            icon: Icons.search_rounded,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
