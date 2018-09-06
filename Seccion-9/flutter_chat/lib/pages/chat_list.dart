import 'package:flutter/material.dart';
import 'package:flutter_chat/models/chat_model.dart';
import 'package:flutter_chat/pages/chat_screen.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => new _ChatListState();
 }
class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
   return new ListView.builder(
     itemCount: messageData.length,
     itemBuilder: (context, i) => new Column(
       children: <Widget>[
         new Divider(
           height: 10.0,
         ),
         new ListTile(
           leading: new CircleAvatar(
             backgroundImage: NetworkImage(messageData[i].imageUrl),
             ),
           title: new Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
             new Text(
              messageData[i].name,
              style: new TextStyle(fontWeight: FontWeight.bold),
             ),
             new Text(
               messageData[i].time,
               style: new TextStyle(color: Colors.grey, fontSize: 14.0),
             )
           ], 
         ),
         subtitle: new Container(
           padding: const EdgeInsets.only(top: 5.0),
           child: new Text(
             messageData[i].message,
             style: new TextStyle(color: Colors.grey, fontSize: 15.0),
           ),
         ),
         onTap: (){
           var route = new MaterialPageRoute(
             builder: (BuildContext context) => new ChatScreen(name: messageData[i].name,)
           );
           Navigator.of(context).push(route);
         },
     ),
    ]
   )
   );
  }
}