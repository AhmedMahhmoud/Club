import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackkIcon extends StatelessWidget {
  const BackkIcon({
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
      onPressed: () {
        Navigator.pop(context);
      },
    ));
  }
}
