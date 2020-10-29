import 'package:flutter/material.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';

class ShopProductCard extends StatelessWidget {
  const ShopProductCard({
    Key key,
    this.product,
    this.onFavoriteTap,
    this.onTap,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback onTap;
  final GestureTapCallback onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: getProportionateScreenWidth(70),
        padding: EdgeInsets.only(
          top: getProportionateScreenWidth(9),
          bottom: getProportionateScreenWidth(9),
          left: getProportionateScreenWidth(10),
        ),
        margin: EdgeInsets.only(
          bottom: getProportionateScreenHeight(16),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF444444).withOpacity(0.1),
              blurRadius: getProportionateScreenWidth(24),
              offset: Offset(0, getProportionateScreenWidth(12)),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: getProportionateScreenWidth(52),
              height: getProportionateScreenWidth(52),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(8),
                ),
              ),
              child: Image.asset(product.prevImg),
            ),
            SizedBox(
              width: getProportionateScreenWidth(12),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: kHeadingStyle.copyWith(
                    height: 1.6,
                    fontSize: getProportionateScreenWidth(16),
                  ),
                ),
                Row(
                  children: [
                    Visibility(
                      visible: product.isOnSale,
                      child: Text(
                        "\$ ${product.price}",
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(6),
                    ),
                    Text(
                      "\$ ${product.isOnSale ? product.discounts : product.price}",
                      style: TextStyle(
                        height: 1.6,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenWidth(5),
                right: getProportionateScreenWidth(19),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: onFavoriteTap,
                    child: Icon(
                      product.isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      size: getProportionateScreenWidth(18),
                      color: product.isFavorite
                          ? Color(0xFFFA5D5D)
                          : Color(0xFF747474),
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
