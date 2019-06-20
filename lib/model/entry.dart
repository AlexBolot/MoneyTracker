import 'package:flutter/material.dart';

class Entry {
  String name;

  double _amount = 0;
  int factor = 1;
  DateTime dateTime;
  bool _isIncome = true;

  set amount(double entryAmount)
  {
    _amount = entryAmount;
  }
  double get amount => _amount;

  set isIncome ( bool entryIsIncome)
  {
    if (_isIncome!=entryIsIncome) factor = -factor;
  }
  bool get isIncome => factor > 0;

  bool get isSpending => !isIncome;

  Entry({@required this.name, @required double amount, bool isIncome = false}) {
    _amount = amount;
    _isIncome = isIncome;
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
