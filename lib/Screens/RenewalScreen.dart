import 'package:demo_club/Models/UserModel.dart';
import 'package:demo_club/Screens/CreditCard.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:lottie/lottie.dart';

import '../Screens/Home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RenewalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: 20.h),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  UserHeader2(),
                  Container(
                    child: FaIcon(
                      FontAwesomeIcons.moneyCheck,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                  PaymentDetailsCard(
                    content: Content(),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white)),
                    height: 55.h,
                    child: GFButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentScreen(
                                paymentButton: "اتمام الدفع",
                              ),
                            ));
                      },
                      text: "متابعة",
                      size: GFSize.LARGE,
                      shape: GFButtonShape.square,
                      blockButton: true,
                      color: Colors.red[800],
                      fullWidthButton: true,
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40.h,
            left: 10.w,
            child: Notofications(),
          ),
          BackkIcon(
            function: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}

const kSubHeadersTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black);
const kHeadersTextStyle =
    TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w800);
const kTextStyle =
    TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600);

class RenewDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFede8e8),
        body: PaymentDetailsCard(
          content: Content(),
        ));
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

int syndicateRegesteriationCost = 100;
int syndicateInternalCost = 30;
int healthcareRegisterCost = 0;
int mainSyndicateCost = 100;
int wifeSyndicateCost = 0;
int sonsSyndticateCost = 0;
var wifeBool = false;
var sonsBool = false;
var healthcareRegisterBool = false;

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.black)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "تجديد عضوية",
                      style: kHeadersTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Text(
                            syndicateRegesteriationCost.toString(),
                            style: kTextStyle,
                          )),
                          Text(
                            "اشتراك عضوية النادى ",
                            textAlign: TextAlign.right,
                            style: kSubHeadersTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Text(
                          syndicateInternalCost.toString(),
                          style: kTextStyle,
                        )),
                        Text(
                          "مصاريف ادارية ",
                          textAlign: TextAlign.right,
                          style: kSubHeadersTextStyle,
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.moneyBill,
                                color: Colors.red[800],
                                size: 18,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "تجديد الأشتراك ",
                                  textAlign: TextAlign.right,
                                  style: kSubHeadersTextStyle,
                                ),
                              ),
                              Checkbox(
                                activeColor: Colors.red[800],
                                onChanged: (value) {
                                  setState(() {
                                    healthcareRegisterBool = value;
                                    if (value == false) {
                                      healthcareRegisterCost = 0;
                                    } else {
                                      healthcareRegisterCost = 60;
                                    }
                                  });
                                },
                                value: healthcareRegisterBool,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    !healthcareRegisterBool
                        ? Divider(
                            thickness: 1,
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                              left: 15.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: Text(
                                      mainSyndicateCost.toString(),
                                      style: kTextStyle,
                                    )),
                                    Row(
                                      children: [
                                        Text(
                                          "اشتراك العضو الرئيسي",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Checkbox(
                                          activeColor: Colors.red[800],
                                          onChanged: (value) {},
                                          value: healthcareRegisterBool,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //////////
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: Text(
                                      140.toString(),
                                      style: kTextStyle,
                                    )),
                                    Row(
                                      children: [
                                        Text(
                                          "اشتراك الزوجة",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Checkbox(
                                          activeColor: Colors.red[800],
                                          onChanged: (value) {
                                            setState(() {
                                              wifeBool = value;
                                            });
                                            if (value == false) {
                                              wifeSyndicateCost = 0;
                                            } else {
                                              wifeSyndicateCost = 140;
                                            }
                                          },
                                          value: wifeBool,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                ////////
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: Text(
                                      140.toString(),
                                      style: kTextStyle,
                                    )),
                                    Row(
                                      children: [
                                        Text(
                                          "اشتراك الأبناء",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Checkbox(
                                          activeColor: Colors.red[800],
                                          onChanged: (value) {
                                            setState(() {
                                              sonsBool = value;
                                            });
                                            if (value == false) {
                                              sonsSyndticateCost = 0;
                                            } else {
                                              sonsSyndticateCost = 140;
                                            }
                                          },
                                          value: sonsBool,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ]),
            ),
            BnodRowWidget(
                itemPrice: (syndicateInternalCost +
                        syndicateRegesteriationCost +
                        healthcareRegisterCost +
                        sonsSyndticateCost +
                        wifeSyndicateCost)
                    .toString()),

            // SubmitButton(
            //   animationValue: 1.0,
            //   title: "متابعة",
            //   function: () {
            //     Navigator.of(context).push(
            //       new MaterialPageRoute(
            //         builder: (context) => PaymentScreen(),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class BnodRowWidget extends StatelessWidget {
  final String itemPrice;
  const BnodRowWidget({
    @required this.itemPrice,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.red[800],
      ),
      width: MediaQuery.of(context).size.width,
      height: 60.h,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "جنية",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  itemPrice,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            Text(
              ":القيمة  ",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentDetailsCard extends StatelessWidget {
  final Widget content;
  PaymentDetailsCard({this.content});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 7,
                              shadowColor: Colors.red[800],
                              child: content),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
