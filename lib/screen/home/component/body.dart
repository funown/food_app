import 'package:flutter/material.dart';
import 'package:food_app/util/size_config.dart';
import 'package:food_app/screen/widget/bottom_nav_bar.dart';

import 'header.dart';
import 'shop_section.dart';
import 'popular_section.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox.expand(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
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

                // Add new page there
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
            selectedIndex: _pageIndex,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
      //
      //
      //using this page controller you can make beautiful animation effects
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    });
  }
}
