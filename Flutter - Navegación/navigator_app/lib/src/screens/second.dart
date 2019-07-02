import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  final String title; 
  Second({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text(title),
       ),
       body: Center(
         child: RaisedButton(
           child: Text("Ir Atras!"),
           onPressed: () { Navigator.pop(context);},
         )
       ),
    );
  }
}