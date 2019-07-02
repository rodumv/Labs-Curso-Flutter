import 'package:drawer_app/home.dart';
import 'package:drawer_app/screens/battery.dart';
import 'package:drawer_app/screens/settings.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(
    MaterialApp(
      home: Home(),
      routes: <String, WidgetBuilder> 
      {
        Settings.routeName: (BuildContext context) => Settings(),
        Battery.routeName: (BuildContext context) => Battery(),
      },
  ));
}