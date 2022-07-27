import 'package:bytebank/shared/model/transfer_model.dart';
import 'package:flutter/material.dart';

class TransferWidget extends StatelessWidget {
  final Transfer transfer;

  const TransferWidget({
    Key? key,
    required this.transfer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Card(
        child: ListTile(
          leading: const SizedBox(
            height: 40,
            child: Icon(Icons.monetization_on),
          ),
          title: Text('${transfer.value}'),
          subtitle: Text('${transfer.account}'),
        ),
      ),
    );
  }
}
