import 'package:bytebank/shared/model/transfer_model.dart';
import 'package:flutter/material.dart';

class TransferFormController {
  final formKey = GlobalKey<FormState>();

  Transfer transfer = Transfer();

  // se for falso (vazio), o true fixo retorna a mensagem
  String? validateValue(String? value) =>
      value?.isEmpty ?? true ? "O valor não pode ser zero" : null;
  String? validateAccount(String? value) =>
      value?.isEmpty ?? true ? "A conta não pode ser vazia" : null;

  void onChange({
    String? value,
    String? account,
  }) {
    transfer = transfer.copyWith(
      value: value,
      account: account,
    );
  }

  Transfer? registerTransfer() {
    final form = formKey.currentState;

    if (form!.validate()) {
      return transfer;
    }

    return null;
  }
}
