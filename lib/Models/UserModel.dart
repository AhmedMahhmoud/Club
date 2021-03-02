import 'package:demo_club/Screens/Home.dart';
import 'package:demo_club/Screens/MyHomePage.dart';
import 'package:demo_club/Widgets/AlertDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User {
  String id;
  String name;
  String email;
  String phone;
  String profileImg;

  User({this.email, this.id, this.name, this.profileImg, this.phone});
}

class UserData with ChangeNotifier {
  bool loggedIn = false;
  User user = User(
      email: "ahmed@gmail.com",
      id: "1234",
      name: "احمد محمود عبد الحميد",
      profileImg:
          "https://scontent.fcai21-2.fna.fbcdn.net/v/t1.0-9/79803978_2206482966119329_7485546926507556864_n.jpg?_nc_cat=108&ccb=3&_nc_sid=174925&_nc_eui2=AeHHQqdJBe1wPzn5bN-SOqIRtDQyKomkcn20NDIqiaRyfe1QwPHwKm5pkbWX0A0KvHxDNuCahayPeOmbX7gWDbNG&_nc_ohc=-7xnIwcJ6JcAX8sKi4C&_nc_ht=scontent.fcai21-2.fna&oh=05115c7a72aa71660088d476e3121e95&oe=605DC125",
      phone: "01112601115");

  logout(BuildContext context) {
    loggedIn = false;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  }

  update(User newUser) {
    if (newUser.email != "") {
      user.email = newUser.email;
    }
    if (newUser.name != "") {
      user.name = newUser.name;
    }
    if (newUser.phone != "") {
      user.phone = newUser.phone;
    }

    notifyListeners();
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
