import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import 'globalFile.dart';

class ThemeAlert extends StatefulWidget {
  @override
  _ThemeAlertState createState() => _ThemeAlertState();
}

class _ThemeAlertState extends State<ThemeAlert> {
  toggleButton() {
    setState(() {
      currentTheme.switchTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)), //this right here
        child: Stack(
          children: [
            Container(
              height: 220.h,
              width: 300.w,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedContainer(
                          duration: Duration(
                            milliseconds: 800,
                          ),
                          height: 40.0.h,
                          width: 100.0.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20.0),
                              color: currentTheme.isDark
                                  ? Colors.black
                                  : Color(0xff000D2A)),
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                child: GestureDetector(
                                  onTap: toggleButton,
                                  child: AnimatedSwitcher(
                                    duration: Duration(milliseconds: 800),
                                    transitionBuilder: (Widget child,
                                        Animation<double> animation) {
                                      return ScaleTransition(
                                        scale: animation,
                                        child: child,
                                      );
                                    },
                                    child: currentTheme.isDark
                                        ? FaIcon(
                                            FontAwesomeIcons.solidSun,
                                            color: Colors.orange[600],
                                            size: 30.w,
                                          )
                                        : FaIcon(
                                            FontAwesomeIcons.moon,
                                            color: Colors.white,
                                            size: 30.w,
                                          ),
                                  ),
                                ),
                                duration: Duration(milliseconds: 800),
                                curve: Curves.easeIn,
                                top: 3.0,
                                left: currentTheme.isDark ? 60.0.w : 0.0,
                                right: currentTheme.isDark ? 0.0 : 60.0.w,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "اضغط على الأيكون لتغير خلفية التطبيق",
                          style: TextStyle(
                              color: Theme.of(context).focusColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ],
                    )),
              ),
            ),
            Positioned(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
                onTap: () => Navigator.pop(context),
              ),
            ))
          ],
        ));
  }
}
