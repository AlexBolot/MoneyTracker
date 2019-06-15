import 'package:flutter/material.dart';

class Entry {
  String name;
  double amount;
  int factor;
  DateTime dateTime;

  bool get isSpending => factor < 0;

  bool get isIncome => factor > 0;

  Entry({@required this.name, @required this.amount, this.dateTime, bool isIncome = false}) {
    this.factor = isIncome ? 1 : -1;
    this.dateTime ??= DateTime.now();
  }

  @override
  String toString() {
    return 'Entry{name: $name, amount: $amount}';
  }

}
