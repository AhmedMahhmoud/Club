import 'dart:math' as math;

import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'MyHomePage.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipPath(
                          clipper: ReviewMyClipper(),
                          child: Container(
                            height: (MediaQuery.of(context).size.height) / 2.75,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red[900],
                            ),
                          ),
                        ),
                        ClipPath(
                          clipper: ReviewMyClipper(),
                          child: Container(
                            height: (MediaQuery.of(context).size.height) / 2.8,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.red[900],
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 60,
                                          child: Container(
                                            width: 200,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(75.0),
                                              child: Image.asset(
                                                  "android/app/resources/logo.jpg"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Version 1.0.0",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF3b3c40),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  AboutUsCard(
                                    child: ListTile(
                                      onTap: () {
                                        Share.share(
                                            'https://play.google.com/store/apps/dev?id=6238642369026075010');
                                      },
                                      title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                                flex: 6,
                                                child: Text("شارك التطبيق",
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF3b3c40),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Transform(
                                                  transform: Matrix4.rotationY(
                                                      math.pi),
                                                  alignment: Alignment.center,
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.share,
                                                      color: Color(0xFF3b3c40),
                                                    ),
                                                  ),
                                                ))
                                          ]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  MyListTile(
                                    title: "قيم التطبيق",
                                    rotated: false,
                                    icon: FontAwesomeIcons.googlePlay,
                                    link:
                                        'https://play.google.com/store/apps/dev?id=6238642369026075010',
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          BackkIcon(
            function: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class AboutUsCard extends StatelessWidget {
  final Widget child;

  AboutUsCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: Colors.white,
        child: child);
  }
}

class MyListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String link;
  final bool rotated;
  MyListTile({this.title, this.icon, this.link, this.rotated});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      color: Colors.white,
      child: ListTile(
        onTap: () {
          launch(link);
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Text(title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Color(0xFF3b3c40),
                        fontSize: 16,
                        fontWeight: FontWeight.bold))),
            SizedBox(
              width: 5,
            ),
            Expanded(
                flex: 1,
                child: Transform(
                  transform: rotated
                      ? Matrix4.rotationY(math.pi)
                      : Matrix4.rotationX(0),
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      icon,
                      color: Color(0xFF3b3c40),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class CircletTile extends StatelessWidget {
  final IconData icon;
  final String link;
  final iconColor;
  CircletTile({this.icon, this.link, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: IconButton(
        onPressed: () {
          launch(link);
        },
        icon: Icon(
          icon,
          color: Color(0xffFF7E00),
        ),
      ),
    );
  }
}
