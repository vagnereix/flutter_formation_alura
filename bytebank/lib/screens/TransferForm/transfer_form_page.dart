import 'package:bytebank/screens/TransferForm/transfer_form_controller.dart';
import 'package:bytebank/shared/widget/TextInput/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class TransferFormPage extends StatelessWidget {
  final _valueInputController = MoneyMaskedTextController(
      leftSymbol: "R\$ ", decimalSeparator: ',', thousandSeparator: '.');
  final _accountInputController = MaskedTextController(mask: '0000-0');

  TransferFormPage({Key? key}) : super(key: key);

  final controller = TransferFormController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de transferência'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextInputWidget(
                  label: 'Valor',
                  hint: 'R\$ 0,00',
                  icon: Icons.monetization_on,
                  controller: _valueInputController,
                  onChanged: (value) {
                    controller.onChange(value: value);
                  },
                  validator: (value) {
                    return value == 'R\$ 0,00'
                        ? controller.validateValue('')
                        : controller.validateValue(value);
                  },
                ),
                TextInputWidget(
                  label: 'Conta',
                  hint: '0000-0',
                  icon: Icons.account_balance_rounded,
                  controller: _accountInputController,
                  onChanged: (account) {
                    controller.onChange(account: account);
                  },
                  validator: controller.validateAccount,
                ),
                ElevatedButton(
                  onPressed: () {
                    final transfer = controller.registerTransfer();
                    Navigator.pop(context, transfer);
                  },
                  child: const Text('Registrar transferência'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
