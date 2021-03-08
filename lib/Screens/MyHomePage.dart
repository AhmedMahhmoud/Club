import 'package:demo_club/Models/UserModel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Home.dart';

class MyHomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController txtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        print(Provider.of<UserData>(context, listen: false).loggedIn);
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                    height: 400.h,
                    child: ClipPath(
                      clipper: ReviewMyClipper(),
                      child: Stack(
                        children: [
                          Container(
                            height: 400.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                              top: 10.h,
                              right: 90.w,
                              child: Column(
                                children: [
                                  Hero(
                                    tag: "ahly",
                                    child: Image(
                                      image: AssetImage(
                                        "android/app/resources/logo.jpg",
                                      ),
                                      width: 200.w,
                                      height: 200.h,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "تسجيل الدخول",
                                    style: TextStyle(
                                        color: Colors.yellow[800],
                                        fontSize: ScreenUtil().setSp(19,
                                            allowFontScalingSelf: true),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "قم بالتسجيل عن طريق رقم العضوية",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(15,
                                            allowFontScalingSelf: true),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "ادخل رقم العضوية",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil()
                                      .setSp(18, allowFontScalingSelf: true),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              width: MediaQuery.of(context).size.width * 0.9,
                              padding: EdgeInsets.all(5),
                              child: TextFormField(
                                style: TextStyle(
                                    color: Theme.of(context).backgroundColor),
                                controller: txtController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "برجاء ادخال رقم العضوية";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 15.w,
                                        bottom: 11.h,
                                        top: 11.h,
                                        right: 15.w),
                                    border: InputBorder.none,
                                    hintText: "رقم العضوية"),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 45.h,
                                child: GFButton(
                                  onPressed: () {
                                    if (!_formKey.currentState.validate()) {
                                      return;
                                    } else {
                                      Provider.of<UserData>(context,
                                              listen: false)
                                          .login(txtController.text, context);
                                    }
                                  },
                                  text: "التسجيل",
                                  size: GFSize.LARGE,
                                  shape: GFButtonShape.square,
                                  blockButton: true,
                                  color: Colors.red[800],
                                  fullWidthButton: true,
                                  textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(18,
                                          allowFontScalingSelf: true)),
                                ),
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Home(),
                                        ));
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "الدخول كضيف و تخطي التسجيل",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenUtil().setSp(18,
                                                allowFontScalingSelf: true)),
                                      ),
                                      Container(
                                        width: 200.w,
                                        height: 1,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      )),
    );
  }
}

class ReviewMyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(1, size.height - 140);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 140);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
