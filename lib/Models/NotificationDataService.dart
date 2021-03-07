
import 'package:flutter/material.dart';

import 'NotificationModel.dart';

class NotificationDataService with ChangeNotifier {
  List<NotificationMessage> notification = [];
  bool showNotificationDot = false;
  setNotificationList(List<NotificationMessage> notifyList) {
    notification = notifyList;
  }

  addNotification(
      String title, String msg, String dateTime, String category, int id) {
    notification.add(NotificationMessage(
        dateTime: dateTime,
        message: msg,
        title: title,
        category: category,
        messageSeen: 0,
        id: id));

    notifyListeners();
  }

  deleteNotification(int currentId) {
    notification.removeWhere((element) => element.id == currentId);
    notifyListeners();
  }

  int getUnSeenNotifications() {
    int counter = 0;
    if (notification.length != 0) {
      notification.forEach((element) {
        if (element.messageSeen == 0) {
          counter++;
        }
      });

      return counter;
    }
    return 0;
  }

 

  readMessage(int currentIndex) {
    notification[currentIndex].messageSeen = 1;
    notifyListeners();
  }

  setNotificationDot() {
    showNotificationDot = true;
    notifyListeners();
  }

  resetNotificationDot() {
    showNotificationDot = false;
    notifyListeners();
  }

  // FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  // DatabaseHelper db = new DatabaseHelper();
  // firebaseMessagingConfig(BuildContext context) async {
  //   bool userStatus = Provider.of<UserData>(context, listen: false).loggedIn;
  //   AudioCache player = AudioCache(prefix: "resources/audios/");
  //   _firebaseMessaging.configure(
  //       onMessage: (Map<String, dynamic> message) async {
  //     print("onMesage:");
  //     var notificationMsg = message["notification"];
  //     print(message);
  //     await db.insertNotification(
  //         NotificationMessage(
  //           category: message["data"]["category"],
  //           dateTime: DateTime.now().toString().substring(0, 10),
  //           message: notificationMsg["body"],
  //           messageSeen: 0,
  //           title: notificationMsg["title"],
  //         ),
  //         context);

  //     if (userStatus) {
  //       player.play("notification.mp3");
  //     }
  //   }, onLaunch: (Map<String, dynamic> message) async {
  //     print("onLaunch:$message");
  //   }, onResume: (Map<String, dynamic> message) async {
  //     var dataMsg = message["data"];
  //     print("onResume:$message");
  //     // await Provider.of<NotificationDataService>(context, listen: false)
  //     //     .addNotification(dataMsg["title"], dataMsg["body"],
  //     //         DateTime.now().toString().substring(0, 10), dataMsg["category"]);
  //     await db.insertNotification(
  //         NotificationMessage(
  //           category: message["data"]["category"],
  //           dateTime: DateTime.now().toString().substring(0, 10),
  //           message: dataMsg["body"],
  //           messageSeen: 0,
  //           title: dataMsg["title"],
  //         ),
  //         context);
  //     await initializeNotification(context);
  //     if (userStatus) {
  //       print(userStatus);
  //       player.play("notification.mp3");
  //     }

  //     // switch (message["data"]["category"]) {
  //     //   case "HealthCare":
  //     //     {
  //     //       BlocProvider.of<NavigationBloc>(context)
  //     //           .add(NavigationEvents.HealthCareClickedEvent);

  //     //       break;
  //     //     }
  //     //   case "HegOmra":
  //     //     {
  //     //       BlocProvider.of<NavigationBloc>(context)
  //     //           .add(NavigationEvents.HegAndOmraClickedEvent);
  //     //       break;
  //     //     }
  //     //   case "":
  //     //     {
  //     //       Navigator.pop(context);
  //     //       break;
  //     //     }
  //     //   default:
  //     //     {
  //     //       BlocProvider.of<NavigationBloc>(context)
  //     //           .add(NavigationEvents.HomePageClickedEvent);
  //     //     }
  //     //     break;
  //     // }
  // });

}
