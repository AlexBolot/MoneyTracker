import 'package:flutter/material.dart';
import 'package:money_tracker/model/day_entry.dart';
import 'package:money_tracker/model/entry.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/widgets/crud_entry_dialogue.dart';
import 'package:money_tracker/widgets/money_text.dart';
import 'package:flutter_stash/flutter_stash.dart';
import 'package:money_tracker/services/wallet_service.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    dateTime = widget.dayEntry.dateTime;
    entryList = widget.dayEntry.entries;

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

    items.add(date());

    items.add(Divider());

    for (Entry entry in entryList) {
      items.add(entryLine(entry));
    }

    items.add(Divider());

    items.add(total());

    return items;
  }

  Widget date() {
    return Text(
      toFirstUpper(DateFormat("EEEEE dd/MM", "fr").format(dateTime)),
      style: TextStyle(fontSize: 20, color: Colors.grey),
    );
  }

  Widget entryLine(Entry entry) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () async {
              Entry res = await showDialog(context: context, builder: (context) => CrudEntryDialogue(entry: entry));

              if (res == null) return;

              if (res.name.isEmpty && res.amount == 0) {
                entryList.remove(entry);
              } else {
                entry.name = res.name;
                entry.amount = res.amount;
                entry.isIncome = res.isIncome;
              }
              WalletService.saveWallets();
              setState(() {});
            },
            child: Text(
              entry.name,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          MoneyText(
            amount: entry.amount,
            isSecondary: widget.isSecondary,
            style: TextStyle(fontSize: 18.0, color: entry.isSpending ? Colors.red : Colors.green),
          ),
        ],
      ),
    );
  }

  Widget total() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        MoneyText(
          text: 'Dépenses',
          amount: widget.dayEntry.totalSpent,
          isSecondary: widget.isSecondary,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
