import 'dart:ui';

import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
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
                ],
              ),
            ),
            BackkIcon(
              function: () => Navigator.pop(context),
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
