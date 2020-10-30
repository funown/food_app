import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/util/size_config.dart';

class NavItem extends StatelessWidget {
  NavItem({
    Key key,
    @required this.icon,
    this.onTap,
    this.selected = false,
  }) : super(key: key);

  final String icon;
  final VoidCallback onTap;

  bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(24),
      ),
      width: getProportionateScreenWidth(30),
      duration: Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              width: 22,
              color: selected ? Colors.blue : Colors.grey,
            ),
            SizedBox(
              height: getProportionateScreenHeight(9.5),
            ),
            Visibility(
              visible: selected,
              child: Container(
                width: getProportionateScreenWidth(30),
                height: getProportionateScreenHeight(4),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
