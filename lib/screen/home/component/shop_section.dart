import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_app/screen/shop_detail/shop_detail_screen.dart';
import 'package:food_app/screen/widget/icon_block.dart';
import 'package:food_app/service/shop_api.dart';
import 'package:food_app/util/size_config.dart';

import 'section_title_block.dart';
import 'shop_card.dart';

class ShopSection extends StatelessWidget {
  const ShopSection({
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
            icon: IconBlock(
              icon: "assets/icons/map-pin.svg",
              blockColor: Color(0xFF54A5DA),
              radius: 8,
              width: 42,
              height: 42,
              iconPadding: 11,
            ),
            title: "Near You",
            subTitle: "Jakarta, Indonesia",
            onTap: () {},
          ),
          SizedBox(
            height: getProportionateScreenHeight(24),
          ),
          StaggeredGridView.countBuilder(
            shrinkWrap: true,
            itemCount: shops.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ShopCard(
                shop: shops[index],
                onTap: () => Navigator.pushNamed(
                  context,
                  ShopDetailScreen.routeName,
                  arguments: ShopDetailScreenArguments(shop: shops[index]),
                ),
              );
            },
            crossAxisCount: 4,
            crossAxisSpacing: 13,
            mainAxisSpacing: 16,
            staggeredTileBuilder: (int index) => StaggeredTile.count(
                2, shops[index].title.length > 18 ? 3 : 2.8),
          ),
        ],
      ),
    );
  }
}
