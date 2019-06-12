import 'package:flutter/material.dart';
import 'package:money_tracker/main.dart';
import 'package:money_tracker/model/static_currency.dart';
import 'package:money_tracker/model/day_entry.dart';
import 'package:money_tracker/model/wallet.dart';
import 'package:money_tracker/widgets/day_card.dart';

class WalletView extends StatefulWidget {
  static const String routeName = "/WalletView";

  final Wallet wallet;

  const WalletView({this.wallet});

  @override
  _WalletViewState createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  List<DayEntry> entries;

  @override
  void initState() {
    entries = widget.wallet.dayEntries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: buildItems()),
    );
  }

  List<Widget> buildItems() {
    List<Widget> items = [];

    bool isSecondary = widget.wallet.isSecondaryCurrency;
    double balance = widget.wallet.balance;

    items.add(
      Card(
        elevation: 8,
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Solde ${StaticCurrency.format(amount: balance, isSecondary: isSecondary)}',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: balance.isNegative ? Colors.red : Colors.green,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );

    items.addAll(entries.map((dayEntry) => DayCard(dayEntry: dayEntry, isSecondary: isSecondary)).toList());

    return items;
  }
}
