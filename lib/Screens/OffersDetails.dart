import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Home.dart';

class OfferDetails extends StatelessWidget {
  final String image;
  final String title;
  final int index;
  final List<String> phone;
  final List<String> address;
  final String description;
  OfferDetails(
      {this.image,
      this.title,
      this.index,
      this.description,
      this.address,
      this.phone});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                        height: 200.h,
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
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.h),
                                child: Text(
                                  description,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      color: Colors.red[700],
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.right,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "التليفون",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).backgroundColor),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 0.5,
                              indent: 100.w,
                              endIndent: 100.w,
                            ),
                            Container(
                                height: 80.h,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: phone.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2),
                                      child: Text(
                                        phone[index],
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontStyle: FontStyle.italic),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  },
                                )),
                            Text(
                              "العنوان",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).backgroundColor),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 0.5,
                              indent: 100.w,
                              endIndent: 100.w,
                            ),
                            Container(
                              height: 80.h,
                              width: double.infinity,
                              child: ListView.builder(
                                itemCount: address.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(vertical: 2),
                                    child: Text(
                                      address[index],
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontStyle: FontStyle.italic),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
                top: 150.h,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                        color: Colors.red[800],
                      ),
                      shape: BoxShape.circle),
                  width: 60.w,
                  height: 60.h,
                  child: Hero(
                    tag: "ahly",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        image: NetworkImage(
                            "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515361_10542.jpg"),
                      ),
                    ),
                  ),
                )),
            BackkIcon(
              function: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
