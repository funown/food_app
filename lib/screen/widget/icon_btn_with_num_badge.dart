import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';

class IconBtnWithNumBadge extends StatelessWidget {
  const IconBtnWithNumBadge({
    Key key,
    @required this.iconSrc,
    this.badgeNum,
    @required this.onTap,
  }) : super(key: key);

  final String iconSrc;
  final int badgeNum;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            width: getProportionateScreenWidth(24),
            height: getProportionateScreenWidth(24),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: SvgPicture.asset(
              iconSrc,
            ),
          ),
          Visibility(
            visible: badgeNum != null && badgeNum != 0,
            child: Positioned(
              top: -5,
              right: -11,
              child: Container(
                width: getProportionateScreenWidth(20),
                height: getProportionateScreenWidth(20),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    "$badgeNum",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
