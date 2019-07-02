import 'package:flutter/material.dart';
import 'package:listview_app/src/model/contact_model.dart';
import 'package:listview_app/src/screens/contact_item.dart';

class Contact extends StatelessWidget {

  buildList(){
    return <ContactModel>[
      ContactModel(name: "Rodrigo Morales", email: "rodrigom@gmail.com"),
      ContactModel(
          name: 'Martin Fowler', email: 'martin.fowler@flutter.com'),
      ContactModel(
          name: 'Linux tolvar', email: 'linux.tolvar@flutter.com'),
      ContactModel(
          name: 'Steve Wozniak', email: 'steve.wosniak@flutter.com'),
      ContactModel(
          name: 'Robert martin', email: 'robert.martin@flutter.com'),
      ContactModel(
          name: 'Dennis Ritchie', email: 'dennis.ritchie@flutter.com'),
      ContactModel(
          name: 'Anders Hejlsberg', email: 'anders.hejlsberg@flutter.com'),
      ContactModel(
          name: 'Bill gates', email: 'bill.gates@flutter.com')
    ];
  }  

  List<ContactItem> buildContactList(){
    return buildList()
      .map<ContactItem>((contact) => ContactItem(contact: contact,))
      .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Contactos"),
       ),
       body: ListView( 
        children: buildContactList()
       ,),
    );
  }
}