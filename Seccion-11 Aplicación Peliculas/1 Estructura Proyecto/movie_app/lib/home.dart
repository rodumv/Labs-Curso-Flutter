import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
 }
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Flutter Movie"),
       actions: <Widget>[
         new IconButton(
           icon: new Icon(Icons.search, color: Colors.white,),
           onPressed: () {},
         )
       ],
     ),
     drawer: new Drawer(),
    body: new PageView(

    ),
     bottomNavigationBar: new BottomNavigationBar(
       items: _getFooterItems(),
     ),
   );
  }
   List<BottomNavigationBarItem> _getFooterItems(){
     return [
       new BottomNavigationBarItem(
         icon: new Icon(Icons.thumb_up), title:  new Text("Populares")
       ),
       new BottomNavigationBarItem(
         icon: new Icon(Icons.update), title:  new Text("Próximamente")
       ),
       new BottomNavigationBarItem(
         icon: new Icon(Icons.star), title:  new Text("Mejor valoradas")
       )
       
     ];
   }
 
}

