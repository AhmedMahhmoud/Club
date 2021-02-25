import 'package:demo_club/Widgets/NewsTilesList.dart';
import 'package:demo_club/Widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivitiesDetails extends StatefulWidget {
  final String image;
  final int index;
  ActivitiesDetails(this.image, this.index);
  @override
  _ActivitiesDetailsState createState() => _ActivitiesDetailsState();
}

List<String> catsList = [
  "عن الأكادمية",
  "الفروع",
  "معرض الصور",
  
];

class _ActivitiesDetailsState extends State<ActivitiesDetails> {
  var selectedCat = 0;
  toggleCat(int newind) {
    setState(() {
      selectedCat = newind;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 8.0,
                          offset: Offset(0.0, 0.15))
                    ],
                  ),
                  child: Hero(
                    tag: widget.index,
                    child: Image(
                      image: NetworkImage(widget.image),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ListView.builder(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    toggleCat(index);
                                  },
                                  child: Text(
                                    catsList[index],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  width: 100,
                                  color: selectedCat == index
                                      ? Colors.red[700]
                                      : Colors.black,
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: catsList.length,
                  ),
                ),
                selectedCat == 0
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "  أكاديمية النادى الأهلى لكرة القدم هى مدرسة لتعليم اسس كرة القدم وفق الانظمة الحديثة المتبعة فى العالم فى كرة القدم",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      )
                    : selectedCat == 1
                        ? Expanded(
                            child: ListView(
                              children: placeLocation,
                            ),
                          )
                        : Container(
                            child: Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Image(
                                  image: NetworkImage(imagesGallery[index]),
                                );
                              },
                              itemCount: imagesGallery.length,
                            ),
                          ))
              ],
            ),
          ),
          BackkIcon()
        ],
      ),
    );
  }
}

class PlaceLocation extends StatelessWidget {
  final String title;
  final Function function;
  const PlaceLocation({
    this.function,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Card(
        elevation: 5,
        child: Container(
          height: 50,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.red[700],
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ],
              ),
              Text(title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
