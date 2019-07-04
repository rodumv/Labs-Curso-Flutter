import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:login_bloc/src/bloc/bloc.dart';
class App extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Provider<Bloc>(
    builder: (context) => Bloc(),
    dispose: (context, bloc) => bloc.dispose(),
    child: MaterialApp(
      home: Scaffold(
        body: LoginScreen()
      ),
    ),
  ); 
 }
}