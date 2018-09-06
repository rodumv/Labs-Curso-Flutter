import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const String routeName = "/configuracion";
 @override
 Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
      title: new Text("Configuración")
    ),
    body: new Container(
      child: new Center(
        child: new Text("Pantalla Configuración")
      )
    ),
    
 );
 }
}