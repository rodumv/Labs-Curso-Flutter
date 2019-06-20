import 'package:flutter/material.dart';
import 'package:movie_app/media_list.dart';
import 'package:movie_app/common/MediaProvider.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
 }
class _HomeState extends State<Home> {

  @override
  void initState(){
    _pageController = new PageController();
    super.initState();
  }

  @override
  void dispose()
  {
    _pageController.dispose();
    super.dispose();
  }
  final MediaProvider movieProvider = new MovieProvider();
  final MediaProvider showProvider = new ShowProvider();
  PageController _pageController;
  int _page = 0;
  MediaType mediaType =MediaType.movie;
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
         selected: mediaType ==MediaType.movie,
          trailing: new Icon(Icons.local_movies),
          onTap: () {
             _changeMediaType(MediaType.movie);
             Navigator.of(context).pop();
          },
       ),
       new Divider(
         height: 5.0,
       ),
       new ListTile(
         title: new Text("Televisión"),
          selected: mediaType ==MediaType.show,
          trailing: new Icon(Icons.live_tv),
            onTap: () {
             _changeMediaType(MediaType.show);
             Navigator.of(context).pop();
          },
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
      children: _getMediaList(),
      controller: _pageController,
      onPageChanged: (int index){
        setState(() {
          _page = index; 
        });
      },
    ),
     bottomNavigationBar: new BottomNavigationBar(
       items: _getFooterItems(),
       onTap: _navigationTapped,
       currentIndex: _page,
     ),
   );
  }
   List<BottomNavigationBarItem> _getFooterItems(){
     return mediaType ==MediaType.show ?
     [
       new BottomNavigationBarItem(
         icon: new Icon(Icons.thumb_up), title:  new Text("Populares")
       ),
       new BottomNavigationBarItem(
         icon: new Icon(Icons.update), title:  new Text("En el aire")
       ),
       new BottomNavigationBarItem(
         icon: new Icon(Icons.star), title:  new Text("Mejor valoradas")
       )
       
     ] :
     [
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

   void _changeMediaType(MediaType type){
     if(mediaType !=  type ){
       setState(() {
        mediaType =type; 
       });
     }
   }

   List<Widget> _getMediaList(){
     return (mediaType == MediaType.movie) ?
     <Widget>[
       new MediaList(movieProvider, "popular"),
       new MediaList(movieProvider, "upcoming"),
      new MediaList(movieProvider, "top_rated"),
     ]:
     <Widget>[
       new MediaList(showProvider, "popular"),
       new MediaList(showProvider, "on_the_air"),
       new MediaList(showProvider, "top_rated"),
     ];
   }

   void _navigationTapped(int page){
     _pageController.animateToPage(page, duration: const Duration(microseconds: 300), curve: Curves.ease);
   }
 
}

