import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GateAccess extends StatefulWidget {
  @override
  _GateAccessState createState() => _GateAccessState();
}

AnimationController _controller;
int levelClock = 60;

QRViewController controller;
final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

class _GateAccessState extends State<GateAccess> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
                levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
        );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(children: <Widget>[
            Column(
              children: <Widget>[
                UserHeader2(),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "الأعضاء فقط يمكنهم الدخول عبر مسح الكود على البوابة",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                        Countdown(
                          animation: StepTween(
                            begin: levelClock,
                            end: 0,
                          ).animate(_controller),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            BackkIcon(function: () {
              Navigator.pop(context);
            })
          ])),
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation}) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    // print('animation.value  ${animation.value} ');
    // print('inMinutes ${clockTimer.inMinutes.toString()}');
    // print('inSeconds ${clockTimer.inSeconds.toString()}');
    // print(
    //     'inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 250.h,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.red[800])),
            child: QrImage(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              //plce where the QR Image will be shown
              data: "احمد",
            ),
          ),
        ),
        animation.isCompleted
            ? Text(
                "تم انتهاء صلاحية الكود",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              )
            : Column(
                children: [
                  Text(
                    ":سوف يتم انتهاء صلاحية الكود فى ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "$timerText",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.red[800],
                    ),
                  ),
                ],
              )
      ],
    );
  }
}
