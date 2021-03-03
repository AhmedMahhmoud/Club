import 'package:demo_club/Models/FoodCategory.dart';
import 'package:demo_club/Models/RestaurantCart.dart';
import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Widgets/AlertDialog.dart';
import 'package:demo_club/Widgets/NewsTilesList.dart';
import 'package:demo_club/Widgets/RestaurantBottomSheet.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'CartScreen.dart';

class RestaurantQR extends StatefulWidget {
  @override
  _RestaurantQRState createState() => _RestaurantQRState();
}

List<String> foodCat = [
  "Meals",
  "Sandwitches",
  "Salads",
  "Drinks",
  "Kids Meals"
];

class _RestaurantQRState extends State<RestaurantQR> {
  var selectedFood = 0;
  final _controller = ScrollController();
  toggleCat(int newind) {
    setState(() {
      selectedFood = newind;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              children: [
                UserHeader2(),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        height: 240.h,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        image: NetworkImage(
                            "https://i0.wp.com/www.eatthis.com/wp-content/uploads/2018/12/mcdonalds-drive-through-restaurant.jpg?fit=1200%2C879&ssl=1"),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "McDonald's",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "Burgers,Fast food,Sandwitches",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 40.h,
                          child: ListView.builder(
                            controller: _controller,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 50.w),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            toggleCat(index);
                                          },
                                          child: Text(
                                            foodModel[index].catName,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 3,
                                          width: 40.w,
                                          color: selectedFood == index
                                              ? Colors.red[700]
                                              : Colors.black,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: foodModel.length,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                restaurantBottomSheet(
                                    context, index, selectedFood);
                              },
                              child: Container(
                                child:
                                    foodModel[selectedFood].catMenuItems[index],
                                padding: EdgeInsets.all(5),
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            )
                          ],
                        );
                      },
                      itemCount: foodModel[selectedFood].catMenuItems.length,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 15.h,
                left: 40.w,
                child: Consumer<RestaurantCart>(
                  builder: (context, value, child) {
                    return value.foodDataList.length != 0
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(),
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red[800],
                                  borderRadius: BorderRadius.circular(10)),
                              width: MediaQuery.of(context).size.width * 0.8,
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("EGP ${value.totalPrice} الأجمالى ",
                                      style: TextStyle(color: Colors.white)),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                            value.foodDataList.length
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.white)),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.white,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text("فتح السلة",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container();
                  },
                )),
            BackkIcon(
              function: () {
                Navigator.pop(context);
              },
            ),
          
          ],
        ),
      ),
    );
  }
}
