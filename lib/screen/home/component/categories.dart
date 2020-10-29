import 'package:flutter/material.dart';
import 'package:food_app/util/size_config.dart';
import 'package:food_app/service/category_api.dart';

import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(24),
          ),
          ...List.generate(
            categories.length,
            (index) => CategoryCard(
              category: categories[index],
              onPress: () {},
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(11),
          ),
        ],
      ),
    );
  }
}
