import 'package:flutter/material.dart';
import 'package:food_app/screen/home/home_screen.dart';
import 'package:food_app/screen/model/current_product_model.dart';
import 'package:food_app/util/constant.dart';
import 'package:food_app/util/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrentProductModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        fontFamily: "Heebo",
        // primarySwatch: Colors.blue,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: kBackgroundColor,
          iconTheme: IconThemeData(
            color: kHeadingColor,
          ),
        ),
        splashColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: HomeScreen.routeName,
    );
  }
}
