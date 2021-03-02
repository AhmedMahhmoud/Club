import 'package:demo_club/Screens/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackkIcon extends StatelessWidget {
  final Function function;
  const BackkIcon({
   @required this.function,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: IconButton(
      icon: Icon(
        Icons.chevron_left,
        color: Colors.white,
        size: 40,
      ),
      onPressed: function,
    ));
  }
}
