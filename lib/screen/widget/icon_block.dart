import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/util/size_config.dart';

class IconBlock extends StatelessWidget {
  const IconBlock({
    Key key,
    @required this.icon,
    @required this.blockColor,
    @required this.width,
    @required this.height,
    @required this.radius,
    @required this.iconPadding,
  }) : super(key: key);

  final String icon;
  final Color blockColor;
  final double width;
  final double height;
  final double radius;
  final double iconPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(width),
      height: getProportionateScreenWidth(height),
      padding: EdgeInsets.all(
        getProportionateScreenWidth(iconPadding),
      ),
      decoration: BoxDecoration(
        color: blockColor,
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(radius),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            color: blockColor.withOpacity(0.4),
            blurRadius: getProportionateScreenWidth(24),
          ),
        ],
      ),
      child: SvgPicture.asset(
        icon,
      ),
    );
  }
}
