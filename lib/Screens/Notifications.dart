import 'package:demo_club/Models/UserModel.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/animation/gf_animation.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_animation_type.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Widgets/NewsTilesList.dart';
import '../Screens/Home.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          print(Provider.of<UserData>(context, listen: false).user.profileImg),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Card(
                    color: Colors.black,
                    elevation: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.red[800])),
                      child: GFAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                            "https://scontent.fcai21-2.fna.fbcdn.net/v/t1.0-9/79803978_2206482966119329_7485546926507556864_n.jpg?_nc_cat=108&ccb=3&_nc_sid=174925&_nc_eui2=AeHHQqdJBe1wPzn5bN-SOqIRtDQyKomkcn20NDIqiaRyfe1QwPHwKm5pkbWX0A0KvHxDNuCahayPeOmbX7gWDbNG&_nc_ohc=-7xnIwcJ6JcAX8sKi4C&_nc_ht=scontent.fcai21-2.fna&oh=05115c7a72aa71660088d476e3121e95&oe=605DC125",
                          )),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AnimatedPage(
                          card: Container(
                            margin: EdgeInsets.symmetric(vertical: 3),
                            child: NotificationsData(
                              datetime: notificationList[index].datetime,
                              isSeen: notificationList[index].isSeen,
                              notificationTitle:
                                  notificationList[index].notificationTitle,
                              notoficationSubtitle:
                                  notificationList[index].notoficationSubtitle,
                            ),
                          ),
                          secondScreen: notificationList[index].function,
                        );
                      },
                      itemCount: notificationList.length,
                    ),
                  ))
                ],
              ),
            ),
            BackkIcon(
              function: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}

class NotificationsData extends StatefulWidget {
  final String notificationTitle;
  final String notoficationSubtitle;
  final String datetime;
  final int isSeen;
  final Widget function;

  const NotificationsData({
    this.isSeen,
    this.datetime,
    this.notificationTitle,
    this.notoficationSubtitle,
    this.function,
    Key key,
  }) : super(key: key);

  @override
  _NotificationsDataState createState() => _NotificationsDataState();
}

AnimationController controller;
Animation<double> animation;

class _NotificationsDataState extends State<NotificationsData>
    with TickerProviderStateMixin {
  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GFAnimation(
        scaleAnimation: animation,
        controller: controller,
        type: GFAnimationType.scaleTransition,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 80.h,
          child: Row(
            children: [
              Expanded(
                child: Container(
                    height: 80.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text(
                              widget.datetime,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: 320.w,
                                child: Text(
                                  widget.notificationTitle,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(height: 3),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  widget.notoficationSubtitle,
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    color: widget.isSeen == 1
                        ? Colors.black45
                        : Color(0XFF2C2C2C).withOpacity(0.4)),
              ),
              Container(
                height: 80.h,
                width: 3,
                color: widget.isSeen == 1 ? Colors.grey : Colors.red[800],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
