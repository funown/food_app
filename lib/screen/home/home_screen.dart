import 'package:flutter/material.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';

import 'component/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Body(),
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }
}
