import 'package:demo_club/Screens/SportsActivitiesDetails.dart';
import 'package:demo_club/Widgets/NewsTilesList.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SportsScreen extends StatefulWidget {
  @override
  _SportsScreenState createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: double.infinity,
                  color: Colors.black,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          width: 40,
                          height: 45,
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(
                              "https://seeklogo.com/images/A/Al_Ahly_Club-logo-BA70BE3AE8-seeklogo.com.png"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          " العاب النادى الأهلى",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: sportsList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ActivitiesDetails(
                                  sportsList[index].image,
                                  index,
                                ),
                              ));
                        },
                        child: SportsActivitiesCard(
                          index: index,
                          image: sportsList[index].image,
                          title: sportsList[index].title,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          BackkIcon()
        ],
      ),
    );
  }
}

class SportsActivitiesCard extends StatelessWidget {
  final String image, title;
  final int index;
  SportsActivitiesCard({
    this.index,
    this.image,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(width: 1, color: Colors.white)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            child: Hero(
              tag: index,
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(image),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
      width: double.infinity,
      height: 200,
    );
  }
}
