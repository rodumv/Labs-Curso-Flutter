import 'package:flutter/material.dart';
import 'package:drawer_widget/pages/home.dart';
import 'package:drawer_widget/pages/settings.dart';
import 'package:drawer_widget/pages/battery.dart';


void main() {
  runApp(new MaterialApp(
   home: Home(),
   routes: <String, WidgetBuilder>
   {
     Settings.routeName: (BuildContext context) => new Settings(),
     Battery.routeName: (BuildContext context) => new Battery(),
   }
  ));
}
