import 'package:demo_club/Models/FoodCategory.dart';
import 'package:demo_club/Models/UserModel.dart';
import 'package:demo_club/Screens/MyHomePage.dart';
import 'package:demo_club/Screens/OfferScren.dart';
import 'package:demo_club/Screens/RestaurantAfterQr.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Models/RestaurantCart.dart';
import 'Screens/CheckOutPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(392, 807),
        allowFontScaling: false,
        builder: () => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => UserData(),
                ),
                ChangeNotifierProvider(
                  create: (context) => FoodService(),
                ),
                ChangeNotifierProvider(
                  create: (context) => RestaurantCart(),
                ),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: MyHomePage(),
              ),
            ));
  }
}
