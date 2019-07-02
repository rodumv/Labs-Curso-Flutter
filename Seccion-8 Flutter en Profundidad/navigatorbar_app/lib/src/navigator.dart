
import 'package:flutter/material.dart';
import 'package:navigatorbar_app/src/screens/first.dart';
import 'package:navigatorbar_app/src/screens/second.dart';
import 'package:navigatorbar_app/src/screens/third.dart';

class MyNavigator extends StatefulWidget {
  @override
  _MyNavigatorState createState() => new _MyNavigatorState();
 }
class _MyNavigatorState extends State<MyNavigator> 
{
  @override
  Widget build(BuildContext context) {
   return 
   DefaultTabController(
     length: 3,
     child: Scaffold(
     appBar: AppBar(
       title:Text("Demo Bottom Navigation Bar"),
     ),
    body: TabBarView(
      children: <Widget>[FirstTab(), SecondTab(), ThirdTab()],
    ),
    bottomNavigationBar:  
        Material(
            color: Colors.blueAccent,
            child: TabBar(
            tabs: <Tab> [
              Tab(icon: Icon(Icons.alarm)),
              Tab(icon: Icon(Icons.watch_later)),
              Tab(icon: Icon(Icons.airplanemode_active))
            ],
          ),
        )
      ) 
    );
  }
}
