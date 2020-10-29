import 'package:flutter/material.dart';
import 'package:food_app/util/size_config.dart';
import 'package:food_app/service/popular_api.dart';
import 'package:food_app/screen/widget/icon_block.dart';
import 'package:food_app/screen/product_detail/product_detail_screen.dart';

import 'product_card.dart';
import 'section_title_block.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(24),
      ),
      child: Column(
        children: [
          SectionTitleBlock(
            title: "Popular",
            subTitle: "Let’s choose, and enjoy the food",
            icon: IconBlock(
              icon: "assets/icons/heart.svg",
              blockColor: Color(0xFFFA5D5D),
              radius: 8,
              width: 42,
              height: 42,
              iconPadding: 11,
            ),
            onTap: () {},
          ),
          SizedBox(
            height: getProportionateScreenHeight(24),
          ),
          ...List.generate(
            populars.length > 3 ? 3 : populars.length,
            (index) => ProductCard(
              product: populars[index],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ProductDetailScreen.routeName,
                  arguments: ProductDetailScreenArguments(
                    index: index,
                    productList: populars,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
