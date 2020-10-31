import 'package:flutter/material.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/screen/product_detail/product_detail_screen.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';
import 'package:food_app/screen/widget/default_button.dart';
import 'package:food_app/screen/widget/purchase_amount_chooser.dart';

import 'product_carousel.dart';

class Body extends StatefulWidget {
  final int index;
  final List<Product> productList;
  final ValueChanged<int> onPageChange;

  const Body({
    Key key,
    this.index,
    this.productList,
    this.onPageChange,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _pageIndex = widget.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(18),
            ),
            ProductCarousel(
              initialPage: _pageIndex,
              products: widget.productList,
              onPageChange: (value) {
                setState(() {
                  _pageIndex = value;
                });
                if (widget.onPageChange != null) {
                  widget.onPageChange(value);
                }
              },
            ),
            SizedBox(
              height: getProportionateScreenHeight(24),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.productList[_pageIndex].title,
                        style: kHeadingStyle,
                      ),
                      RatingStar(
                        rating: widget.productList[_pageIndex].rating,
                      ),
                    ],
                  ),
                  Text(
                    "\$ ${widget.productList[_pageIndex].price}",
                    style: TextStyle(
                      color: Color(0xFF27AE60),
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(14),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  Text(
                    widget.productList[_pageIndex].description,
                    maxLines: 4,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: getProportionateScreenWidth(14),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(17),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "leave a note for the restaurant",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: getProportionateScreenWidth(14),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(16),
                          horizontal: getProportionateScreenWidth(19),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(24),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(24),
              ),
              child: Row(
                children: [
                  PurchaseAmountChooser(
                    onPress: (value) {},
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(13),
                  ),
                  Expanded(
                    child: DefaultButton(
                      text: "Continue",
                      color: Color(0xFF54A5DA),
                      onPress: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingStar extends StatelessWidget {
  const RatingStar({
    Key key,
    this.rating,
  }) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          3,
          (index) => Icon(
            Icons.star,
            size: getProportionateScreenWidth(16),
            color: index <= rating - 1 ? Color(0xFFFA5D5D) : Color(0xFFC4C4C4),
          ),
        ),
      ],
    );
  }
}
