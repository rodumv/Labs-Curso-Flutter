import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const String routeName = "/configuracion";
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configuración"),),
      body: Container(
      child: Center(
        child: Text("Configuración"),
      ),
      ),
    );
  }
}