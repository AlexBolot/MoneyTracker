import 'package:flutter/material.dart';

class Entry {
  String name;
  double amount;
  int factor;
  DateTime dateTime;

  bool get isSpending => factor < 0;

  bool get isIncome => factor > 0;

  Entry({@required this.name, @required this.amount, bool isIncome = false}) {
    this.factor = isIncome ? 1 : -1;
    this.dateTime = DateTime.now();
  }

  Entry.fromMap(Map map) {
    name = map['name'];
    amount = map['amount'];
    factor = map['factor'];
    dateTime = DateTime.parse(map['dateTime']);
  }

  Map toMap() {
    return {
      'name': name,
      'amount': amount,
      'factor': factor,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Entry{name: $name, amount: $amount}';
  }
}
