import 'package:demo_club/Screens/RestaurantAfterQr.dart';
import 'package:demo_club/Widgets/RestaurantBottomSheet.dart';
import 'package:flutter/cupertino.dart';

class FoodCategoryModel {
  String catName;
  List<FoodItemMenuWidg> catMenuItems;
  FoodCategoryModel({this.catMenuItems, this.catName});
}

class FoodService with ChangeNotifier {
  double total = 0;
  double mainPrice = 0;
  int startIndex = 1;
  incrementPrice() {
    total += mainPrice;
    startIndex++;
    notifyListeners();
  }

  decrementPrice() {
    if (startIndex > 1) {
      total -= mainPrice;
      startIndex--;
    }

    notifyListeners();
  }

  setTotal(double newPrice) {
    total = newPrice;
    mainPrice = newPrice;
    notifyListeners();
  }

  resetTotalAndIndex() {
    total = 0;
    startIndex = 1;
    notifyListeners();
  }
}
