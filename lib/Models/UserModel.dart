import 'package:flutter/cupertino.dart';

class User {
  String id;
  String name;
  String email;
  String profileImg;

  User({this.email, this.id, this.name, this.profileImg});
}

class UserData with ChangeNotifier {
  bool loggedIn = false;
  User user =
      User(email: "ahmed@gmail.com", id: "1234", name: "Ahmed", profileImg: "");

  login(String id) {
    if (id == user.id) {
      loggedIn = true;
      notifyListeners();
    } else {
      loggedIn = false;
    }
  }
}
