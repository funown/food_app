import 'package:flutter/material.dart';
import 'package:food_app/util/size_config.dart';

import 'nav_item.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key key,
    this.onTap,
    this.iconItems,
    this.selectedIndex = 0,
  }) : super(key: key);

  final List<String> iconItems;
  final ValueChanged<int> onTap;
  final int selectedIndex;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<NavItem> items = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    createNavItems();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: getProportionateScreenWidth(12),
      right: getProportionateScreenWidth(12),
      bottom: getProportionateScreenHeight(22),
      child: Container(
        width: double.infinity,
        height: getProportionateScreenHeight(75),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(36),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: getProportionateScreenWidth(36),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...items,
          ],
        ),
      ),
    );
  }

  void createNavItems() {
    for (var i = 0; i < widget.iconItems.length; i++) {
      var icon = widget.iconItems[i];
      setState(() {
        items.add(NavItem(
          selected: i == _selectedIndex,
          icon: icon,
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap(i);
              setState(() {
                _selectedIndex = i;
                items.clear();
                createNavItems();
              });
            }
          },
        ));
      });
    }
  }
}
