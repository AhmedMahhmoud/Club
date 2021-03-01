import 'package:demo_club/Models/FoodCategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'NewsTilesList.dart';

Future restaurantBottomSheet(
    BuildContext context, int index, int selectedFood) {
  var prov = Provider.of<FoodService>(context, listen: false);
  prov.setTotal(
    foodModel[selectedFood].catMenuItems[index].price,
  );
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Consumer<FoodService>(
        builder: (context, value, child) {
          return Container(
            height: 550.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Image(
                    width: double.infinity,
                    height: 200.h,
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        foodModel[selectedFood].catMenuItems[index].image),
                  ),
                  Text(
                    foodModel[selectedFood].catMenuItems[index].title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  value.decrementPrice();
                                },
                                child: Container(
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    color: value.startIndex > 1
                                        ? Colors.red[700]
                                        : Colors.black,
                                    size: 10,
                                  ),
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: value.startIndex > 1
                                            ? Colors.red[700]
                                            : Colors.grey),
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                value.startIndex.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  prov.incrementPrice();
                                },
                                child: Container(
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.red[700],
                                    size: 10,
                                  ),
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.red[700]),
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Text(
                            "EGP   ${value.total}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        foodModel[selectedFood].catMenuItems[index].description,
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Fluttertoast.showToast(
                          msg: "Item placed successfully to your basket",
                          backgroundColor: Colors.red[700],
                          textColor: Colors.white);
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red[800],
                          borderRadius: BorderRadius.circular(14)),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "EGP  ${value.total}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "Add to basket",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  ).whenComplete(() => prov.resetTotalAndIndex());
}

class FoodItemMenuWidg extends StatelessWidget {
  final String title, description, image;
  final double price;
  const FoodItemMenuWidg({
    this.description,
    this.price,
    this.image,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                width: 230.w,
                child: Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Text(
                "EGP $price",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(image),
            ),
          )
        ],
      ),
    );
  }
}
