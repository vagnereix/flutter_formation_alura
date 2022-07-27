import 'package:bytebank/screens/TransferForm/transfer_form_page.dart';
import 'package:bytebank/shared/model/transfer_model.dart';
import 'package:bytebank/shared/widget/Transfer/transfer_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transfer> _transfers = [];

  void _addTransfer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TransferFormPage();
        },
      ),
    ).then(
      (response) {
        if (response != null) {
          setState(() {
            _transfers.add(response);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: Container(
        color: Colors.green[200],
        child: ListView.builder(
          itemCount: _transfers.length,
          itemBuilder: (context, index) {
            final actualTransfer = _transfers[index];
            return TransferWidget(
              transfer: actualTransfer,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTransfer,
        tooltip: 'Adicionar Transferência',
        child: const Icon(Icons.add),
      ),
    );
  }
}
