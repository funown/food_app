import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/screen/widget/icon_block.dart';
import 'package:food_app/util/size_config.dart';

class MapButton extends StatelessWidget {
  const MapButton({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        getProportionateScreenWidth(27),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: getProportionateScreenWidth(290),
          height: getProportionateScreenHeight(54),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(27),
            ),
          ),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(8),
              ),
              child: Row(
                children: [
                  IconBlock(
                    icon: "assets/icons/map-pin-pink.svg",
                    blockColor: Color(0xFFFA5D5D),
                    width: 40,
                    height: 40,
                    radius: 100,
                    iconPadding: 12,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(11),
                  ),
                  Text(
                    "See location on map",
                    style: TextStyle(
                      letterSpacing: 0.5,
                      fontSize: getProportionateScreenWidth(14),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
