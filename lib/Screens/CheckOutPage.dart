import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';

import 'package:demo_club/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutScreen extends StatefulWidget {
  final double price;
  CheckoutScreen({this.price});
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

int selectedIndex = 1;
final _controller = ScrollController();

class _CheckoutScreenState extends State<CheckoutScreen> {
  toggleSelectedIndex(int n) {
    setState(() {
      selectedIndex = n;
    });
    Timer(
      Duration(seconds: 1),
      () => _controller.jumpTo(_controller.position.maxScrollExtent),
    );
  }

  String cardNumber = "";
  String expiaryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;
  @override
  void initState() {
    selectedIndex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            controller: _controller,
            children: [
              Column(
                children: [
                  UserHeader2(),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 50.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Lottie.asset("android/app/resources/payment.json",
                            width: 100.w, height: 100.h),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TypewriterAnimatedTextKit(
                            totalRepeatCount: 3,
                            repeatForever: false,
                            displayFullTextOnTap: true,
                            speed: Duration(milliseconds: 500),
                            text: ["الدفع"],
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "المبلغ الأجمالى",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("EGP ${widget.price}",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text("طريقة الدفع",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text("برجاء اختيار طريقة الدفع",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: GestureDetector(
                                  onTap: () => toggleSelectedIndex(0),
                                  child: Container(
                                    width: 120.w,
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        "البطاقة الأتمانية",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: selectedIndex == 1
                                            ? Colors.black
                                            : Colors.red[800],
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1, color: Colors.red[800])),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => toggleSelectedIndex(1),
                                child: Container(
                                  width: 120.w,
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                    child: Text(
                                      "كاش",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: selectedIndex == 0
                                          ? Colors.black
                                          : Colors.red[800],
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1, color: Colors.red[800])),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          selectedIndex == 0
                              ? Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15))),
                                      child: CreditCardWidget(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              letterSpacing: 1,
                                              color: Colors.white),
                                          animationDuration:
                                              Duration(seconds: 1),
                                          height: 180.h,
                                          cardNumber: cardNumber,
                                          expiryDate: expiaryDate,
                                          cardHolderName: cardHolderName,
                                          cvvCode: cvvCode,
                                          showBackView: isCvvFocused),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: CreditCardForm(
                                        onCreditCardModelChange: onModelChange,
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: GFButton(
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg: "تم وضع طلبك بنجاح ",
                                    backgroundColor: Colors.red[700],
                                    textColor: Colors.white);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ));
                              },
                              text: "متابعة وضع الطلب",
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onModelChange(CreditCardModel model) {
    setState(() {
      cardNumber = model.cardNumber;
      cardHolderName = model.cardHolderName;
      cvvCode = model.cvvCode;
      expiaryDate = model.expiryDate;
      isCvvFocused = model.isCvvFocused;
    });
  }
}
