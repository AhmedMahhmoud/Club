import 'dart:io';

import 'package:demo_club/Models/UserModel.dart';
import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:animated_icon_button/animated_icon_button.dart';

/// #About US Screen

import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///animated controller index -- if -1 no one is opened
int currentIndex = -1;

///animation controllers
AnimationController _controller1;
AnimationController _controller2;
AnimationController _controller3;
AnimationController _controller4;
AnimationController _controller5;

///list of 2 controllers controller for word and the opening container
List<UnitAnimationController> controllers = [
  UnitAnimationController(
      animationController: _controller1, animationHeight: 0),
  UnitAnimationController(
      animationController: _controller2, animationHeight: 0),
  UnitAnimationController(
      animationController: _controller3, animationHeight: 0),
  UnitAnimationController(
      animationController: _controller4, animationHeight: 0),
  UnitAnimationController(animationController: _controller5, animationHeight: 0)
];

class UnitAnimationController {
  AnimationController animationController;
  double animationHeight;
  UnitAnimationController({this.animationController, this.animationHeight});
}

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  var aboutIndicator = false;

  void dispose() {
    controllers[currentIndex].animationController.reverse();
    controllers[currentIndex].animationHeight = 0;

    print("disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loggedUser = Provider.of<UserData>(context, listen: false).loggedIn;
    return GestureDetector(
        child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Stack(
              children: [
                Container(
                    height: (MediaQuery.of(context).size.height),
                    child: Column(children: [
                      loggedUser ? UserHeader2() : Container(),
                      CacheSyndicateListView()
                    ])),
                BackkIcon(
                  function: () => Navigator.pop(context),
                ),
                loggedUser
                    ? Positioned(
                        top: 40.h,
                        left: 10.w,
                        child: Notofications(),
                      )
                    : Container()
              ],
            )));
  }
}

class CacheSyndicateListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(children: [
      AnimatedDropDown(
        isConnected: false,
        name: "نبذة عن النادى",
        imgPath:
            "https://upload.wikimedia.org/wikipedia/en/thumb/0/0c/Liverpool_FC.svg/1200px-Liverpool_FC.svg.png",
        word:
            "نادي ليفربول لكرة القدم (بالإنجليزية: Liverpool Football Club)‏ وغالباً ما يعرف اختصاراً باسم ليفربول (بالإنجليزية: Liverpool)‏ هو نادي كرة قدم إنجليزي محترف، تأسس بتاريخ 15 مارس 1892، بمدينة ليفربول، في إقليم الميرسيسايد بإنجلترا، على يد رجل الأعمال الإنجليزي جون هولدينغ",
        index: 0,
        title: "",
      ),
      AnimatedDropDown(
          isConnected: false,
          name: "محمود الخطيب",
          imgPath:
              'http://www.masralhadetha.com/UserFiles/News/2020/04/25/37953.jpg',
          word:
              "محمود الخطيب (مواليد 30 أكتوبر 1954) هو لاعب كرة قدم مصري سابق، لعب للنادي الأهلي ومنتخب مصر لكرة القدم وهو الرئيس الحالي للنادي الأهلي المصري.",
          index: 1,
          title: "رئيس مجلس إدارة النادي"),
      AnimatedDropDown(
        isConnected: false,
        name: "Pitso Mosimane",
        imgPath:
            "http://t0.gstatic.com/images?q=tbn:ANd9GcTvbur-u5HzOiGC1ORc_KmawbyHXA88FX9vBWKmtM8uTSqfvbArajKL9MkD9SVe",
        word:
            "بيتسو موسيماني (بالإنجليزية: Pitso Mosimane)‏ (ولد في 26 يوليو 1964) هو لاعب كرة قدم جنوب أفريقي سابق ومدرِّب حالي للنادي الأهلي المصري. ... توج بلقب دوري أبطال أفريقيا 2019–20 مع النادي الأهلي المصرى بعد الفوز على غريمه المحلي الزمالك بنتيجة 2-1 في النهائي. وتوج معه بالميدالية البرونزية في كأس العالم للأندية ",
        index: 2,
        title: "مدرب النادي",
      ),
    ]));
  }
}

///animated widget
class AnimatedDropDown extends StatefulWidget {
  final name;
  final title;
  final imgPath;
  final word;
  final index;
  bool isConnected = true;
  AnimatedDropDown(
      {this.name,
      this.imgPath,
      this.word,
      this.index,
      this.title,
      this.isConnected});

  @override
  _AnimatedDropDownState createState() => _AnimatedDropDownState();
}

class _AnimatedDropDownState extends State<AnimatedDropDown>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    controllers[widget.index].animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), lowerBound: 0);
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onChange() {
      setState(() {
        if (currentIndex == -1) {
          //start animation for the first time
          setState(() {
            controllers[widget.index].animationController.forward(from: 0);
            controllers[widget.index].animationHeight = 300;
            currentIndex = widget.index;
          });
        } else {
          //if opened check if pressed on the same container
          if (currentIndex == widget.index) {
            controllers[currentIndex].animationController.reverse(from: 1);
            controllers[currentIndex].animationHeight = 0;
            currentIndex = -1;
          } else {
            //Closing the opened one and forward the another one
            controllers[currentIndex].animationController.reverse(from: 1);
            controllers[currentIndex].animationHeight = 0;
            controllers[widget.index].animationController.forward(from: 0);
            controllers[widget.index].animationHeight = 300;
            currentIndex = widget.index;
          }
        }
      });
    }

    return AnimatedBuilder(
      animation: controllers[widget.index].animationController,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () {
              onChange();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: <Widget>[
                      widget.imgPath != ""
                          ? Container(
                              width: 100,
                              height: 100,
                              decoration:
                                  const ShapeDecoration(shape: CircleBorder()),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xff4a4a4a),
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 1, color: Colors.red),
                                ),
                                child: Center(
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 50,
                                      child: widget.isConnected
                                          ? Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        widget.imgPath),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  shape: BoxShape.circle))
                                          : Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                        widget.imgPath)),
                                                shape: BoxShape.circle,
                                              ))),
                                ),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, top: 5, left: 20.0, right: 20.0),
                        child: Container(
                          width: double.infinity,
                          height: widget.title != ""
                              ? 100 +
                                  (controllers[widget.index]
                                          .animationController
                                          .value *
                                      300)
                              : 50 +
                                  (controllers[widget.index]
                                          .animationController
                                          .value *
                                      300),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 1,
                                  offset: Offset(0, 0))
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AnimatedIconButton(
                                            endIcon: Icon(
                                              Icons.close,
                                              color: Colors.black,
                                            ),
                                            startIcon: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                            ),
                                            animationController:
                                                controllers[widget.index]
                                                    .animationController,
                                            onPressed: () {
                                              onChange();
                                            },
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              widget.name,
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ],
                                      ),
                                      widget.title != ""
                                          ? Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Directionality(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    child: Text(
                                                      widget.title,
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 600),
                                  child: Opacity(
                                    opacity: controllers[widget.index]
                                        .animationController
                                        .value,
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20, left: 20),
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: new Text(
                                            widget.word,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  height:
                                      controllers[widget.index].animationHeight,
                                  width: double.infinity,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
