import 'dart:ui';

import 'package:demo_club/Models/UserModel.dart';
import 'package:demo_club/Screens/NewsDetails.dart';
import 'package:demo_club/Screens/Notifications.dart';
import 'package:demo_club/Screens/ServicesScreen.dart';
import 'package:demo_club/Widgets/HomeAfterLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/badge/gf_badge.dart';

import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart';
import 'dart:math' as math;
import 'MoreMenuScreen.dart';
import 'MyHomePage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widgets/AlertDialog.dart';
import '../Widgets/NewsTilesList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  List<BottomnavBar> mylist = [
    BottomnavBar(
      text: "المزيد",
      iconData: Icons.more_vert,
    ),
    BottomnavBar(
      text: "الرئيسية",
    ),
    BottomnavBar(
      text: "الخدمات",
      iconData: Icons.star,
    ),
  ];
  var selectedIndex = 1;
  var categoryIndex = 0;
  toggleSelectedCat(int newInd) {
    setState(() {
      categoryIndex = newInd;
    });
  }

  toggleSelectedIndex(int newIndx) {
    setState(() {
      selectedIndex = newIndx;
    });
  }

  @override
  Widget build(BuildContext context) {
    var loggedUser = Provider.of<UserData>(context, listen: false).loggedIn;

    return selectedIndex == 1
        ? Scaffold(
            bottomNavigationBar: BottomAppBar(
              shape: const CustomNotchedRectangle(),
              child: Container(
                  padding: EdgeInsets.only(top: 10.h, left: 10.w),
                  height: 70.0.h,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            child: InkWell(
                                onTap: () {
                                  toggleSelectedIndex(index);
                                },
                                child: BottomnavBar(
                                  iconData: mylist[index].iconData,
                                  text: mylist[index].text,
                                  colorTex: selectedIndex == index
                                      ? Colors.orange[700]
                                      : Colors.red[700],
                                  fontSize: selectedIndex == index
                                      ? ScreenUtil()
                                          .setSp(18, allowFontScalingSelf: true)
                                      : ScreenUtil().setSp(15,
                                          allowFontScalingSelf: true),
                                )),
                            margin: EdgeInsets.symmetric(horizontal: 40.w),
                          );
                        },
                        itemCount: mylist.length,
                      ),
                    ],
                  )),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              backgroundColor:
                  selectedIndex == 1 ? Colors.orange[700] : Colors.red[800],
              tooltip: 'Home',
              child: Icon(Icons.home),
            ),
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      loggedUser
                          ? HomeAfterLogin()
                          : Container(
                              height: 350.h,
                              child: ClipperWidget(
                                title: " اخبار النادي",
                              ),
                            ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.topRight,
                        width: MediaQuery.of(context).size.width - 10.w,
                        height: 40.h,
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: ListView.builder(
                              reverse: true,
                              shrinkWrap: true,
                              itemBuilder: (context, ind) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3),
                                  child: GestureDetector(
                                    onTap: () {
                                      toggleSelectedCat(ind);
                                    },
                                    child: NewsHeaders(
                                      headName: headerList[ind].headName,
                                      colorHead: categoryIndex == ind
                                          ? Colors.orange[700]
                                          : Colors.red[900],
                                      size: categoryIndex == ind
                                          ? ScreenUtil().setSp(24,
                                              allowFontScalingSelf: true)
                                          : ScreenUtil().setSp(15,
                                              allowFontScalingSelf: true),
                                    ),
                                  ),
                                );
                              },
                              itemCount: headerList.length,
                              scrollDirection: Axis.horizontal,
                            )),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return categoryIndex == 0
                                    ? AnimatedPage(
                                        card: newslist[index],
                                        secondScreen: NewsScreen(
                                          index: index,
                                          description:
                                              newslist[index].description,
                                          image: newslist[index].image,
                                          title: newslist[index].newsTitle,
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    NewsScreen(
                                                  index: index,
                                                  image:
                                                      sportsNews[index].image,
                                                  title: sportsNews[index]
                                                      .newsTitle,
                                                ),
                                              ));
                                        },
                                        child: sportsNews[index]);
                              },
                              itemCount: categoryIndex == 0
                                  ? newslist.length
                                  : sportsNews.length,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                loggedUser
                    ? Positioned(
                        top: 40.h,
                        left: 10.w,
                        child: Notofications(),
                      )
                    : Container(),
              ],
            ),
          )
        : selectedIndex == 2
            ? Scaffold(
                bottomNavigationBar: BottomAppBar(
                  shape: const CustomNotchedRectangle(),
                  child: Container(
                      padding: EdgeInsets.only(top: 10.h, left: 10.w),
                      height: 70.0.h,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                child: InkWell(
                                    onTap: () {
                                      toggleSelectedIndex(index);
                                    },
                                    child: BottomnavBar(
                                      iconData: mylist[index].iconData,
                                      text: mylist[index].text,
                                      colorTex: selectedIndex == index
                                          ? Colors.orange[700]
                                          : Colors.red[700],
                                      fontSize: selectedIndex == index
                                          ? ScreenUtil().setSp(18,
                                              allowFontScalingSelf: true)
                                          : ScreenUtil().setSp(15,
                                              allowFontScalingSelf: true),
                                    )),
                                margin: EdgeInsets.symmetric(horizontal: 40.w),
                              );
                            },
                            itemCount: mylist.length,
                          ),
                        ],
                      )),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  backgroundColor:
                      selectedIndex == 1 ? Colors.orange[700] : Colors.red[800],
                  tooltip: 'Home',
                  child: Icon(Icons.home),
                ),
                backgroundColor: Colors.black,
                body: loggedUser
                    ? ServicesScreen()
                    : RoundedAlert(
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
                            "تحتاج الي تسجيل الدخول لعرض الميزات المتكاملة",
                      ),
              )
            : Scaffold(
                bottomNavigationBar: BottomAppBar(
                  shape: const CustomNotchedRectangle(),
                  child: Container(
                      padding: EdgeInsets.only(top: 10.h, left: 10.w),
                      height: 70.0.h,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                child: InkWell(
                                    onTap: () {
                                      toggleSelectedIndex(index);
                                    },
                                    child: BottomnavBar(
                                      iconData: mylist[index].iconData,
                                      text: mylist[index].text,
                                      colorTex: selectedIndex == index
                                          ? Colors.orange[700]
                                          : Colors.red[700],
                                      fontSize: selectedIndex == index
                                          ? ScreenUtil().setSp(18,
                                              allowFontScalingSelf: true)
                                          : ScreenUtil().setSp(15,
                                              allowFontScalingSelf: true),
                                    )),
                                margin: EdgeInsets.symmetric(horizontal: 40.w),
                              );
                            },
                            itemCount: mylist.length,
                          ),
                        ],
                      )),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  backgroundColor:
                      selectedIndex == 1 ? Colors.orange[700] : Colors.red[800],
                  tooltip: 'Home',
                  child: Icon(Icons.home),
                ),
                backgroundColor: Colors.black,
                body: MoreMenuScreen());
  }
}

