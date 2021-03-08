import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class QrAlert extends StatelessWidget {
  final String title;
  final String content;
  final Function onPressed;
  final String buttonName;
  QrAlert(
      {this.title, this.content, @required this.onPressed, this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Theme.of(context).highlightColor,
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
                    children: <Widget>[
                      Center(
                          child: Text(
                        "يجب مسح الكود المفرق علي الطاولة",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.red[700],
                            fontWeight: FontWeight.w900),
                      )),
                      Center(
                        child: Lottie.asset(
                            "android/app/resources/scanner.json",
                            width: 60.w,
                            height: 60.h),
                      ),
                      InkWell(
                        onTap: onPressed,
                        child: Container(
                          width: 150.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red[800],
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "مسح الكود",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
