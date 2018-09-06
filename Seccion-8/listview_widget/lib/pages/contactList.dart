import 'package:flutter/material.dart';
import 'package:listview_widget/model/ContactModel.dart';
import 'package:listview_widget/pages/contactItem.dart';

class ContactList extends StatelessWidget {
 final List<ContactModel> _contacts;
  ContactList(this._contacts);
  
 List<ContactItem> _buildContactList(){
   return _contacts
      .map((contact) => new ContactItem(contact))
      .toList();
 }  

 @override
 Widget build(BuildContext context) {
  return new ListView(
    children: _buildContactList(),
  );
 }

 
}