import 'package:flutter/material.dart';

class Entry {
  String name;
  double amount;
  int factor;
  DateTime dateTime;

  bool get isSpending => factor < 0;

  bool get isIncome => factor > 0;

  Entry({@required this.name, @required this.amount, this.dateTime, bool isSpending = true}) {
    this.factor = isSpending ? -1 : 1;
    this.dateTime ??= DateTime.now();
  }
}
