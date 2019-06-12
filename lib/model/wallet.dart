import 'package:flutter/material.dart';
import 'package:money_tracker/model/day_entry.dart';
import 'package:money_tracker/model/entry.dart';
import 'package:money_tracker/main.dart';

class Wallet {
  String name;
  DateTime start;
  bool hasBalance;
  bool isSecondaryCurrency;
  List<DayEntry> dayEntries;
  IconData iconData;

  Wallet(
      {@required this.name,
      @required this.start,
      this.hasBalance = false,
        this.isSecondaryCurrency = false,
      this.dayEntries,
      this.iconData}) {
    this.dayEntries ??= [];
    this.dayEntries.sort();
  }

  double get balance {
    return dayEntries.map((entry) => entry.totalIncome - entry.totalSpent).reduce(sum);
  }

  void addEntry(Entry entry) {
    if (dayEntries.first.isToday)
      dayEntries.first.entries.add(entry);
    else
      dayEntries.insert(0, DayEntry(dateTime: DateTime.now(), entries: [entry]));
  }

  double averageSpending() {
    double total = dayEntries.map((entry) => entry.totalSpent).reduce(sum);
    return total / dayEntries.length;
  }
}
