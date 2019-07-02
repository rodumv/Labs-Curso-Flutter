import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  MyDialog({Key key}) : super(key: key);

  _MyDialogState createState() => _MyDialogState();
}
  enum DialogAction{
    yes, 
    no
  }
class _MyDialogState extends State<MyDialog> {
  String inputValue = "";
  void alertResult(DialogAction action){
    print("Tu selección es $action");
  }
  void showAlert(String value){
    AlertDialog dialog = AlertDialog(
      content: Text(value),
      actions: <Widget>[
        FlatButton(
          child: Text("Si"),
          onPressed: () {alertResult(DialogAction.yes);}),
        FlatButton(
          child: Text("No"),
          onPressed: () {alertResult(DialogAction.no);},),
          
      ],
    );

    showDialog(context: context, builder:  (BuildContext context) { return dialog; });
  }

  void onChanged(String value){
    setState(() {
      inputValue = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Demo Alert Dialog"),
       ),
       body: Container(
         child: Column(
           children: <Widget>[
             TextField(
               decoration: InputDecoration(hintText: "Ingrese el texto"),
               onChanged: onChanged,
             ),
             RaisedButton(
               child: Text("Ver Alerta"),
               onPressed: () { showAlert(inputValue); })
           ]
          )
       ),
    );
  }
}