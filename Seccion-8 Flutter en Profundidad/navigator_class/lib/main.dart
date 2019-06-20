import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
   home: new First(),
  ));
}

class First extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
      title: new Text("Primera Pantalla Screen")
    ),
    body: new Center(
      child: new RaisedButton(
        child: new Text("Mostrar Pantalla"),
        onPressed: () {
          Navigator.push(
            context, 
            new MaterialPageRoute(builder: (context) => new Second())
          );

        },
      ) 
    ),
 );
 }
}

class Second extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
      title: new Text("Segunda Pantalla"),
    ),
    body: new Center(
      child: new RaisedButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: new Text("Ir Atras!"),
      ),
      
    ),
  
 );
 }
}