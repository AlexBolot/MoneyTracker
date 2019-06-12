import 'package:flutter/material.dart';
import 'package:money_tracker/main.dart';
import 'package:money_tracker/model/static_currency.dart';
import 'package:money_tracker/model/day_entry.dart';
import 'package:money_tracker/model/wallet.dart';
import 'package:money_tracker/widgets/day_card.dart';
import 'package:money_tracker/widgets/money_text.dart';

class WalletView extends StatefulWidget {
  static const String routeName = "/WalletView";

  final Wallet wallet;

  const WalletView({this.wallet});

  @override
  _WalletViewState createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  List<DayEntry> entries;
  bool isSecondary;

  @override
  void initState() {
    entries = widget.wallet.dayEntries;
    isSecondary = widget.wallet.isSecondaryCurrency;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(1, 1),
      children: <Widget>[
        Container(
          child: ListView(
            children: buildItems(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: FloatingActionButton(
            tooltip: "Ajouter un mouvement",
            child: Icon(Icons.add, size: 32),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Intitulé',
                                border: OutlineInputBorder(),
                                hintText: 'exemple : "cinéma"',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Montant',
                                border: OutlineInputBorder(),
                                hintText: 'exemple : "3.25"',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              child: Text('save'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  List<Widget> buildItems() {
    List<Widget> items = [];

    items.add(balanceCard());

    for (DayEntry dayEntry in entries) {
      items.add(DayCard(
        dayEntry: dayEntry,
        isSecondary: isSecondary,
      ));
    }

    return items;
  }

  Widget balanceCard() {
    double balance = widget.wallet.balance;

    return Card(
      elevation: 8,
      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MoneyText(
              text: 'Solde',
              amount: balance,
              isSecondary: isSecondary,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: balance.isNegative ? Colors.red : Colors.green,
              ),
            ),
            Container(width: 100, child: Divider(color: Colors.grey[700])),
            MoneyText(
              text: 'Dépense moyenne',
              amount: widget.wallet.averageSpending(),
              isSecondary: isSecondary,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
