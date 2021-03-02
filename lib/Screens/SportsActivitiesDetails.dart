import 'dart:async';
import 'dart:ui';

import 'package:demo_club/Models/UserModel.dart';
import 'package:demo_club/Widgets/AlertDialog.dart';
import 'package:demo_club/Widgets/NewsTilesList.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'MyHomePage.dart';

class ActivitiesDetails extends StatefulWidget {
  final String image;
  final pageIndex;
  final int index;
  ActivitiesDetails(this.image, this.index, this.pageIndex);
  @override
  _ActivitiesDetailsState createState() => _ActivitiesDetailsState();
}

List<String> dropList = ["مدينة نصر", "التجمع الخامس", "6 اكتوبر"];

List<String> ageRange = ["2000 - 2007", "2001 - 2005", "2003 - 2008"];
List<String> months = ["يناير", "فبراير"];
List<String> catsList = [
  "عن الأكادمية",
  "الفروع",
  "حجز اشتراك",
  "معرض الصور",
];
var selectedDrop = dropList.first;
var selectedMonth = months.first;
var selectedAge = ageRange.first;

class _ActivitiesDetailsState extends State<ActivitiesDetails> {
  var selectedCat = 0;

  toggleCat(int newind) {
    setState(() {
      selectedCat = newind;
    });
    _pageController.animateToPage(newind,
        duration: Duration(milliseconds: 400), curve: Curves.easeInExpo);
  }

  PageController _pageController = PageController();
  @override
  void initState() {
    selectedCat = widget.pageIndex;
    _pageController = PageController(initialPage: widget.pageIndex);
    super.initState();
  }

  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "  أكاديمية النادى الأهلى لكرة القدم هى مدرسة لتعليم اسس كرة القدم وفق الانظمة الحديثة المتبعة فى العالم فى كرة القدم",
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
      ListView(
        children: placeLocation,
      ),
      Container(
        child: Provider.of<UserData>(context, listen: false).loggedIn
            ? Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "اختر الفرع المناسب لك",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButton(
                        style: TextStyle(color: Colors.white),
                        value: selectedDrop,
                        dropdownColor: Colors.grey[900],
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            selectedDrop = value;
                          });
                        },
                        items: dropList.map((String x) {
                          return DropdownMenuItem<String>(
                              value: x,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    x,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ));
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "اختر الشهر الناسب لك",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButton(
                        style: TextStyle(color: Colors.white),
                        value: selectedMonth,
                        dropdownColor: Colors.grey[900],
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            selectedMonth = value;
                          });
                        },
                        items: months.map((String x) {
                          return DropdownMenuItem<String>(
                              value: x,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    x,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ));
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "اختر الفئه العمرية ",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButton(
                        style: TextStyle(color: Colors.white),
                        value: selectedAge,
                        dropdownColor: Colors.grey[900],
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            selectedAge = value;
                          });
                        },
                        items: ageRange.map((String x) {
                          return DropdownMenuItem<String>(
                              value: x,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    x,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ));
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.red,
                        height: 45.h,
                        child: GFButton(
                          onPressed: () {},
                          text: "اتمام الحجز",
                          size: GFSize.LARGE,
                          shape: GFButtonShape.square,
                          blockButton: true,
                          color: Colors.red[800],
                          fullWidthButton: true,
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ))
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
                content: "تحتاج الي تسجيل الدخول  للأشتراك",
              ),
      ),
      Container(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return Image(
            image: NetworkImage(imagesGallery[index]),
          );
        },
        itemCount: imagesGallery.length,
      )),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 8.0,
                          offset: Offset(0.0, 0.15))
                    ],
                  ),
                  child: Hero(
                    tag: widget.index,
                    child: Image(
                      image: NetworkImage(widget.image),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  width: double.infinity,
                  height: 50.h,
                  child: ListView.builder(
                    controller: _controller,
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 30.w),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    toggleCat(index);
                                  },
                                  child: Text(
                                    catsList[index],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  width: 100.w,
                                  color: selectedCat == index
                                      ? Colors.red[700]
                                      : Colors.black,
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: catsList.length,
                  ),
                ),
                Expanded(
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    reverse: true,
                    children: pages,
                    controller: _pageController,
                    onPageChanged: (value) {
                      if (value == 1) {
                        Timer(
                          Duration(milliseconds: 100),
                          () => _controller
                              .jumpTo(_controller.position.minScrollExtent),
                        );
                      } else if (value == 0) {
                        Timer(
                          Duration(milliseconds: 100),
                          () => _controller
                              .jumpTo(_controller.position.minScrollExtent),
                        );
                      } else {
                        Timer(
                          Duration(milliseconds: 100),
                          () => _controller
                              .jumpTo(_controller.position.maxScrollExtent),
                        );
                      }
                      setState(() {
                        selectedCat = value;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          BackkIcon(
            function: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

class PlaceLocation extends StatelessWidget {
  final String title;
  final Function function;
  const PlaceLocation({
    this.function,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Card(
        elevation: 5,
        child: Container(
          height: 50.h,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.red[700],
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ],
              ),
              Text(title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
