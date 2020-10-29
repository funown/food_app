import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_app/util/size_config.dart';

class DottedIconBtn extends StatelessWidget {
  const DottedIconBtn({
    Key key,
    @required this.icon,
    @required this.onPress,
    this.btnSize = 50,
  }) : super(key: key);

  final double btnSize;
  final IconData icon;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.grey,
      strokeWidth: 1,
      borderType: BorderType.Circle,
      child: Container(
        width: getProportionateScreenWidth(btnSize),
        height: getProportionateScreenWidth(btnSize),
        child: FlatButton(
          color: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(100),
            ),
          ),
          child: Icon(
            icon,
            color: Color(0xFF747474),
            size: getProportionateScreenWidth(20),
          ),
          onPressed: onPress,
        ),
      ),
    );
  }
}
