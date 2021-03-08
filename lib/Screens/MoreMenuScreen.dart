import 'package:demo_club/Models/UserModel.dart';
import 'package:demo_club/Screens/AboutClub.dart';
import 'package:demo_club/Screens/MyHomePage.dart';
import 'package:demo_club/Screens/Proposals.dart';

import 'package:demo_club/Screens/UserProfile.dart';
import 'package:demo_club/Screens/contact_us.dart';
import 'package:demo_club/Widgets/AlertDialog.dart';
import 'package:demo_club/Widgets/ThemeAlert.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'AboutApp.dart';
import 'Home.dart';

class MoreMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loggedUser = Provider.of<UserData>(context, listen: false).loggedIn;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  loggedUser ? UserHeader2() : Container(),
                  Divider(
                    color: Colors.white,
                  ),
                  GestureDetector(
                    onTap: () {
                      loggedUser
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ))
                          : showDialog(
                              context: context,
                              builder: (context) {
                                return LogginAlert();
                              },
                            );
                    },
                    child: MoreRowItem(
                      title: "الحساب الشخصي",
                      iconData: FontAwesomeIcons.user,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactUsSc(),
                        )),
                    child: MoreRowItem(
                      title: "اتصل بنا",
                      iconData: FontAwesomeIcons.phone,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactUsScreen(),
                        )),
                    child: MoreRowItem(
                      title: "عن التطبيق",
                      iconData: FontAwesomeIcons.info,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutUsScreen(),
                        )),
                    child: MoreRowItem(
                      title: "عن النادى",
                      iconData: FontAwesomeIcons.peopleArrows,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () => loggedUser
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProposalsScreen(),
                            ))
                        : showDialog(
                            context: context,
                            builder: (context) {
                              return LogginAlert();
                            },
                          ),
                    child: MoreRowItem(
                      title: "الشكاوى و المقترحات",
                      iconData: FontAwesomeIcons.envelope,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return ThemeAlert();
                      },
                    ),
                    child: MoreRowItem(
                      title: "تغير الخلفية",
                      iconData: FontAwesomeIcons.moon,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  MoreRowItem(
                    function: () {
                      loggedUser
                          ? Provider.of<UserData>(context, listen: false)
                              .logout(context)
                          : Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                    },
                    title: loggedUser ? "تسجيل الخروج" : "تسجيل الدخول",
                    iconData: loggedUser
                        ? FontAwesomeIcons.doorOpen
                        : FontAwesomeIcons.doorClosed,
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      "نسخة التطبيق 1.0.0",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      width: 150.w,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Powered By",
                                style: TextStyle(color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () => launch("http://amh-egypt.com/"),
                                child: Container(
                                    height: 60.h,
                                    child: Image.asset(
                                      'android/app/resources/tec-white.png',
                                      fit: BoxFit.fitHeight,
                                    )),
                              ),
                            ],
                          ),
                          // Text(
                          //   "AMH Group احدى شركات ",
                          //   style: TextStyle(color: Colors.orange),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          loggedUser
              ? Positioned(
                  top: 40.h,
                  left: 10.w,
                  child: Notofications(),
                )
              : Container()
        ],
      ),
    );
  }
}

class LogginAlert extends StatelessWidget {
  const LogginAlert({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedAlert(
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
            (route) => false);
      },
      buttonName: "تسجيل الدخول",
      title: "برجاء تسجيل الدخول",
      content: "تحتاج الي تسجيل الدخول لعرض الحساب الشخصي",
    );
  }
}

class CategoryNameRow extends StatelessWidget {
  final String catTitle;
  CategoryNameRow({
    this.catTitle,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Theme.of(context).hintColor.withOpacity(0.9),
      alignment: Alignment.topRight,
      width: double.infinity,
      height: 40.h,
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Text(
          catTitle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil().setSp(17, allowFontScalingSelf: true),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class MoreRowItem extends StatelessWidget {
  final String title;
  final Function function;
  final IconData iconData;
  MoreRowItem({
    this.iconData,
    this.title,
    this.function,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FaIcon(
              iconData,
              color: Colors.white,
              size: 20,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(17, allowFontScalingSelf: true),
              ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
