import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/mixins/validation_mixins.dart';
import 'package:flutterchat_app/src/services/authentication.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_error_message.dart';
import 'package:flutterchat_app/src/widgets/app_icon.dart';
import 'package:flutterchat_app/src/widgets/app_textfield.dart';
class RegistrationScreen extends StatefulWidget {
 static const String routerName = '/registration';
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> with ValidationMixins {
  FocusNode _focusNode;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _errorMessage ="";
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
      key:_formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppIcon(),
            SizedBox(height: 48.0,),
            _emailField(),
             SizedBox(height: 8.0,),
            _passwordField(),
             SizedBox(height: 24.0,),
            _showErrorMessage(),
           _submitButton()

          ],
        )
       )
      )
    );
  }
  Widget _emailField(){
    return  AppTextField(inputText: "Ingresar email",
            focusNode: _focusNode,
            autoValidate: _autoValidate,
            validator: validateEmail,
            controller: _emailController,
            onSaved: (value) {});
  }
  Widget _passwordField(){
    return AppTextField(
            autoValidate: _autoValidate,
            controller: _passwordController,
            inputText: "Ingresar contraseña",
            validator: validatePassword,
            obscureText: true,
            onSaved: (value) { },);
  }
  Widget _submitButton(){
    return  AppButton(
              color: Colors.blueAccent,
              onPressed: () async {
                if(_formKey.currentState.validate()){
                  var auth = await Authentication().createUser(email: _emailController.text, password: _passwordController.text);
                  if(auth.success){
                    Navigator.pushNamed(context, '/chat');
                    _emailController.text = "";
                    _passwordController.text = "";
                    FocusScope.of(context).requestFocus(_focusNode);
                }else{
                  setState(() {
                    _errorMessage = auth.errorMessage;
                  });
                }
               }else{
                  setState(() => _autoValidate = true);
               }
              },
              name: "Registrarse",
            );
  }

    Widget _showErrorMessage(){
    if(_errorMessage.length > 0 && _errorMessage != null){
      return ErrorMessage(errorMessage: _errorMessage);
    }else{
      return Container(
          height: 0.0,
        );
    }
  }

}