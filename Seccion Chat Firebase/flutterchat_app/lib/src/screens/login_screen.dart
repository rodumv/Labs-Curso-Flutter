import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/mixins/validation_mixins.dart';
import 'package:flutterchat_app/src/services/authentication.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_error_message.dart';
import 'package:flutterchat_app/src/widgets/app_icon.dart';
import 'package:flutterchat_app/src/widgets/app_textfield.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixins{
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _focusNode;
  bool showSpinner = false;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _errorMessage = "";
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }
  
  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

  }

  void setSpinnerStatus(bool status){
    setState(() {
      showSpinner = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD( 
      inAsyncCall: showSpinner,
      child: Form(
        key: _formkey,
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppIcon(),
            SizedBox(height: 48.0),
            _emailField(),
            SizedBox(height: 8.0),
            _passwordField(),
            SizedBox(height: 23.0),
            _showErrorMessage(),
            _submitButton()
          ],
        )
       ),
      )
    )
    );
  }

  Widget _emailField(){
    return  AppTextField(
              focusNode: _focusNode,
              autoValidate: _autoValidate,
              controller: _emailController,
              validator: validateEmail,
              inputText: "Ingresar email",
              onSaved: (value) { }, );
           
  }


  Widget _passwordField(){
    return AppTextField(
              controller: _passwordController,
              autoValidate: _autoValidate,
              inputText: "Ingresar contaseña",
              validator: validatePassword,
              obscureText: true,
              onSaved: (value) { },);
  }

  Widget _submitButton(){
    return AppButton(
              color: Colors.blueAccent,
              onPressed: () async {
                if(_formkey.currentState.validate()){
                  setSpinnerStatus(true);
                  var auth = await Authentication().loginUser(email: _emailController.text, password: _passwordController.text);
                  if(auth.success){
                    Navigator.pushNamed(context, '/chat');
                    FocusScope.of(context).requestFocus(_focusNode);
                    _emailController.text = "";
                    _passwordController.text = "";
                  }else{
                    setState(() {
                      _errorMessage = auth.errorMessage;
                    });
                  }
                  setSpinnerStatus(false);
                }else{
                  setState(() => _autoValidate = true);
                }
                
              },
              name: 'Log in',
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