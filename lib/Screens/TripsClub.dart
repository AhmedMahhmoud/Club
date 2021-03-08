import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Screens/TripsHegOmra.dart';
import 'package:demo_club/Widgets/NewsTilesList.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/animation/gf_animation.dart';
import 'package:getwidget/types/gf_animation_type.dart';

import 'TripDetails.dart';

class ClubTrips extends StatefulWidget {
  @override
  _ClubTripsState createState() => _ClubTripsState();
}

AnimationController controller;
Animation<double> animation;

class _ClubTripsState extends State<ClubTrips>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation =
        new CurvedAnimation(parent: controller, curve: Curves.elasticOut);
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                UserHeader2(),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: GFAnimation(
                        scaleAnimation: animation,
                        controller: controller,
                        type: GFAnimationType.scaleTransition,
                        child: ListView.builder(
                          itemCount: tripsList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 5.h,
                              ),
                              child: TripsCard(
                                title: tripsList[index].title,
                                image: tripsList[index].image,
                                duration: tripsList[index].duration,
                              ),
                            );
                          },
                        ),
                      )),
                )
              ],
            ),
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
    );
  }
}

class TripsCard extends StatelessWidget {
  final String title;
  final String image;
  final String duration;
  const TripsCard({
    this.duration,
    this.image,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HegAndOmraInformationScreen(
                title: title,
                image1: image,
              ),
            ),
          ),
          child: Container(
            height: 240.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(15)),
                color: Colors.transparent,
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.9), BlendMode.dstATop),
                )),
          ),
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(15))),
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).backgroundColor),
                  ),
                  Text(duration,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).backgroundColor)),
                ],
              ),
            ),
          ),
          bottom: 0,
        )
      ],
    );
  }
}
