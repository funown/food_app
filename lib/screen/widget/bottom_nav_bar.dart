import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/util/size_config.dart';

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
  List<Widget> items = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
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
          children: createNavItems(),
        ),
      ),
    );
  }

  List<Widget> createNavItems() {
    List<Widget> navItems = [];
    for (var i = 0; i < widget.iconItems.length; i++) {
      var icon = widget.iconItems[i];
      bool isSelected = (_selectedIndex == i);
      navItems.add(
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              _selectedIndex = i;
              widget.onTap(_selectedIndex);
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            padding: EdgeInsets.only(
              top: getProportionateScreenHeight(24),
            ),
            width: getProportionateScreenWidth(30),
            child: Column(
              children: [
                SvgPicture.asset(
                  icon,
                  width: 22,
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(9.5),
                ),
                AnimatedContainer(
                  width: isSelected ? getProportionateScreenWidth(30) : 0,
                  height: getProportionateScreenHeight(4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  duration: Duration(milliseconds: 200),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return navItems;
  }
}