class UserHeader2 extends StatelessWidget {
  const UserHeader2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperOne(
        flip: true,
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        color: Colors.red[900],
        height: 110.h,
        child: UserHeader(),
      ),
    );
  }
}

class GridViewItemsWidg extends StatelessWidget {
  final String iconData;
  final String title;
  final Widget function;

  GridViewItemsWidg({
    this.iconData,
    this.function,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Center(
                      child: Lottie.asset(
                    iconData,
                    repeat: true,
                  )),
                  height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize:
                          ScreenUtil().setSp(17, allowFontScalingSelf: true)),
                ),
              ],
            ),
          ),
        ));
  }
}

class Notofications extends StatelessWidget {
  const Notofications({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "ahly",
      child: Container(
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 4, color: Colors.red[900])),
        child: GFAvatar(
          backgroundColor: Colors.white,
          radius: 20.w,
          backgroundImage: AssetImage("android/app/resources/logo.jpg"),
        ),
      ),
    );
  }
}

class UserHeader extends StatelessWidget {
  const UserHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          Provider.of<UserData>(context, listen: false).user.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        SizedBox(
          width: 5.w,
        ),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.white,
              )),
          child: Stack(
            children: [
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsScreen(),
                    )),
                child: GFAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.w,
                  backgroundImage: NetworkImage(
                      "https://scontent.fcai21-2.fna.fbcdn.net/v/t1.0-9/79803978_2206482966119329_7485546926507556864_n.jpg?_nc_cat=108&ccb=3&_nc_sid=174925&_nc_eui2=AeHHQqdJBe1wPzn5bN-SOqIRtDQyKomkcn20NDIqiaRyfe1QwPHwKm5pkbWX0A0KvHxDNuCahayPeOmbX7gWDbNG&_nc_ohc=-7xnIwcJ6JcAX8sKi4C&_nc_ht=scontent.fcai21-2.fna&oh=05115c7a72aa71660088d476e3121e95&oe=605DC125"),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationsScreen(),
                      )),
                  child: GFBadge(
                    color: Colors.red[700],
                    child: Text(notificationList.length.toString()),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}

