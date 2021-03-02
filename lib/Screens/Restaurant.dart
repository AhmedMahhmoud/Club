import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Screens/QrScreen.dart';
import 'package:demo_club/Widgets/QRalert.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                UserHeader2(),
                SizedBox(height: 200.h),
                Align(
                  child: QrAlert(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QrCodeScreen(),
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
          BackkIcon(
            function: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
