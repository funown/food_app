import 'package:flutter/material.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/service/popular_api.dart';
import 'package:food_app/util/size_config.dart';

class ProductCarousel extends StatefulWidget {
  final ValueChanged<int> onPageChange;
  final int initialPage;
  final List<Product> products;

  const ProductCarousel({
    Key key,
    this.onPageChange,
    this.products,
    this.initialPage,
  }) : super(key: key);

  @override
  _ProductCarouselState createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  PageController _pageController;
  int initialPage = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      initialPage = widget.initialPage;
    });
    _pageController = PageController(
      viewportFraction:
          getProportionateScreenWidth(300) / SizeConfig.screenWidth,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: SizeConfig.screenWidth / getProportionateScreenHeight(370),
      child: PageView.builder(
        itemCount: populars.length,
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) => buildProductCardSlider(index),
        onPageChanged: (value) {
          setState(() {
            initialPage = value;
          });
          if (widget.onPageChange != null) {
            widget.onPageChange(value);
          }
        },
      ),
    );
  }

  AnimatedBuilder buildProductCardSlider(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      child: Container(
        margin: EdgeInsets.only(
          right: getProportionateScreenWidth(13),
        ),
        width: getProportionateScreenWidth(300),
        height: getProportionateScreenHeight(369.61),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(16),
          ),
          image: DecorationImage(
            image: AssetImage(
              populars[index].image,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return AnimatedOpacity(
          duration: Duration(milliseconds: 400),
          opacity: initialPage == index ? 1 : 0.4,
          child: child,
        );
      },
    );
  }
}
