import 'package:demo_club/Screens/SportsScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  catTitle: "الأقسام",
                ),
                SizedBox(
                  height: 5,
                ),
                MoreRowItem(
                  title: "الألعاب الرياضية",
                  iconData: FontAwesomeIcons.running,
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SportsScreen(),
                        ));
                  },
                ),
                Divider(
                  color: Colors.white,
                ),
                MoreRowItem(
                  title: "الرحلات",
                  iconData: FontAwesomeIcons.plane,
                ),
                Divider(
                  color: Colors.white,
                ),
                MoreRowItem(
                  title: "المطاعم",
                  iconData: FontAwesomeIcons.store,
                ),
                Divider(
                  color: Colors.white,
                ),
                MoreRowItem(
                  title: "تصريح دخول البوابة",
                  iconData: FontAwesomeIcons.idCard,
                ),
                Divider(
                  color: Colors.white,
                ),
                CategoryNameRow(
                  catTitle: "الأعدادات",
                ),
                Divider(
                  color: Colors.white,
                ),
                MoreRowItem(
                  title: "الحساب الشخصي",
                  iconData: FontAwesomeIcons.user,
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
                  title: "تسجيل الدخول",
                  iconData: FontAwesomeIcons.doorOpen,
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
