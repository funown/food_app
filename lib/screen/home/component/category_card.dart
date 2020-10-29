import 'package:flutter/material.dart';
import 'package:food_app/model/category.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.category,
    @required this.onPress,
  }) : super(key: key);

  final FoodCategory category;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.only(
          right: getProportionateScreenWidth(13),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: getProportionateScreenWidth(140),
              height: getProportionateScreenWidth(140),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(category.image),
            ),
            SizedBox(
              height: getProportionateScreenHeight(8),
            ),
            Text.rich(
              TextSpan(
                text: "${category.category}  -  ",
                style: TextStyle(
                  height: 1.5,
                  color: kSecondaryColor,
                  fontSize: getProportionateScreenWidth(12),
                ),
                children: [
                  TextSpan(
                    text: "${category.numOfItem} Item",
                    style: TextStyle(
                      color: kHeadingColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
