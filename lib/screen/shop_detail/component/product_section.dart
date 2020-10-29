import 'package:flutter/material.dart';
import 'package:food_app/model/shop.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';
import 'package:food_app/service/shop_api.dart';

import 'shop_product_card.dart';

class ProductSection extends StatefulWidget {
  final Shop shop;

  const ProductSection({
    Key key,
    @required this.shop,
  }) : super(key: key);

  @override
  _ProductSectionState createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  String _category;
  int _filteredProductsNum = 0;

  @override
  void initState() {
    super.initState();
    _filteredProductsNum = widget.shop.products.length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCategoryPanel(),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        // product list part
        buildProductList(),
      ],
    );
  }

  Container buildProductList() {
    return Container(
      width: double.infinity,
      color: kBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(24),
        ),
        child: Column(
          children: [
            ...List.generate(
              _filteredProductsNum,
              (index) {
                if (_category != null &&
                    _category != "" &&
                    !widget.shop.products[index].tags.contains(_category)) {
                  return Container();
                }
                return ShopProductCard(
                  product: widget.shop.products[index],
                  onTap: () {},
                  onFavoriteTap: () {
                    setState(() {
                      widget.shop.products[index].isFavorite =
                          !widget.shop.products[index].isFavorite;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Row buildCategoryPanel() {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(24),
        ),
        ...List.generate(
          widget.shop.categories.length,
          (index) => Padding(
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(10),
            ),
            child: ChoiceChip(
              label: Text(
                widget.shop.categories[index],
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: _category == widget.shop.categories[index]
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: _category == widget.shop.categories[index]
                      ? Colors.white
                      : Colors.grey,
                ),
              ),
              selected: _category == widget.shop.categories[index],
              onSelected: (value) {
                if (value) {
                  setState(() {
                    _category = widget.shop.categories[index];
                    _filteredProductsNum = widget.shop.products
                        .where((element) => element.tags.contains(_category))
                        .length;
                  });
                } else {
                  setState(() {
                    _category = "";
                    _filteredProductsNum = widget.shop.products.length;
                  });
                }
              },
              selectedColor: Colors.blue,
              backgroundColor: Color(0xFF444444).withOpacity(0.1),
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(24),
        ),
      ],
    );
  }
}
