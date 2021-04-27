import 'package:demo_club/Models/RestaurantCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FoodCartMenu extends StatelessWidget {
  final String title, image;
  final int quantity;
  final int indx;
  final double price;
  const FoodCartMenu({
    this.indx,
    this.quantity,
    this.price,
    this.image,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 2,
          child: Container(
            padding: EdgeInsets.only(left: 10),
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
                          color: Theme.of(context).highlightColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "EGP $price",
                      style: TextStyle(
                          color: Theme.of(context).highlightColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      child: Text(quantity.toString()),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Theme.of(context).highlightColor,
                              width: 1)),
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Image(
                      image: NetworkImage(image),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            right: 5.w,
            top: 5.h,
            child: GestureDetector(
              onTap: () {
                Provider.of<RestaurantCart>(context, listen: false)
                    .removeByInddex(indx);
              },
              child: Container(
                height: 25.h,
                width: 25.w,
                child: Center(
                  child: Icon(
                    Icons.close,
                    size: 17,
                    color: Colors.black,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 1)),
              ),
            ))
      ],
    );
  }
}
