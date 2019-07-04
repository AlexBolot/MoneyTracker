import 'package:flutter/material.dart';

class Entry {
  String name;
  double amount = 0;
  DateTime dateTime;
  bool isIncome = true;

  int get factor => isIncome ? 1 : -1;

  bool get isSpending => !isIncome;

  Entry({@required this.name, @required this.amount, this.isIncome = false, DateTime dateTime}) {
    this.dateTime = dateTime ?? DateTime.now();
  }

  Entry.fromMap(Map map) {
    name = map['name'];
    amount = map['amount'];
    isIncome = map['isIncome'] ?? map['factor']==1;
    dateTime = DateTime.parse(map['dateTime']);
  }

  Map toMap() {
    return {
      'name': name,
      'amount': amount,
      'isIncome': isIncome,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Entry{name: $name, amount: $amount}';
  }
}
