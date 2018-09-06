import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
   home: MyStepper(),
  ));
}


class MyStepper extends StatefulWidget {

  @override
  _MyStepperState createState() => new _MyStepperState();
 }
class _MyStepperState extends State<MyStepper> {
  int _currentStep = 0;

  List<Step> mySteps = [
   new Step(
     title: new Text("Paso 1"),
     content: new Text("Aprender Flutter")
   ),
   new Step(
     title: new Text("Paso 2"),
     content: new Text("Desarrollar App")
   ),
   new Step(
     title: new Text("Paso 3"),
     content: new Text("Publicar App")
   )
  ];

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Demo Stepper"),
     ),
     body: new Container(
       child: new Stepper(
         // Nos Indica cual es el paso actual del stepper
         currentStep: this._currentStep,
         steps: mySteps,
         type: StepperType.vertical,
         onStepCancel: () {
           setState(() {
             if(_currentStep > 0){
             _currentStep = _currentStep -1;           
             }else{
               _currentStep = 0;
             }
            });
            print("Mi Paso actual es " + _currentStep.toString());

         },
         onStepTapped: (step) {
           setState(() {
                     _currentStep = step;   
                      });
              print("Mi Paso actual es " + _currentStep.toString());
         },
         onStepContinue: ()
         {
          setState(() {
            if(_currentStep < mySteps.length -1)
            {
              _currentStep = _currentStep + 1;
            }else{
              _currentStep = 0;
            }              
          });
             print("Mi Paso actual es " + _currentStep.toString());

         },
     ),
     )
  
   );
  }
}