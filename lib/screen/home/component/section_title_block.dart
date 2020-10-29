import 'package:flutter/material.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';
import 'package:food_app/screen/widget/icon_block.dart';

class SectionTitleBlock extends StatelessWidget {
  const SectionTitleBlock({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.subTitle,
    @required this.onTap,
  }) : super(key: key);

  final IconBlock icon;
  final String title;
  final String subTitle;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: getProportionateScreenWidth(15),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: kSectionTitleStyle,
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: kSecondaryColor,
                fontSize: getProportionateScreenWidth(12),
              ),
            ),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.arrow_forward_rounded,
            size: 24,
          ),
        ),
      ],
    );
  }
}
