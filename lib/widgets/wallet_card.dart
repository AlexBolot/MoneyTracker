import 'package:flutter/material.dart';
import 'package:money_tracker/main.dart';
import 'package:money_tracker/model/wallet.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/widgets/money_text.dart';

class WalletCard extends StatefulWidget {

  final Wallet wallet;

  const WalletCard({this.wallet});

  @override
  _WalletCardState createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  String name;
  DateTime start;
  bool hasBalance;
  bool isSecondaryCurrency;
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
            name),
      ),
    );
  }
}