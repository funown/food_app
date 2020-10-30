import 'package:flutter/material.dart';
import 'package:food_app/util/size_config.dart';

class IconBtn extends StatefulWidget {
  const IconBtn({
    Key key,
    @required this.icon,
    @required this.onPress,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCallback onPress;

  @override
  _IconBtnState createState() => _IconBtnState();
}

class _IconBtnState extends State<IconBtn> with SingleTickerProviderStateMixin {
  // implement an press animation
  AnimationController _animationController;
  Animation _shadowAnimation;
  Animation _blurAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _shadowAnimation = Tween(begin: 0.1, end: 0.3).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _blurAnimation = Tween(begin: 0.24, end: 0.10).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _animationController.forward().then(
              (value) => _animationController.reverse(),
            );
        widget.onPress();
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: getProportionateScreenWidth(50),
        height: getProportionateScreenWidth(50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF444444).withOpacity(_shadowAnimation.value),
              blurRadius: _blurAnimation.value * 100,
            ),
          ],
        ),
        child: Icon(
          widget.icon,
          size: getProportionateScreenWidth(20),
        ),
      ),
    );
  }
}
