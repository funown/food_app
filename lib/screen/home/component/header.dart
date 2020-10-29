import 'package:flutter/material.dart';
import 'package:food_app/util/size_config.dart';

import 'categories.dart';
import 'title_bar.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(326),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF444444).withOpacity(0.06),
            offset: Offset(0, 10),
            blurRadius: 100,
          ),
        ],
      ),
      child: Column(
        children: [
          TitleBar(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          Categories(),
        ],
      ),
    );
  }
}
