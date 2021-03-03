import 'package:demo_club/Screens/SportsScreen.dart';
import 'package:demo_club/Widgets/NewsTilesList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:getwidget/components/animation/gf_animation.dart';
import 'package:getwidget/types/gf_animation_type.dart';
import '../Screens/Home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    animation =
        new CurvedAnimation(parent: controller, curve: Curves.easeOutBack);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              UserHeader2(),
              SizedBox(height: 10),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GFAnimation(
                  scaleAnimation: animation,
                  controller: controller,
                  type: GFAnimationType.scaleTransition,
                  child: Container(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.95,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return AnimatedPage(
                            card: Card(
                                shadowColor: Colors.orange,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: GridViewItemsWidg(
                                  title: gridList[index].title,
                                  iconData: gridList[index].iconData,
                                )),
                            secondScreen: gridList[index].function,
                          );
                        },
                        itemCount: gridList.length,
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
        Positioned(
          top: 40.h,
          left: 10.w,
          child: Notofications(),
        )
      ],
    );
  }
}
