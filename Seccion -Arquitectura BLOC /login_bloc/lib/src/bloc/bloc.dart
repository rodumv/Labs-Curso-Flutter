import 'dart:async';
import 'package:login_bloc/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators{
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  Stream<String> get email => _emailController.stream.transform(validaEmail);
  Stream<String> get password => _passwordController.stream.transform(validaPassword);
  
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose(){
    _emailController.close();
    _passwordController.close();
  }

}
