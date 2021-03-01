import 'package:demo_club/Models/FoodCategory.dart';
import 'package:demo_club/Models/UserModel.dart';
import 'package:demo_club/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Screens/MyHomePage.dart';
import 'Screens/RestaurantAfterQr.dart';

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
                )
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