class ClipperWidget extends StatelessWidget {
  final String title;
  const ClipperWidget({
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ReviewMyClipper(),
      child: Stack(
        children: [
          Container(
            height: 340.h,
            color: Colors.white,
          ),
          Positioned(
              top: 10.h,
              right: 90.w,
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(
                      "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515361_10542.jpg",
                    ),
                    width: 200.w,
                    height: 200.h,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.yellow[800],
                        fontSize:
                            ScreenUtil().setSp(24, allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class NewsHeaders extends StatelessWidget {
  final String headName;
  final Color colorHead;
  final double size;
  NewsHeaders({this.headName, this.colorHead, this.size});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1,
      duration: Duration(microseconds: 100),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        child: Text(headName,
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(15, allowFontScalingSelf: true),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: size.w),
        decoration: BoxDecoration(
            color: colorHead, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

class BottomnavBar extends StatefulWidget {
  final String text;
  final IconData iconData;
  final Color colorTex;
  final double fontSize;
  BottomnavBar({
    this.iconData,
    this.text,
    this.colorTex,
    this.fontSize,
    Key key,
  }) : super(key: key);

  @override
  _BottomnavBarState createState() => _BottomnavBarState();
}

class _BottomnavBarState extends State<BottomnavBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          widget.iconData,
          size: 25.w,
          color: widget.colorTex,
        ),
        Text(
          widget.text,
          style: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: FontWeight.bold,
              color: widget.colorTex),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class OffersCard extends StatelessWidget {
  final String newsTitle;
  final String image;
  final String description;
  final List<String> phone;
  final List<String> address;
  OffersCard({
    this.phone,
    this.address,
    this.newsTitle,
    this.image,
    this.description,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h, top: 5.h, right: 5.w, left: 5.w),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.red[700],
        ),
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
      ),
      height: 100.h,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  right: 10.w, left: 10.w, bottom: 10.h, top: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      newsTitle,
                      style: TextStyle(
                          fontSize: ScreenUtil()
                              .setSp(16, allowFontScalingSelf: true),
                          color: Colors.yellow[900],
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    "22-3-2021",
                    style: TextStyle(
                        fontSize:
                            ScreenUtil().setSp(13, allowFontScalingSelf: true),
                        color: Colors.grey,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(9), bottomRight: Radius.circular(9)),
            child: Image(
              image: NetworkImage(
                image,
              ),
              width: 120.w,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String newsTitle;
  final String image;
  final String description;
  NewsCard({
    this.newsTitle,
    this.image,
    this.description,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h, top: 5.h, right: 5.w, left: 5.w),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.red[700],
        ),
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
      ),
      height: 100.h,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  right: 10.w, left: 10.w, bottom: 10.h, top: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      newsTitle,
                      style: TextStyle(
                          fontSize: ScreenUtil()
                              .setSp(15, allowFontScalingSelf: true),
                          color: Colors.yellow[900],
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    "22-3-2021",
                    style: TextStyle(
                        fontSize:
                            ScreenUtil().setSp(13, allowFontScalingSelf: true),
                        color: Colors.grey,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(9), bottomRight: Radius.circular(9)),
            child: Image(
              image: NetworkImage(
                image,
              ),
              width: 120.w,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNotchedRectangle extends NotchedShape {
  const CustomNotchedRectangle();

  @override
  Path getOuterPath(Rect host, Rect guest) {
    if (guest == null || !host.overlaps(guest)) return Path()..addRect(host);

    const double s1 = 10.0;
    const double s2 = 8.0;
    const double addedRadius = 3;

    final double notchRadius = guest.width / 2.0 + addedRadius;
    final double r = notchRadius;
    final double a = -1.0 * r - s2;
    final double b = host.top - guest.center.dy;

    final double n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));
    final double p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final double p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yA = math.sqrt(r * r - p2xA * p2xA);
    final double p2yB = math.sqrt(r * r - p2xB * p2xB);

    final List<Offset> p = List<Offset>(6);

    p[0] = Offset(a - s1, b);
    p[1] = Offset(a, b);
    final double cmp = b < 0 ? -1.0 : 1.0;
    p[2] = cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB);

    p[3] = Offset(-1.0 * p[2].dx, p[2].dy);
    p[4] = Offset(-1.0 * p[1].dx, p[1].dy);
    p[5] = Offset(-1.0 * p[0].dx, p[0].dy);

    for (int i = 0; i < p.length; i += 1) p[i] += guest.center;

    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(p[0].dx, p[0].dy)
      ..quadraticBezierTo(p[1].dx, p[1].dy, p[2].dx, p[2].dy)
      ..arcToPoint(
        p[3],
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..quadraticBezierTo(p[4].dx, p[4].dy, p[5].dx, p[5].dy)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}

class AnimatedPage extends StatelessWidget {
  final Widget card;
  final Widget secondScreen;
  AnimatedPage({
    this.secondScreen,
    this.card,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: Duration(milliseconds: 300),
      closedBuilder: (context, action) {
        return card;
      },
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      openBuilder: (context, action) {
        return secondScreen;
      },
    );
  }
}
