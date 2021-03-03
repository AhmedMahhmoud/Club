import 'package:demo_club/Models/RestaurantCart.dart';
import 'package:demo_club/Screens/CheckOutPage.dart';
import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Widgets/CartFoodItemWidget.dart';
import 'package:demo_club/Widgets/backButton.dart';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Consumer<RestaurantCart>(
            builder: (context, value, child) {
              return value.foodDataList.length != 0
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          UserHeader2(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Lottie.network(
                                    "https://assets10.lottiefiles.com/packages/lf20_yJmXiX.json",
                                    width: 70.w,
                                    height: 70.h),
                                Text(
                                  "الطلب",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: ListView.builder(
                            itemCount: value.foodDataList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    child: FoodCartMenu(
                                      image: value.foodDataList[index].image,
                                      price:
                                          value.foodDataList[index].itemPrice,
                                      title: value.foodDataList[index].itemName,
                                      quantity: value
                                          .foodDataList[index].itemQuantity,
                                      indx: index,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                ],
                              );
                            },
                          )),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("ملخص الدفع",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("EGP ${value.totalPrice.toString()}",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14)),
                                    Text(
                                      "المبلغ الفرعى",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("EGP 4.99",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14)),
                                    Text(
                                      "ضريبة الخدمة",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("EGP ${value.totalPrice + 4.99}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14)),
                                    Text(
                                      "المبلغ الكلى",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    width: 120.w,
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        "اضافة منتجات",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1, color: Colors.red[800])),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CheckoutScreen(
                                          price: value.totalPrice,
                                        ),
                                      )),
                                  child: Container(
                                    width: 120.w,
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        "الدفع",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.red[800],
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1, color: Colors.red[800])),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: Column(
                          children: [
                            UserHeader2(),
                            Lottie.network(
                                "https://assets10.lottiefiles.com/packages/lf20_yJmXiX.json",
                                width: 200.w,
                                height: 200.h),
                            Text(
                              "السلة فارغة ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "برجاء اضافة منتجات في السلة",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                    color: Colors.red[800],
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "اضافة منتجات",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
          BackkIcon(
            function: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
