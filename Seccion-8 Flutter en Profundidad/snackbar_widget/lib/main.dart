import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
   home: MySnackBar(),
  ));
}

class MySnackBar extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
      title: new Text("SnackBar Demo"),
    ),
    body: new Center(
      child: new MyButton(),
    ),
 );
 }
}

class MyButton extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return new RaisedButton(
    child: new Text("Desplegar Snackbar"),
    onPressed: () {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("Hola soy un snackbar :)"),
        duration: new Duration(seconds: 5),
        action: new SnackBarAction(
          label: "Click Aqui",
          onPressed: (){
            Scaffold.of(context).showSnackBar(
              new SnackBar(
                content: new Text("Hola,  nuevamente :)"),
              ) 
            );
          },
        ),
      ));
    },
  );
 }
}