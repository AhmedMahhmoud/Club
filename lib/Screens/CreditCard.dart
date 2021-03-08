import 'dart:ui';

import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';

import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  final String paymentButton;
  PaymentScreen({@required this.paymentButton});
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = "";
  String expiaryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  UserHeader2(),
                  CreditCardWidget(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          letterSpacing: 1,
                          color: Colors.white),
                      animationDuration: Duration(seconds: 1),
                      height: 250.h,
                      cardNumber: cardNumber,
                      expiryDate: expiaryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      showBackView: isCvvFocused),
                  CreditCardForm(
                    onCreditCardModelChange: onModelChange,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white)),
                    height: 55.h,
                    child: GFButton(
                      onPressed: () {
                        Dialog errorDialog = Dialog(
                          backgroundColor: Theme.of(context).highlightColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12.0)), //this right here
                          child: Container(
                            width: 300.w,
                            height: 400.h,
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        child: Lottie.asset(
                                            "android/app/resources/checkMarks.json",
                                            repeat: false),
                                      )),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'تمت عملية الدفع بنجاح',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "11020",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "رقم العملية ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      InkWell(
                                        onTap: () => Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Home()),
                                                (Route<dynamic> route) =>
                                                    false),
                                        child: Container(
                                            width: 200.w,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.red[800],
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'الرجوع للرئيسية ',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => errorDialog);
                      },
                      text: widget.paymentButton,
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
            BackkIcon(
              function: () => Navigator.pop(context),
            ),
            Positioned(
              top: 40.h,
              left: 10.w,
              child: Notofications(),
            )
          ],
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
