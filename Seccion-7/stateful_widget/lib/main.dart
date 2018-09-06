import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
   home: MyButton(),
  ));
}

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => new _MyButtonState();
 }


class _MyButtonState extends State<MyButton> {
  String flutterText = "";
  int index = 0;
  List<String> collections = ['Flutter', 'es', 'genial'];

   void onPressButton() {
     setState(() {
          flutterText = collections[index];
          index = index < 2 ? index + 1 : 0;
          });
   }

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Stateful Widget"),
       backgroundColor: Colors.orangeAccent,
     ),
     body: new Container(
       child: new Center(
       child: new Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           new Text(flutterText, style: new TextStyle(fontSize: 40.0)),
           new Padding(padding: new EdgeInsets.all(10.0)),
           new RaisedButton(
             child: new Text("Actualizar", style: new TextStyle(color: Colors.white),),
             color: Colors.blueAccent,
             onPressed: onPressButton,
                        )
                      ],
                    )
                  )
                )  
                );
               }
}