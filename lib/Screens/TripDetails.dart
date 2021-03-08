import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'SportsActivitiesDetails.dart';

class HegAndOmraInformationScreen extends StatefulWidget {
  final String image1, title;

  final int tripRegisterPrice, totalPrice, index;
  HegAndOmraInformationScreen(
      {this.image1,
      this.index,
      this.tripRegisterPrice,
      this.totalPrice,
      this.title});

  @override
  _HegAndOmraInformationScreenState createState() =>
      _HegAndOmraInformationScreenState();
}

List<String> filteredImages = [];

class _HegAndOmraInformationScreenState
    extends State<HegAndOmraInformationScreen> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(color: Theme.of(context).backgroundColor);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          Column(
            children: [
              UserHeader2(),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 180.h),
                duration: Duration(seconds: 1),
                curve: Curves.easeIn,
                builder: (context, value, child) {
                  return Container(
                      height: value,
                      width: MediaQuery.of(context).size.width,
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          widget.image1,
                        ),
                      ));
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red[800],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                topLeft: Radius.circular(15))),
                        padding: EdgeInsets.only(right: 8),
                        height: 50.h,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      HegOmraTripCardDate(
                        title: "تاريخ الرحلة",
                        displayWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "9 فبراير",
                                style: textStyle,
                              ),
                            ),
                            Text("الى", style: textStyle),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "8 فبراير",
                                style: textStyle,
                              ),
                            ),
                            Text(
                              "من ",
                              style: textStyle,
                            ),
                          ],
                        ),
                      ),

                      //Class takes the information needed to be displayed for heg or omra.

                      HegOmraTripCard(
                        title: "مدة الرحلة",
                        displayWidget: "1 يوم",
                      ),
                      HegOmraTripCard(
                        title: "وسيلة المواصلات  ",
                        displayWidget: 'اتوبيس Go bus',
                      ),
                      HegOmraTripCard(
                        title: "عدد المرافقين المسموح بهم",
                        displayWidget: "3",
                      ),

                      HegOmraTripCard(
                          title: " المبلغ الأجمالى", displayWidget: '130'),
                      SizedBox(
                        height: 10.h,
                      ),

                      PaymentButton()
                    ],
                  ),
                ),
              ),
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
        ]));
  }
}

class HegOmraTripCard extends StatelessWidget {
  final String displayWidget;
  final String title;
  const HegOmraTripCard({
    this.title,
    this.displayWidget,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).highlightColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), topLeft: Radius.circular(25)),
      ),
      child: Align(
        child: Container(
          padding: EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.red[800],
                      fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                thickness: 1,
                height: 2,
                color: Theme.of(context).hintColor,
              ),
              Directionality(
                textDirection: ui.TextDirection.rtl,
                child: Text(displayWidget,
                    style: TextStyle(color: Theme.of(context).backgroundColor)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HegOmraTripCardDate extends StatelessWidget {
  final Widget displayWidget;
  final String title;
  const HegOmraTripCardDate({
    this.title,
    this.displayWidget,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), topLeft: Radius.circular(25)),
      ),
      child: Align(
        child: Container(
          padding: EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.red[800],
                      fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                  thickness: 1, height: 2, color: Theme.of(context).hintColor),
              displayWidget
            ],
          ),
        ),
      ),
    );
  }
}
