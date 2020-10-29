import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/service/cart_api.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';

import 'address_selection_bar.dart';
import 'cart_item_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(24),
          ),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              AddressSelectionBar(
                address: "242nd St Tonganoxie, Kansas (KS), 66086",
              ),
              SizedBox(
                height: getProportionateScreenHeight(24),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Order",
                        style: kSectionTitleStyle,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: cart.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                        bottom: getProportionateScreenWidth(16),
                      ),
                      child: Dismissible(
                        key: Key(cart[index].product.id.toString()),
                        direction: DismissDirection.startToEnd,
                        background: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/Trash.svg'),
                            ],
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            cart.removeAt(index);
                          });
                        },
                        child: CartItemCard(index: index),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
