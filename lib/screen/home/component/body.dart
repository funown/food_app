import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/screen/widget/bottom_nav_bar.dart';
import 'package:food_app/util/size_config.dart';

import 'header.dart';
import 'shop_section.dart';
import 'popular_section.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                SizedBox(
                  height: getProportionateScreenHeight(24),
                ),
                PopularSection(),
                SizedBox(
                  height: getProportionateScreenHeight(24),
                ),
                ShopSection(),
                SizedBox(
                  height: getProportionateScreenHeight(97),
                ),
              ],
            ),
          ),
          BottomNavBar(
            iconItems: [
              'assets/icons/home.svg',
              'assets/icons/file-text.svg',
              'assets/icons/bell.svg',
              'assets/icons/user.svg',
            ],
            onTap: (index) {},
          ),
        ],
      ),
    );
  }
}
