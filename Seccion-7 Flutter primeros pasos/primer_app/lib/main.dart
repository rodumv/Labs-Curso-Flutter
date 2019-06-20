import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      title: "Mi Primera aplicación",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Mi Primera aplicación")
        ),
        body: new Container(
          child: new Center(
            child: new Text("Hello World")
          )          
        ),
      )
    )
  );
}