import 'package:flutter/material.dart';
import 'package:money_tracker/main.dart';
import 'package:money_tracker/model/day_entry.dart';
import 'package:money_tracker/model/static_currency.dart';
import 'package:money_tracker/model/entry.dart';
import 'package:intl/intl.dart';

class DayCard extends StatefulWidget {
  final DayEntry dayEntry;
  final bool isSecondary;

  const DayCard({this.dayEntry, this.isSecondary});

  @override
  _DayCardState createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  DateTime dateTime;
  List<Entry> entryList;

  @override
  void initState() {
    super.initState();

    dateTime = widget.dayEntry.dateTime;
    entryList = widget.dayEntry.entries;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: entries(),
        ),
      ),
    );
  }

  List<Widget> entries() {
    List<Widget> items = [];

    items.add(Text(
      toFirstUpper(DateFormat("EEEEE dd/MM", "fr").format(dateTime)),
      style: TextStyle(fontSize: 20, color: Colors.grey),
    ));

    items.add(Divider());

    for (Entry entry in entryList) {
      items.add(
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(entry.name, style: TextStyle(fontSize: 18.0)),
              Text(
                StaticCurrency.format(amount: entry.amount, isSecondary: widget.isSecondary),
                style: TextStyle(fontSize: 18.0, color: entry.isSpending ? Colors.red : Colors.green),
              ),
            ],
          ),
        ),
      );
    }

    items.add(Divider());

    items.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("Solde 283€", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        Text(
          "Dépenses ${StaticCurrency.format(amount: widget.dayEntry.totalSpent, isSecondary: widget.isSecondary)}",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ));

    return items;
  }
}
