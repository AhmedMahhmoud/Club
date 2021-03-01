import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsScreen extends StatelessWidget {
  final String image;
  final String title;
  final int index;
  NewsScreen({this.image, this.title, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: ClipPath(
                        clipper: WaveClipperOne(flip: true),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          alignment: Alignment.center,
                          child: Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          height: 190.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red[700],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(3),
                      width: double.infinity,
                      height: 250.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Hero(
                          tag: index,
                          child: Image(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "22-2-2021",
                                style: TextStyle(
                                  fontSize: ScreenUtil()
                                      .setSp(16, allowFontScalingSelf: true),
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Container(
                              child: Text(
                                "بعيدًا عن رمال الشواطئ، نقدم لك دليلًا مختلفًا للاستمتاع بأجواء دافئة وجولة ليوم واحد لا تُنسى تبدأ باستقلال القطار، من محطة مصر بميدان رمسيس في الثامنة وعشر دقائق صباحًا، الدرجة الثانية، وتذكرته تبلغ 30 جنيهًا",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: ScreenUtil()
                                        .setSp(16, allowFontScalingSelf: true),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 150.h,
              right: 10,
              child: Container(
                width: 60.w,
                height: 60.h,
                child: Hero(
                  tag: "ahly",
                  child: Image(
                    image: NetworkImage(
                        "https://seeklogo.com/images/A/Al_Ahly_Club-logo-BA70BE3AE8-seeklogo.com.png"),
                  ),
                ),
              )),
          BackkIcon()
        ],
      ),
    );
  }
}
