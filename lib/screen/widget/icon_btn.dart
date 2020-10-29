import 'package:flutter/material.dart';
import 'package:food_app/util/size_config.dart';

class IconBtn extends StatelessWidget {
  const IconBtn({
    Key key,
    @required this.icon,
    @required this.onPress,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: getProportionateScreenWidth(50),
        height: getProportionateScreenWidth(50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF444444).withOpacity(0.1),
              blurRadius: 24,
            ),
          ],
        ),
        child: Icon(
          icon,
          size: getProportionateScreenWidth(20),
        ),
      ),
    );
  }
}
