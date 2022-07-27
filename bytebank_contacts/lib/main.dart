import 'package:bytebank_contacts/screens/Contacts/contacts_list_page.dart';
import 'package:bytebank_contacts/screens/ContactsForm/contacts_form_page.dart';
import 'package:bytebank_contacts/screens/Dasboard/dasboard_page.dart';
import 'package:bytebank_contacts/screens/Transactions/transactions_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bytebank contacts',
      theme: ThemeData(
        primaryColor: Colors.green[900],
        primarySwatch: Colors.green,
      ),
      home: const Dasboard(),
      routes: {
        '/dasboard': (context) => const Dasboard(),
        '/contacts_list': (context) => const ContactsList(),
        '/contacts_form': (context) => const ContactsForm(),
        '/transactions_list': (context) => const TransactionsList(),
        // '/transactions_form': (context) => const TransactionForm(),
      },
    );
  }
}
