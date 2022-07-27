import 'package:bytebank_contacts/database/dao/contact_dao.dart';
import 'package:flutter/material.dart';

import '../../models/contact_model.dart';
import '../../widgets/ContactCardWidget/contact_card_widget.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        future: _dao.findAll(),
        initialData: const [],
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data as List<Contact>;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return ContactCardWidget(contact: contact);
                  },
                ),
              );
            default:
              return const Center(
                child: Text('Unknown error'),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/contacts_form').then(
            (_) {
              // Refresh the list after the contact is created.
              setState(() {});
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
