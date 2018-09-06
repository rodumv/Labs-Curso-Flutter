import 'package:flutter/material.dart';
import 'package:listview_widget/model/ContactModel.dart';
import 'package:listview_widget/pages/contactList.dart';

class Contact extends StatelessWidget {
 _buildList(){
   return <ContactModel>
   [
     const ContactModel(name: "Rodrigo Morales", email: "rodrigo.morales@flutter.com"),
     const ContactModel(
          name: 'Martin Fowler', email: 'martin.fowler@flutter.com'),
      const ContactModel(
          name: 'Linux tolvar', email: 'linux.tolvar@flutter.com'),
      const ContactModel(
          name: 'Steve Wozniak', email: 'steve.wosniak@flutter.com'),
      const ContactModel(
          name: 'Robert martin', email: 'robert.martin@flutter.com'),
      const ContactModel(
          name: 'Dennis Ritchie', email: 'dennis.ritchie@flutter.com'),
      const ContactModel(
          name: 'Anders Hejlsberg', email: 'anders.hejlsberg@flutter.com'),
      const ContactModel(
          name: 'Bill gates', email: 'bill.gates@flutter.com')
   ];
 }
 
 @override
 Widget build(BuildContext context) {
  return new Scaffold(
    body: new ContactList(_buildList())
  
 );
 }
}