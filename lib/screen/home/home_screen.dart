import 'package:flutter/material.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';

import 'component/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    // init SizeConfig to get screen size
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Body(),
    );
  }
}
