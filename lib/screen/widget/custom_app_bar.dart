import 'package:flutter/material.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';

import 'rounded_icon_btn.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar({
    this.leading,
    this.title,
    this.tailer,
    this.padding,
  });

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  final Widget leading;
  final Widget title;
  final Widget tailer;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        padding: padding != null
            ? padding
            : EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(24),
              ),
        child: Row(
          children: [
            leading != null
                ? leading
                : RoundedIconBtn(
                    icon: Icons.arrow_back,
                    onPress: () => Navigator.pop(context),
                  ),
            title != null ? title : Container(),
            Spacer(),
            tailer != null ? tailer : Container(),
          ],
        ),
      ),
    );
  }
}
