import 'package:bytebank/screens/Home/home_page.dart';
import 'package:bytebank/screens/TransferForm/transfer_form_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/form_transfer': (context) => TransferFormPage(),
      },
    );
  }
}
