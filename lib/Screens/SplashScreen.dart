import 'dart:async';

import 'package:demo_club/Screens/MyHomePage.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  reverse() {
    //Reverse animation Function

    setState(() {
      animationController.reverse();
      Timer(new Duration(milliseconds: 2000), () async {
//        checkSharedUserData();

        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => MyHomePage()));
      });
    });
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    //start Animation
    animationController.forward();

    new Timer(new Duration(milliseconds: 3000), () async {
      //Reverse animation
      reverse();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          FadeTransition(
            opacity: animationController.drive(
              CurveTween(curve: Curves.fastOutSlowIn),
            ),
            child: Stack(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: Image.asset('android/app/resources/logo.jpg')),
                    height: 150,
                    width: 150,
                  ),
                ),
                // Center(
                //   child: Padding(
                //     padding: const EdgeInsets.only(right: 8.0),
                //     child: Container(
                //       width: 500,
                //       child: Lottie.asset("android/app/resources/fire.json",
                //           fit: BoxFit.fitWidth),
                //     ),
                //   ),
                // ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      height: 140,
                      width: 140,
                      child: Lottie.network(
                        "https://assets7.lottiefiles.com/temp/lf20_n16WIy.json",
                      )),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                      height: 140,
                      width: 140,
                      child: Lottie.network(
                        "https://assets7.lottiefiles.com/temp/lf20_n16WIy.json",
                      )),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Powered By",
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                  height: 60,
                                  child: Image.asset(
                                    'android/app/resources/tec-white.png',
                                    fit: BoxFit.fitHeight,
                                  )),
                            ],
                          ),
                          // Text(
                          //   "AMH Group احدى شركات ",
                          //   style: TextStyle(color: Colors.orange),
                          // ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
