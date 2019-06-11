import 'package:flutter/material.dart';
import 'package:money_tracker/model/day_entry.dart';

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
  }

  double get balance {
    return dayEntries.map((entry) => entry.totalIncome - entry.totalSpent).reduce((a, b) => a + b);
  }
}
