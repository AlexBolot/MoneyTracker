import 'package:flutter/material.dart';
import 'package:money_tracker/model/entry.dart';
import 'package:money_tracker/model/day_entry.dart';
import 'package:money_tracker/model/wallet.dart';
import 'package:money_tracker/services/wallet_service.dart';
import 'package:money_tracker/widgets/add_entry_dialogue.dart';
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
    isSecondary = widget.wallet.isSecondaryCurrency;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    entries = widget.wallet.dayEntries;

    return Stack(
      alignment: Alignment(1, 1),
      children: <Widget>[
        Container(
          child: ListView(children: buildItems()),
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: FloatingActionButton(
            tooltip: "Ajouter un mouvement",
            child: Icon(Icons.add, size: 32),
            onPressed: () async {
              Entry res = await showDialog(context: context, builder: (context) => AddEntryDialogue());

              if(res == null) return;

              widget.wallet.addEntry(res);
              WalletService.saveWallets();
              setState(() {});
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

    items.add(Container(height: 110));

    return items;
  }

  Widget balanceCard() {
    return Card(
      elevation: 8,
      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: Solde()),
      ),
    );
  }

  List<Widget> Solde() {
    List<Widget> items = [];

    if (widget.wallet.hasBalance) {
      items.add(MoneyText(
          text: 'Solde',
          amount: widget.wallet.balance,
          isSecondary: isSecondary,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: widget.wallet.balance.isNegative ? Colors.red : Colors.green,
          )));
      items.add(Divider());
    }

    items.add(MoneyText(
      text: 'Dépense moyenne',
      amount: widget.wallet.averageSpending(),
      isSecondary: isSecondary,
      style: TextStyle(fontSize: 18),
    ));

/*    items.add(MoneyText(
      text: 'Dépense totale',
      amount: widget.wallet.totalSpent,
      isSecondary: isSecondary,
      style: TextStyle(
          fontSize: 18),
    ));
*/
    return items;
  }
}
