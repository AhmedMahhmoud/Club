import 'package:demo_club/Models/FoodCategory.dart';
import 'package:demo_club/Models/UserModel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Models/ContactUsModel.dart';
import 'Models/RestaurantCart.dart';

import 'Screens/SplashScreen.dart';
import 'Widgets/globalFile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print('changes');
      setState(() {});
    });
  }

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
                ChangeNotifierProvider(
                  create: (context) => ContactUsData(),
                )
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light().copyWith(
                    primaryColor: Colors.red[900],
                    backgroundColor: Colors.black,
                    highlightColor: Colors.white,
                    primaryColorDark: Colors.white,
                    accentColor: Colors.orange[700],
                    hintColor: Colors.grey,
                    focusColor: Colors.black,
                    cardColor: Colors.white),
                darkTheme: ThemeData.dark().copyWith(
                    primaryColor: Colors.red[900],
                    backgroundColor: Colors.black,
                    highlightColor: Colors.white,
                    primaryColorDark: Colors.white,
                    accentColor: Colors.orange[700],
                    cardColor: Colors.black,
                    focusColor: Colors.white,
                    hintColor: Colors.grey),
                themeMode: currentTheme.currentTheme(),
                home: SplashScreen(),
              ),
            ));
  }
}
