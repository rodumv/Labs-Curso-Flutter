import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/screens/chat_screen.dart';
import 'package:flutterchat_app/src/screens/login_screen.dart';
import 'package:flutterchat_app/src/screens/registration_screen.dart';
import 'package:flutterchat_app/src/screens/welcome_screen.dart';

void main(){
  runApp(
    MaterialApp(
      home: WelcomeScreen() ,
      theme: ThemeData(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black45)
        ),
      ),
      initialRoute: WelcomeScreen.routeName,
      routes: <String, WidgetBuilder>{
        LoginScreen.routeName: (BuildContext context) => LoginScreen(),
        WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
        RegistrationScreen.routerName: (BuildContext context) => RegistrationScreen(),
        ChatScreen.routerName: (BuildContext context) => ChatScreen(),
      }
    )
  );
}