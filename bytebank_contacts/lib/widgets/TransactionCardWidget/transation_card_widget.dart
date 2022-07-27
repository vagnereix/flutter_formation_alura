import 'package:flutter/material.dart';

import '../../models/transaction_model.dart';

class TransactionCardWidget extends StatelessWidget {
  final Transaction transaction;

  const TransactionCardWidget({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(transaction.contact.name),
        subtitle: Text(transaction.value.toString()),
      ),
    );
  }
}
