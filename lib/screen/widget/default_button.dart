import 'package:flutter/material.dart';
import 'package:food_app/util/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.onPress,
    this.color,
  }) : super(key: key);

  final String text;
  final Color color;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(50),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: getProportionateScreenWidth(24),
            offset: Offset(0, getProportionateScreenWidth(8)),
          ),
        ],
      ),
      child: FlatButton(
        onPressed: onPress,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(16),
          ),
        ),
      ),
    );
  }
}
