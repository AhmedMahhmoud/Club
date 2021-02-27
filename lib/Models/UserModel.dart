import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Screens/MyHomePage.dart';
import 'package:demo_club/Widgets/AlertDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  logout(BuildContext context) {
    loggedIn = false;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  }

  login(String id, BuildContext context) {
    if (id == user.id) {
      loggedIn = true;

      notifyListeners();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    } else {
      loggedIn = false;
      return showDialog(
        context: context,
        builder: (context) {
          return RoundedAlert(
            buttonName: "اعادة المحاولة",
            content: "لقد ادخلت رقم عضوية خاطئ",
            title: "خطأ في الدخول",
            onPressed: () {
              Navigator.pop(context);
            },
          );
        },
      );
    }
  }
}
