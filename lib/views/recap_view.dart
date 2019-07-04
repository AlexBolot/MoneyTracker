import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/money_text.dart';
import 'package:money_tracker/services/wallet_service.dart';

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
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: Recap(),
          ),
        ),
      ),
    );
  }
}

List<Widget> Recap() {
  List<Widget> items = [];
  //double totalSpend = trip.wallets.map((wallet) => wallet.totalSpent).reduce(sum);

  items.add(Container(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Text(
      trip.name,
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    ),
  ));

  items.add(Divider());

  items.add(Container(
    padding: EdgeInsets.symmetric(horizontal: 28),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Dépense sur '+trip.nbDays.toString() + ' jours.', style: TextStyle(fontSize: 18)),
        MoneyText(
          amount: trip.totalSpent,
          isSecondary: false,
          style: TextStyle(fontSize: 18),
        ),
      ],
    ),
  ));

  items.add(Divider());

  items.add(Container(
    padding: EdgeInsets.symmetric(horizontal: 28),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Dépense moyenne', style: TextStyle(fontSize: 18)),
        MoneyText(
          amount: trip.averageSpending(),
          isSecondary: false,
          style: TextStyle(fontSize: 18),
        ),
      ],
    ),
  ));

  return items;
}
