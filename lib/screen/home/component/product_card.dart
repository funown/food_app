import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';
import 'package:food_app/service/tag_api.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    @required this.product,
    @required this.onTap,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: getProportionateScreenHeight(100),
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(11),
        ),
        margin: EdgeInsets.only(
          bottom: getProportionateScreenHeight(16),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(16),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 24,
              offset: Offset(0, 12),
              color: Color(0xFF444444).withOpacity(0.1),
            ),
          ],
        ),
        child: Row(
          children: [
            // product image
            Container(
              width: getProportionateScreenWidth(80),
              height: getProportionateScreenWidth(80),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(12),
                ),
              ),
              child: Image.asset(
                product.prevImg,
              ),
            ),
            // product massage
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(13),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: getProportionateScreenHeight(2),
                    ),
                    child: Text(
                      product.title,
                      style: TextStyle(
                        height: 1.4,
                        fontWeight: FontWeight.w800,
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                  ),
                  // product tags chip
                  Row(
                    children: [
                      ...List.generate(
                        product.tags.length,
                        (index) => Container(
                          height: getProportionateScreenHeight(18),
                          margin: EdgeInsets.only(
                            right: getProportionateScreenWidth(4),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(2),
                            horizontal: getProportionateScreenWidth(8),
                          ),
                          decoration: BoxDecoration(
                            color:
                                tagsColor[product.tags[index]].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenWidth(50),
                            ),
                          ),
                          child: Text(
                            product.tags[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 10,
                              color: tagsColor[product.tags[index]],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  // shop & price
                  Container(
                    width: getProportionateScreenWidth(200),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/locate.svg',
                          width: getProportionateScreenWidth(12),
                          height: getProportionateScreenWidth(12),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(4),
                        ),
                        Text(
                          product.shop,
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: getProportionateScreenWidth(12),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "\$ ${product.price}",
                          style: TextStyle(
                            fontSize: 12,
                            color: kHeadingColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
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
