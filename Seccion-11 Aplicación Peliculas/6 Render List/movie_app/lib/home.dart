import 'package:flutter/material.dart';
import 'package:movie_app/media_list.dart';
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
     drawer: new Drawer(
       child: new ListView(
         children: <Widget>[
           
       new DrawerHeader(child: new Material()),
       new ListTile(
         title: new Text("Peliculas"),
          trailing: new Icon(Icons.local_movies),
       ),
       new Divider(
         height: 5.0,
       ),
       new ListTile(
         title: new Text("Televisión"),
          trailing: new Icon(Icons.live_tv),
       ),
       new Divider(
         height: 5.0,
       ),
       new ListTile(
         title: new Text("Cerrar"),
          trailing: new Icon(Icons.close),
          onTap: () => Navigator.of(context).pop(),
       )
         ],
       )
     ),
    body: new PageView(
      children: <Widget>[
        new MediaList()
      ],
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

