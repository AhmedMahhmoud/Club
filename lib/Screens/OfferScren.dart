import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Widgets/NewsTilesList.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';

import 'NewsDetails.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'OffersDetails.dart';

class OffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
        alignment: Alignment.topRight,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                UserHeader2(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "العروض ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return AnimatedPage(
                        card: offersList[index],
                        secondScreen: OfferDetails(
                          index: index,
                          description: offersList[index].description,
                          image: offersList[index].image,
                          title: offersList[index].newsTitle,
                          address: offersList[index].address,
                          phone: offersList[index].phone,
                        ),
                      );
                    },
                    itemCount: offersList.length,
                  ),
                )
              ],
            ),
            BackkIcon(function: () {
              Navigator.pop(context);
            }),
            Positioned(
              top: 40.h,
              left: 10.w,
              child: Notofications(),
            ),
          ],
        ),
      ),
    );
  }
}
