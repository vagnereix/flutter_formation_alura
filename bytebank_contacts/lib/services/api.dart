import 'dart:convert';

import 'package:bytebank_contacts/configs.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../models/transaction_model.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Request: { ${data.url}, ${data.headers}, ${data.body} }');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Response: { ${data.url}, ${data.headers}, ${data.body} }');
    return data;
  }
}

Future<List<Transaction>> findAll() async {
  final Client http = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  final response = await http.get(Uri.parse('$baseURL/transactions'));
  final decodedTransactions = jsonDecode(response.body);
  final List<Transaction> transactions = [];

  for (final decodedTransaction in decodedTransactions) {
    final transaction = Transaction.fromMap(decodedTransaction);
    transactions.add(transaction);
  }

  // Another way to do the same thing
  // Iterable decodedTransactions = json.decode(response.body);
  // List<Transaction> transactions = List<Transaction>.from(
  //   decodedTransactions.map(
  //     (model) => Transaction.fromJson(model),
  //   ),
  // );

  return transactions;
}
