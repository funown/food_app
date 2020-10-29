import 'package:flutter/material.dart';
import 'package:food_app/util/size_config.dart';

import 'dotted_icon_btn.dart';

class PurchaseAmountChooser extends StatefulWidget {
  final ValueChanged<int> onPress;

  final int initialNum;
  final double btnSize;
  final TextStyle textStyle;

  const PurchaseAmountChooser({
    Key key,
    @required this.onPress,
    this.btnSize = 50,
    this.textStyle,
    this.initialNum = 1,
  }) : super(key: key);

  @override
  _PurchaseAmountChooserState createState() => _PurchaseAmountChooserState();
}

class _PurchaseAmountChooserState extends State<PurchaseAmountChooser> {
  int _selectedAmount = 1;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedAmount = widget.initialNum;
    });
  }

  void addAmount() {
    setState(() {
      _selectedAmount++;
    });
  }

  void removeAmount() {
    if (_selectedAmount > 1) {
      setState(() {
        _selectedAmount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DottedIconBtn(
          icon: Icons.remove,
          btnSize: widget.btnSize,
          onPress: () {
            removeAmount();
            if (widget.onPress != null) {
              widget.onPress(_selectedAmount);
            }
          },
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(15),
          ),
          child: Text(
            "$_selectedAmount",
            textAlign: TextAlign.center,
            style: widget.textStyle == null
                ? TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20),
                  )
                : widget.textStyle,
          ),
        ),
        DottedIconBtn(
          icon: Icons.add,
          btnSize: widget.btnSize,
          onPress: () {
            addAmount();
            if (widget.onPress != null) {
              widget.onPress(_selectedAmount);
            }
          },
        ),
      ],
    );
  }
}
