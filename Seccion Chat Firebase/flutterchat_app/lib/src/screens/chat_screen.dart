import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/services/authentication.dart';
import 'package:flutterchat_app/src/services/message_service.dart';

class ChatScreen extends StatefulWidget {
  static const String routerName = '/chat';

  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
   final auth = FirebaseAuth.instance;
   FirebaseUser loggedInUser;
   TextEditingController _messageController = TextEditingController();
  InputDecoration _messageTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: 'Ingresar su mensaje aquí....',
    border: InputBorder.none
  );  

  BoxDecoration _messageContainerDecoration = BoxDecoration(
    border: Border(
      top: BorderSide(color: Colors.lightBlueAccent,width: 2.0)
    )
  ); 

  TextStyle _sendButtonStyle = TextStyle(
    color: Colors.lightBlueAccent,
    fontWeight: FontWeight.bold,
    fontSize: 18.0
  );

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    _getMessages();
  }
  void getCurrentUser() async{
      var user = await Authentication().getCurrentUser();
      if(user != null){
        loggedInUser  = user;
        print(loggedInUser.email);
      }
  }


  void _getMessages() async {
   await for(var snapshot in MessageService().getMessageStream()){
      for(var message in snapshot.documents){
        print(message.data);
      }
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Chat Screen"),
         actions: <Widget>[
           IconButton(
             icon: Icon(Icons.power_settings_new),
             onPressed: (){
               Authentication().singOut();
               Navigator.pop(context);
             },
           )
         ],
       ),
       body: SafeArea(
         child: Column(
           children: <Widget>[
             StreamBuilder(
               stream: MessageService().getMessageStream(),
               builder: (context, snapshot){
                 if(snapshot.hasData){
                  return Flexible(
                    child: ListView(
                    children: _getChatItems(snapshot.data.documents),
                  )
                  )
                  ;
                 }

               }
             ),
             Container(
             decoration: _messageContainerDecoration,
             child:  Row(
             children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: _messageTextFieldDecoration,
                    controller: _messageController, 
                  ),
                ),
                FlatButton(
                  child: Text("Enviar", style: _sendButtonStyle),
                  onPressed: () {
                    MessageService().save(collectionName: "messages", collectionValues : {
                        'value':  _messageController.text,
                        'sender': loggedInUser.email
                    });
                    _messageController.clear();
                   
                  },
                )
             ]
             )
             ) 
           ],
         ),
       ),
    );
  }

  List<ChatItem> _getChatItems(dynamic messages){
    List<ChatItem> chatItems = [];
      for(var message in messages){
        final messageValue = message.data["value"];
        final messageSender = message.data["sender"];
        chatItems.add(ChatItem(message: messageValue, sender: messageSender, isLoggedInUser: messageSender == loggedInUser.email,));
      }
      return chatItems;
  }
}

class ChatItem extends StatelessWidget {
  final String sender;
  final String message;
  final bool isLoggedInUser;
  ChatItem({this.sender, this.message, this.isLoggedInUser});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(sender, style: TextStyle(fontSize: 15.0, color: Colors.black54),),
          Material(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0)
          ),
          elevation: 5.0,
          color: isLoggedInUser ?  Colors.lightBlueAccent : Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
           child: Text(message, style: TextStyle(fontSize: 16, color: isLoggedInUser ? Colors.white : Colors.black45),)
           )
          )
        ],

      ),
    );
  }
}