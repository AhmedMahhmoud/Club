import 'package:demo_club/Models/FoodData.dart';
import 'package:flutter/cupertino.dart';

class RestaurantCart with ChangeNotifier {
  double totalPrice = 0;
  List<FoodData> foodDataList = [];
  addItemToCart(FoodData foodModel) {
    foodDataList.add(FoodData(
        image: foodModel.image,
        itemName: foodModel.itemName,
        itemPrice: foodModel.itemPrice,
        itemQuantity: foodModel.itemQuantity));
    notifyListeners();
  }

  removeByInddex(int indx) {
    // totalPrice -= foodDataList[indx].itemPrice;
    totalPrice = totalPrice - foodDataList[indx].itemPrice;
    foodDataList.removeAt(indx);

    notifyListeners();
  }

  calculateTotalPrice(double itemPrice) {
    totalPrice += itemPrice;

    notifyListeners();
  }
}
