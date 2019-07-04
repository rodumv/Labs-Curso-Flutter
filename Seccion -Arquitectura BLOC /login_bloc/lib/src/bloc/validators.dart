import 'dart:async';

class Validators{
    final validaEmail = 
      StreamTransformer<String, String>
      .fromHandlers(
        handleData: (email, sink){
             print('transform');
            print(email);
          if(email.contains('@')){
          print(email);
            sink.add(email);
          }else{
            sink.addError('Email invalido');
          }});

    final validaPassword = 
      StreamTransformer<String, String>
      .fromHandlers(
        handleData: (password, sink){
          if(password.length > 5){
            sink.add(password);
          }else{
            sink.addError('Contraseña invalida');
          }});
}