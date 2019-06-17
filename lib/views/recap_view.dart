import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/money_text.dart';
import 'package:money_tracker/main.dart';
//import 'package:flutter_stash/flutter_stash.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "/HomeView";

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 8,
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: Recap()),
        ),
      ),
    );
  }
}

List<Widget> Recap() {
  List<Widget> items = [];
  //double totalSpend = trip.wallets.map((wallet) => wallet.totalSpent).reduce(sum);

  items.add(Text(trip.name,
      style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent)));
  items.add(Divider());
  items.add(MoneyText(
    text: 'Dépense totale',
    amount: trip.totalSpent,
    isSecondary: false,
    style: TextStyle(fontSize: 18),
  ));
  items.add(Divider());
  items.add(MoneyText(
    text: 'Dépense moyenne',
    amount: trip.averageSpending(),
    isSecondary: false,
    style: TextStyle(fontSize: 18),
  ));

  return items;
}
