import 'package:flutter/material.dart';
import 'package:food_app/util/size_config.dart';

const kHeadingColor = Color(0xFF333333);
const kSecondaryColor = Color(0xFF747474);
const kBackgroundColor = Color(0xFFFEFEFE);

final kHeadingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(24),
  fontWeight: FontWeight.bold,
  color: kHeadingColor,
  height: 1.5,
);
final kSectionTitleStyle = TextStyle(
  height: 1.6,
  letterSpacing: 0.5,
  color: kHeadingColor,
  fontWeight: FontWeight.bold,
  fontSize: getProportionateScreenWidth(16),
);
