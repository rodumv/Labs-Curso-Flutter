import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return new Container(
    child: new Column(
      children: <Widget>[
        new Icon(
          Icons.contacts,
          size: 170.0,
          color: Colors.grey
        ),
        new Text("Tercer tab")
      ],
    ),
  
 );
 }
}