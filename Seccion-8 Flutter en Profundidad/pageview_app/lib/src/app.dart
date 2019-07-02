import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: <Widget>[
          Container(
            color: Colors.pink
          ),
          Container(
            color: Colors.cyan
          ),
          Container(
            color: Colors.deepPurple
          )
        ],
        pageSnapping: false,
      ),
    );
  }
}