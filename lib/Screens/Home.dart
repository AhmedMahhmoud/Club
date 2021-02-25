import 'package:demo_club/Screens/NewsDetails.dart';
import 'package:flutter/material.dart';

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

class _HomeState extends State<Home> {
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
    return selectedIndex == 1
        ? Scaffold(
            bottomNavigationBar: BottomAppBar(
              shape: const CustomNotchedRectangle(),
              child: Container(
                  padding: EdgeInsets.only(top: 10, left: 10),
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
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: 350.h,
                    child: ClipPath(
                      clipper: ReviewMyClipper(),
                      child: Stack(
                        children: [
                          Container(
                            height: 340.h,
                            color: Colors.white,
                          ),
                          Positioned(
                              top: 10,
                              right: 90.w,
                              child: Column(
                                children: [
                                  Hero(
                                    tag: "ahly",
                                    child: Image(
                                      image: NetworkImage(
                                        "https://seeklogo.com/images/A/Al_Ahly_Club-logo-BA70BE3AE8-seeklogo.com.png",
                                      ),
                                      width: 200.w,
                                      height: 200.h,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    " اخبار النادي",
                                    style: TextStyle(
                                        color: Colors.yellow[800],
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    width: MediaQuery.of(context).size.width,
                    height: 40.h,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          itemBuilder: (context, ind) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              child: InkWell(
                                onTap: () {
                                  toggleSelectedCat(ind);
                                },
                                child: NewsHeaders(
                                  headName: headerList[ind].headName,
                                  colorHead: categoryIndex == ind
                                      ? Colors.orange[700]
                                      : Colors.red[900],
                                  size: categoryIndex == ind ? 24 : 15,
                                ),
                              ),
                            );
                          },
                          itemCount: headerList.length,
                          scrollDirection: Axis.horizontal,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return categoryIndex == 0
                                ? InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NewsScreen(
                                              image: newslist[index].image,
                                              title: newslist[index].newsTitle,
                                            ),
                                          ));
                                    },
                                    child: newslist[index])
                                : InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NewsScreen(
                                              image: sportsNews[index].image,
                                              title:
                                                  sportsNews[index].newsTitle,
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
          )
        : selectedIndex == 2
            ? Scaffold(
                bottomNavigationBar: BottomAppBar(
                  shape: const CustomNotchedRectangle(),
                  child: Container(
                      padding: EdgeInsets.only(top: 10, left: 10),
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
                body: RoundedAlert(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                        (route) => false);
                  },
                  title: "برجاء تسجيل الدخول",
                  content: "تحتاج الي تسجيل الدخول لعرض الميزات المتكاملة",
                ),
              )
            : Scaffold(
                bottomNavigationBar: BottomAppBar(
                  shape: const CustomNotchedRectangle(),
                  child: Container(
                      padding: EdgeInsets.only(top: 10, left: 10),
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
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
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
          size: 25,
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

class NewsCard extends StatelessWidget {
  final String newsTitle;
  final String image;

  NewsCard({
    this.newsTitle,
    this.image,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 5, right: 5, left: 5),
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
              padding:
                  EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      newsTitle,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.yellow[900],
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    "22-2-2021",
                    style: TextStyle(
                        fontSize: 13,
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
