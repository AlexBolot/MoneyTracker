import 'package:flutter/material.dart';
import 'package:money_tracker/model/day_entry.dart';

class Wallet {
  String currency;
  String name;
  DateTime start;
  bool hasBalance;
  List<DayEntry> dayEntries;

  Wallet({@required this.name, @required this.start, this.currency, this.hasBalance = false, this.dayEntries}) {
    this.dayEntries ??= [];
  }
}
