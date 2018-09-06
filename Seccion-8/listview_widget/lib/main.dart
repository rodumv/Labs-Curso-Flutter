import 'package:flutter/material.dart';
import 'package:listview_widget/contact.dart';
void main() {
  runApp(new MaterialApp(
   home: new Scaffold(
     appBar: new AppBar(
       title: new Text("Contactos"),
     ),
     body: new Contact(),
   ),
  ));
}