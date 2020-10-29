import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/model/shop.dart';
import 'package:food_app/screen/widget/custom_app_bar.dart';
import 'package:food_app/util/size_config.dart';

import 'component/body.dart';

class ShopDetailScreenArguments {
  final Shop shop;

  ShopDetailScreenArguments({@required this.shop});
}

class ShopDetailScreen extends StatelessWidget {
  static String routeName = "/detail/shop";

  @override
  Widget build(BuildContext context) {
    final ShopDetailScreenArguments arguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: buildCustomAppBar(context),
      backgroundColor: Colors.white,
      body: Body(
        shop: arguments.shop,
      ),
    );
  }

  CustomAppBar buildCustomAppBar(BuildContext context) {
    return CustomAppBar(
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          width: getProportionateScreenWidth(24),
          height: getProportionateScreenWidth(24),
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(5),
            vertical: getProportionateScreenHeight(4),
          ),
          child: SvgPicture.asset(
            'assets/icons/Vector.svg',
          ),
        ),
      ),
    );
  }
}
