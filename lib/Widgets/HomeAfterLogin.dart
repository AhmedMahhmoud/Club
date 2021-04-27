import 'package:demo_club/Screens/NewsDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../Screens/Home.dart';
import 'NewsTilesList.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAfterLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        UserHeader2(),
        Expanded(
          child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: Swiper(
                autoplay: true,
                autoplayDelay: 4000,
                fade: 0.2,
                itemCount: newslist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsScreen(
                              index: index,
                              image: newslist[index].image,
                              title: newslist[index].newsTitle,
                              description: newslist[index].description,
                            ),
                          ));
                    },
                    child: Column(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Hero(
                              tag: index,
                              child: Image(
                                width: double.infinity,
                                height: 160.h,
                                fit: BoxFit.fill,
                                image: NetworkImage(newslist[index].image),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                            ),
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: Text(
                              newslist[index].newsTitle,
                              style: TextStyle(
                                  color: Colors.orange[700],
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )),
        ),
      ],
    ));
  }
}
