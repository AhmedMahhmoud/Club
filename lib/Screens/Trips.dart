import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Screens/TripsHegOmra.dart';
import 'package:demo_club/Widgets/NewsTilesList.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Trips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              UserHeader2(),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  travelList[index].function)),
                      child: travelList[index]);
                },
                itemCount: travelList.length,
              )),
            ],
          ),
          Positioned(
            top: 40.h,
            left: 10.w,
            child: Notofications(),
          ),
          BackkIcon(function: () => Navigator.pop(context))
        ],
      ),
    );
  }
}

class MyHegCard extends StatelessWidget {
  final String tripName;
  final String tripImage;
  final Widget function;

  MyHegCard({this.tripName, this.tripImage, this.function});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      child: Card(
        color: Theme.of(context).highlightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 4,
        shadowColor: Theme.of(context).highlightColor,
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50.h,
              child: Center(
                child: Text(
                  tripName,
                  style: TextStyle(
                      color: Colors.orange[700],
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Container(
                width: double.infinity,
                height: 150.h,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: CachedNetworkImage(
                      imageUrl: tripImage,
                      fit: BoxFit.cover,
                    ))),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              height: 40.h,
            )
          ],
        )),
      ),
    );
  }
}

class HegScreenCards extends StatelessWidget {
  final String tripName;
  final String tripImage;

  final String tripDuration;
  HegScreenCards({
    this.tripName,
    this.tripDuration,
    this.tripImage,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Card(
        color: Theme.of(context).highlightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 10,
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50.h,
              child: Center(
                child: Text(
                  "رحلة $tripName",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Container(
                width: double.infinity,
                height: 170.h,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: CachedNetworkImage(
                      imageUrl: tripImage,
                      fit: BoxFit.cover,
                    ))),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              height: 40,
              child: Center(
                child: Text(
                  "رحلة $tripName $tripDuration يوم ",
                  style: TextStyle(
                      color: Colors.orange[700],
                      fontSize: 19,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
