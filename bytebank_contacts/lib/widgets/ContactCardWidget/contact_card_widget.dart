import 'package:bytebank_contacts/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactCardWidget extends StatelessWidget {
  final Contact contact;

  const ContactCardWidget({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.accountNumber.toString()),
      ),
    );
  }
}
