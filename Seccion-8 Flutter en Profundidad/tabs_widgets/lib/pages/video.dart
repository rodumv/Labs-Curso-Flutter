import 'package:flutter/material.dart';

class Video extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return new Container(
    child: new Column(
      children: <Widget>[
        new Icon(
          Icons.ondemand_video,
          size: 170.0,
          color: Colors.green
        ),
        new Text("Segundo tab")
      ],
    ),
  
 );
 }
}