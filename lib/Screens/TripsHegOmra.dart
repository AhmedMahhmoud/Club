import 'package:demo_club/Widgets/NewsTilesList.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/animation/gf_animation.dart';
import 'package:getwidget/types/gf_animation_type.dart';
import 'package:provider/single_child_widget.dart';
import 'Home.dart';
import 'TripDetails.dart';
import 'TripHegOmraDetails.dart';

class HegOmraScreen extends StatefulWidget {
  @override
  _HegOmraScreenState createState() => _HegOmraScreenState();
}

AnimationController controller;
Animation<double> animation;

class _HegOmraScreenState extends State<HegOmraScreen>
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
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              UserHeader2(),
              Expanded(
                  child: GFAnimation(
                scaleAnimation: animation,
                controller: controller,
                type: GFAnimationType.scaleTransition,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HegInformationScreen(
                                image1: hegScreenList[index].tripImage,
                                title: hegScreenList[index].tripName,
                              ),
                            )),
                        child: hegScreenList[index]);
                  },
                  itemCount: hegScreenList.length,
                ),
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
