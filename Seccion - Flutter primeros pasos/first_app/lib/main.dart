import 'package:flutter/material.dart';

void main(){
  var app = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Mi primera aplicación"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Hello World",
            style: TextStyle(fontSize: 20.0),
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () { print('click');},
        ),
    )
  );

    runApp(app);
}