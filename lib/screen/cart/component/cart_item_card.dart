import 'package:flutter/material.dart';
import 'package:food_app/screen/widget/purchase_amount_chooser.dart';
import 'package:food_app/service/cart_api.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/size_config.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  bool _isExpanded = false;
  int _selectedNum;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedNum = cart[widget.index].numOfItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // curve: Curves.easeInOut,
      // duration: Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(12),
        horizontal: getProportionateScreenWidth(12),
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
      child: _isExpanded
          ? CartItemCardContent(
              index: widget.index,
              expandedChild: Padding(
                padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(12),
                ),
                child: Row(
                  children: [
                    PurchaseAmountChooser(
                      onPress: (value) {
                        setState(() {
                          _selectedNum = value;
                        });
                      },
                      btnSize: 36,
                      initialNum: cart[widget.index].numOfItem,
                      textStyle: TextStyle(
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(20),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(40),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = false;
                          cart[widget.index].numOfItem = _selectedNum;
                        });
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Color(0xFF54A5DA),
                          fontWeight: FontWeight.w400,
                          fontSize: getProportionateScreenWidth(14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : CartItemCardContent(
              index: widget.index,
              expandedChild: Padding(
                padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(4),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = true;
                    });
                  },
                  child: Text(
                    "edit",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: getProportionateScreenWidth(12),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

class CartItemCardContent extends StatelessWidget {
  const CartItemCardContent({
    Key key,
    this.index,
    this.expandedChild,
  }) : super(key: key);

  final int index;
  final Widget expandedChild;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: getProportionateScreenWidth(20),
          height: getProportionateScreenWidth(20),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Color(0xFFDEDEDE),
            ),
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(4),
            ),
          ),
          child: Center(
            child: Text(
              "${cart[index].numOfItem}x",
              style: TextStyle(
                height: 1.5,
                letterSpacing: 0.5,
                color: Color(0xFF747474),
                fontSize: getProportionateScreenWidth(10),
              ),
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(7),
        ),
        Container(
          width: getProportionateScreenWidth(52),
          height: getProportionateScreenWidth(52),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(8),
            ),
          ),
          child: Image.asset(
            cart[index].product.prevImg,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(11),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: SizeConfig.screenWidth * 0.4,
                  child: Text(
                    cart[index].product.title,
                    style: kSectionTitleStyle,
                    maxLines: 2,
                  ),
                ),
                Text(
                  "\$ ${cart[index].product.price}",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    height: 1.65,
                    letterSpacing: 0.5,
                    color: Color(0xFF333333),
                    fontWeight: FontWeight.w400,
                    fontSize: getProportionateScreenWidth(14),
                  ),
                ),
              ],
            ),
            expandedChild,
          ],
        ),
      ],
    );
  }
}
