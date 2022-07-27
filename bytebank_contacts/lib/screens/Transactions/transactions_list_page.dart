import 'package:flutter/material.dart';

import '../../models/transaction_model.dart';
import '../../services/api.dart';
import '../../widgets/TransactionCardWidget/transation_card_widget.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: findAll().timeout(const Duration(seconds: 5)),
        initialData: const [],
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Transaction> transactions =
                    snapshot.data as List<Transaction>;

                if (transactions.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final Transaction transaction = transactions[index];
                        return TransactionCardWidget(transaction: transaction);
                      },
                    ),
                  );
                }
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.security_update_warning_rounded,
                      size: 52,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'No transactions found',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
