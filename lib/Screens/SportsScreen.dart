import 'package:demo_club/Screens/SportsActivitiesDetails.dart';
import 'package:demo_club/Widgets/NewsTilesList.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Screens/Home.dart';
import '../Widgets/globalFile.dart';

class SportsScreen extends StatefulWidget {
  @override
  _SportsScreenState createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).backgroundColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                UserHeader2(),
                Expanded(
                  child: ListView.builder(
                    itemCount: sportsList.length,
                    itemBuilder: (context, index) {
                      return SportsActivitiesCard(
                        index: index,
                        image: sportsList[index].image,
                        title: sportsList[index].title,
                      );
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
          ),
          Positioned(
            top: 40.h,
            left: 10.w,
            child: Notofications(),
          ),
        ],
      ),
    );
  }
}

class SportsActivitiesCard extends StatelessWidget {
  final String image, title;
  final int index;
  SportsActivitiesCard({
    this.index,
    this.image,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ActivitiesDetails(sportsList[index].image, index, 0),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Hero(
                  tag: index,
                  child: Container(
                    child: Image(
                      width: double.infinity,
                      height: 160.h,
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(15)),
                  color: Colors.white,
                  border: Border.all(
                      width: 1,
                      color: currentTheme.isDark
                          ? Colors.red[700]
                          : Colors.black)),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActivitiesDetails(
                              sportsList[index].image, index, 2),
                        )),
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.calendarAlt,
                          color: Colors.black,
                        ),
                        Text(
                          "الحجز",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 3,
                    height: 40,
                    color: Colors.grey,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActivitiesDetails(
                              sportsList[index].image, index, 0),
                        )),
                    child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.info,
                          color: Colors.black,
                        ),
                        Text(
                          "الأكاديمية",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
