import 'package:bytebank_contacts/widgets/DashboardOption/dasboard_option_widget.dart';
import 'package:flutter/material.dart';

class Dasboard extends StatefulWidget {
  const Dasboard({Key? key}) : super(key: key);

  @override
  State<Dasboard> createState() => _DasboardState();
}

class _DasboardState extends State<Dasboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dasboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset('assets/images/bytebank_logo.png'),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DashboardOption(
                  icon: Icons.people,
                  label: 'Contacts',
                  onClick: () {
                    Navigator.of(context).pushNamed('/contacts_list');
                  },
                ),
                DashboardOption(
                  icon: Icons.monetization_on,
                  label: 'Transactions',
                  onClick: () {
                    Navigator.of(context).pushNamed('/transactions_list');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
