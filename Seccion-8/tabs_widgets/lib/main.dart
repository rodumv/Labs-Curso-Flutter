import 'package:flutter/material.dart';
import 'package:tabs_widgets/pages/home.dart';
import 'package:tabs_widgets/pages/video.dart';
import 'package:tabs_widgets/pages/contact.dart';


void main() {
  runApp(new MaterialApp(
   home: MyTabs(),
  ));
}


class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => new _MyTabsState();
 }


class _MyTabsState extends State<MyTabs>  with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      controller = new TabController(length: 3, vsync: this);
    }
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Video Tabs"),
       backgroundColor: Colors.redAccent,
       bottom: new TabBar(
         tabs: <Widget>[
           new Tab(
             icon: new Icon(Icons.home),
           ),
          new Tab(
             icon: new Icon(Icons.ondemand_video),
           ),
          new Tab(
             icon: new Icon(Icons.contacts),
           )
         ],
         controller: controller,
       ),
     ),
    body: new TabBarView(
      children: <Widget>[
         new Home(), new Video(), new Contact() 
      ],
      controller: controller
    )
   );
  }
}