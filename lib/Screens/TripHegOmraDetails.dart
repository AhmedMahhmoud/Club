import 'package:demo_club/Screens/SportsActivitiesDetails.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:provider/provider.dart';

import 'CreditCard.dart';
import 'TripDetails.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HegInformationScreen extends StatefulWidget {
  final String image1, title;

  final int tripRegisterPrice, totalPrice, index;
  HegInformationScreen(
      {this.image1,
      this.index,
      this.tripRegisterPrice,
      this.totalPrice,
      this.title});

  @override
  _HegInformationScreenState createState() => _HegInformationScreenState();
}

List<String> filteredImages = [];

class _HegInformationScreenState extends State<HegInformationScreen> {
  List<String> filteredImages = [];

  int calcDateDifferance(String strtDate, String endDate) {
    DateTime startDate = DateTime.parse(strtDate);
    DateTime endingDate = DateTime.parse(endDate);

    final differancee = endingDate.difference(startDate).inDays;
    return differancee;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 180.h),
                  duration: Duration(seconds: 1),
                  curve: Curves.easeIn,
                  builder: (context, value, child) {
                    return Container(
                        height: value,
                        width: MediaQuery.of(context).size.width,
                        child: Image(
                          image: NetworkImage(widget.image1),
                          fit: BoxFit.cover,
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
                                  color: Theme.of(context).highlightColor),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        HegOmraTripCardDate(
                          title: "تاريخ الرحلة",
                          displayWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "3-6-2021",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text("الى",
                                  style: TextStyle(color: Colors.black)),
                              Text("3-3-2021",
                                  style: TextStyle(color: Colors.black)),
                              Text(
                                "من ",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),

                        //Class takes the information needed to be displayed for heg or omra.
                        HegOmraTripCard(
                            title: "شركه النقل", displayWidget: "GoBus"),
                        HegOmraTripCard(
                            title: "مده الرحلة", displayWidget: "3 ايام"),
                        HegOmraTripCard(
                            title: "وسيله السفر ", displayWidget: "برى"),
                        HegOmraTripCard(
                            title: "ليالي المدينة ", displayWidget: "2"),
                        HegOmraTripCard(
                            title: "ليالي مكة  ", displayWidget: "1"),
                        HegOmraTripCard(
                          title: " فندق مكة",
                          displayWidget: "فندق البشسييش",
                        ),
                        HegOmraTripCard(
                          title: " فندق المدينة",
                          displayWidget: "فندق الأمين",
                        ),
                        HegOmraTripCard(
                          title: " قيمة الحجز",
                          displayWidget: "14000",
                        ),
                        HegOmraTripCard(
                          title: " المبلغ الأجمالي",
                          displayWidget: "16000",
                        ),
                      ],
                    ),
                  ),
                ),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(seconds: 1),
                  curve: Curves.easeIn,
                  builder: (context, value, child) {
                    return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentScreen(
                                paymentButton: "اتمام الدفع",
                              ),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: PaymentButton(),
                        ));
                  },
                )
              ],
            ),
            BackkIcon(function: () => Navigator.pop(context))
          ],
        ),
      ),
    );
  }
}
