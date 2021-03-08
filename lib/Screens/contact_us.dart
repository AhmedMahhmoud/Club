import 'package:demo_club/Models/ContactUsModel.dart';
import 'package:demo_club/Models/UserModel.dart';
import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import "dart:ui" as ui;
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsSc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactUs contactUsData = Provider.of<ContactUsData>(context).contactUs;
    var _socialMediaURLs = contactUsData.socialMediaURLS.values.toList();
    var _socialMediaIcons = contactUsData.socialMediaURLS.keys.toList();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Provider.of<UserData>(context, listen: false).loggedIn
                    ? UserHeader2()
                    : Container(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        //        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      child: Container(
                                    width: 90.w,
                                    height: 90.h,
                                    decoration: const ShapeDecoration(
                                      shape: CircleBorder(),
                                    ),
                                    child: Center(
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 50,
                                          child: Container(
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 2,
                                                      color: Colors.red[800]),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "android/app/resources/logo.jpg"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  shape: BoxShape.circle))),
                                    ),
                                  )),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  MyListTile(
                                      title: "الفروع",
                                      icon: Icons.location_on,
                                      onTap: () {
                                        showModalBottomSheet<dynamic>(
                                            backgroundColor: Colors.white,
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) =>
                                                ModelSheetContent(
                                                  content: Container(
                                                    color: Colors.white,
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: 1,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return DetailsRow(
                                                            url:
                                                                "https://www.google.com/search?tbs=lf:1,lf_ui:1&tbm=lcl&sxsrf=ALeKk01S0Ste7z39N7lepBJbk_slEKLqbw:1614792441093&q=%D8%B4%D8%A7%D8%B1%D8%B9+%D8%A7%D9%84%D8%AA%D8%AC%D9%85%D8%B9+%D8%A7%D9%84%D8%AE%D8%A7%D9%85%D8%B3&rflfq=1&num=10&ved=2ahUKEwj499jO0pTvAhXE2qQKHYyvCeQQtgN6BAgHEAc#rlfi=hd:;si:;mv:[[30.021401599999994,31.4511225],[29.996041100000003,31.4132729]];tbs:lrf:!1m4!1u3!2m2!3m1!1e1!1m4!1u2!2m2!2m1!1e1!2m1!1e2!2m1!1e3,lf:1,lf_ui:1",
                                                            title:
                                                                "التجمع الخامس امام مسجد المشير طنطاوى",
                                                            icon: Icon(
                                                              Icons.location_on,
                                                              size: 28,
                                                              color: Colors.red,
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                ));
                                      }),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  MyListTile(
                                      title: 'تليفون',
                                      icon: Icons.phone,
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) =>
                                                ModelSheetContent(
                                                  content: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: 2,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return DetailsRow(
                                                          url:
                                                              "tel:${01112601115}",
                                                          title: "01112601115",
                                                          icon: Icon(
                                                            Icons.phone,
                                                            size: 28,
                                                            color: Colors.green,
                                                          ),
                                                        );
                                                      }),
                                                ));
                                      }
                                      //        link: 'tel:+0225747479',
                                      ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  MyListTile(
                                      title: 'البريد الإلكترونى',
                                      icon: Icons.email,
                                      onTap: () {
                                        launch("mailto:${""}");
                                      }),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  MyListTile(
                                      title: "الموقع الإلكترونى",
                                      icon: FontAwesomeIcons.globe,
                                      onTap: () {
                                        launch("");
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Container(
                                      height: 60,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: _socialMediaURLs.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return CircletTile(
                                              link: _socialMediaURLs[index],
                                              icon: _socialMediaIcons[index],
                                            );
                                          }),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BackkIcon(function: () {
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final onTap;
  MyListTile({this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.red[700],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      color: Colors.white,
      child: ListTile(
        onTap: onTap,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Directionality(
                  textDirection: ui.TextDirection.rtl,
                  child: Text(title,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Color(0xFF3b3c40),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                )),
            SizedBox(
              width: 5,
            ),
            Transform(
              transform: Matrix4.rotationY(math.pi),
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  color: Color(0xFF3b3c40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModelSheetContent extends StatelessWidget {
  final Widget content;

  ModelSheetContent({this.content});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: content,
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsRow extends StatelessWidget {
  final String title;
  final String url;
  final Widget icon;

  DetailsRow({
    this.title,
    this.url,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launch(url);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon,
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  child: Directionality(
                    textDirection: ui.TextDirection.rtl,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class CircletTile extends StatelessWidget {
  final IconData icon;
  final String link;
  final iconColor;
  CircletTile({this.icon, this.link, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Container(
          child: IconButton(
            onPressed: () {
              launch(link);
            },
            icon: Icon(
              icon,
              color: Color(0xFF3b3c40),
            ),
          ),
        ),
      ),
    );
  }
}
