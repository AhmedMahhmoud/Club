import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:demo_club/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/components/animation/gf_animation.dart';
import 'package:getwidget/types/gf_animation_type.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIntro extends StatefulWidget {
  PageIntro();
  @override
  _PageIntroState createState() => _PageIntroState();
}

AnimationController controller2;
Animation<double> animation;

class _PageIntroState extends State<PageIntro> with TickerProviderStateMixin {
  int _currentIndex = 0;

  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  _onPageChange(int indx) {
    setState(() {
      _currentIndex = indx;
    });
    controller2 =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = new CurvedAnimation(parent: controller2, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      SliderPage(
        title: "  ",
        desc: "عن طريق هذا التطبيق يمكنك ",
        image: "android/app/resources/liver.json",
        index: 0,
      ),
      SliderPage(
        title: "تجديد الأشتراكات",
        desc:
            "يمكنك تجديد اشتراك العضوية الخاصة بك  و لأفراد اسرتك من المنزل عن طريق الدفع الأونلاين",
        image: "android/app/resources/payment.json",
        index: 1,
      ),
      SliderPage(
        title: "متابعة الأنشطة الرياضية",
        desc:
            "يمكنك متابعة جميع النشاطات الرياضية المتاحة في النادى و متابعة كل الفروع المتاح بها التدريب و ايضا حجز و اشتراك فى الرياضة",
        image: "android/app/resources/sport.json",
        index: 2,
      ),
      SliderPage(
        title: "المطاعم",
        desc:
            "الأن يمكنك طلب الأوردر الخاص بك في النادى من خلال جلوسك فى المطعم و مسح الكود المرفق على الطاولة و اختيار طريقة الدفع",
        image: "android/app/resources/food.json",
        index: 3,
      ),
      SliderPage(
        title: "تصريح دخول النادى",
        desc:
            "يمكنك دخول النادى بدون كارت العضوية فقط عبر توجية الهاتف على الجهاز المرفق على البوابة",
        image: "android/app/resources/scanner.json",
        index: 4,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _pages[index];
                },
                scrollDirection: Axis.horizontal,
                controller: _controller,
                onPageChanged: _onPageChange),
            SizedBox(
              height: 20.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _currentIndex < _pages.length - 1
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List<Widget>.generate(_pages.length - 1, (index) {
                          return AnimatedContainer(
                            margin: EdgeInsets.only(bottom: 29),
                            duration: Duration(milliseconds: 100),
                            height: 12.h,
                            width: index == _currentIndex ? 30.w : 20.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: index == _currentIndex
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                            ),
                          );
                        }),
                      )
                    : InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 80.h,
                          child: Center(
                            child: Text(
                              "المتابعة الى التطبيق",
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontSize: ScreenUtil()
                                      .setSp(17, allowFontScalingSelf: true),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
            _currentIndex != _pages.length - 1
                ? Positioned(
                    right: 0,
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "تخطى",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil()
                                  .setSp(18, allowFontScalingSelf: true),
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class SliderPage extends StatelessWidget {
  final String title, desc, image;
  final int index;
  SliderPage({this.title, this.desc, this.image, this.index});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(bottom: 50.w),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border:
                    Border.all(width: 2, color: Theme.of(context).primaryColor),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("android/app/resources/logo.jpg"),
                )),
            width: 120.w,
            height: 120.h,
          ),
          SizedBox(
            height: 60.h,
          ),
          title == null
              ? ''
              : Text(
                  title,
                  style: TextStyle(
                      fontSize:
                          ScreenUtil().setSp(28, allowFontScalingSelf: true),
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
          Container(
            child: Lottie.asset(image),
            width: width * 0.28,
            height: 90.h,
          ),
          SizedBox(
            height: index == 0 ? 30.h : 20.h,
          ),
          GFAnimation(
            scaleAnimation: animation,
            controller: controller2,
            type: GFAnimationType.scaleTransition,
            child: Container(
              height: 220.h,
              child: Card(
                color: Theme.of(context).highlightColor,
                elevation: 6,
                shadowColor: Theme.of(context).primaryColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80.h, vertical: 40),
                  child: index == 0
                      ? Column(
                          children: [
                            Text(
                              desc,
                              style: TextStyle(
                                  height: 1.4,
                                  fontWeight: FontWeight.w800,
                                  fontSize: ScreenUtil()
                                      .setSp(17, allowFontScalingSelf: true),
                                  letterSpacing: 0.4,
                                  color: Theme.of(context).primaryColor),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ScaleAnimatedTextKit(
                              repeatForever: true,
                              duration: Duration(milliseconds: 2500),
                              onTap: () {
                                print("Tap Event");
                              },
                              text: [
                                "تجديد اشتراك العضوية",
                                "متابعة الأنشطة الرياضية",
                                "تصريح دخول النادى ",
                                "متابعة الرحلات",
                                "متابعة العروض المتاحة"
                              ],
                              textStyle: TextStyle(
                                  fontSize: 17.0,
                                  color: Theme.of(context).backgroundColor),
                              textAlign: TextAlign.start,
                            )
                          ],
                        )
                      : Text(
                          desc,
                          style: TextStyle(
                              height: 1.2,
                              fontWeight: FontWeight.w800,
                              fontSize: ScreenUtil()
                                  .setSp(17, allowFontScalingSelf: true),
                              color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.center,
                        ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
        ],
      ),
    );
  }
}
