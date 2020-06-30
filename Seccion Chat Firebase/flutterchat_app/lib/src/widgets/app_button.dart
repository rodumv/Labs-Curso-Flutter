import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final MaterialAccentColor color;
  final VoidCallback onPressed;
  final String name;
  const AppButton({this.color, this.onPressed, this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: SizedBox(
          height: 43.0,
          child: FlatButton(
          child: Text(name),
          onPressed: onPressed,
        )
      )
      ),
    );
  }
}