import 'package:flutter/material.dart';
import 'package:movie_app/model/Media.dart';
class MediaListItem extends StatelessWidget {
  final Media media;
 MediaListItem(this.media);
 @override
 Widget build(BuildContext context) {
  return new Card(
   child: new Column(
     children: <Widget>[
       new FadeInImage.assetNetwork(
         placeholder: "assets/placeholder.jpg",
         image: media.getBackDropUrl(),
         fit: BoxFit.cover,
         width: double.infinity,
         height: 200.0,
         fadeInDuration: new Duration(milliseconds: 40),
       )
     ],
   ),
  );
 }
}