import 'package:flutter/material.dart';
class Contact extends StatelessWidget {
  const Contact({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
         Icon(
           Icons.contacts,
           size: 170.0,
           color: Colors.grey
         ),
         Text("Tercer Tab")
      ],),
    );
  }
}
