import 'package:demo_club/Models/UserModel.dart';
import 'package:demo_club/Screens/MyHomePage.dart';
import 'package:demo_club/Screens/SportsScreen.dart';
import 'package:demo_club/Screens/UserProfile.dart';
import 'package:demo_club/Widgets/AlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MoreMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loggedUser = Provider.of<UserData>(context, listen: false).loggedIn;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CategoryNameRow(
                  catTitle: "الأعدادات",
                ),
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
                                content:
                                    "تحتاج الي تسجيل الدخول لعرض الحساب الشخصي",
                              );
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
                MoreRowItem(
                  title: "اتصل بنا",
                  iconData: FontAwesomeIcons.phone,
                ),
                Divider(
                  color: Colors.white,
                ),
                MoreRowItem(
                  title: "وسائل التواصل",
                  iconData: FontAwesomeIcons.facebook,
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
                )
              ],
            ),
          ),
        ),
      ),
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
      color: Colors.white.withOpacity(0.3),
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
