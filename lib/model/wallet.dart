import 'package:flutter/material.dart';
import 'package:money_tracker/model/day_entry.dart';

class Wallet {
  String name;
  DateTime start;
  bool hasBalance;
  bool isInSecondaryCurrency;
  List<DayEntry> dayEntries;
  IconData iconData;

  Wallet(
      {@required this.name,
      @required this.start,
      this.hasBalance = false,
      this.isInSecondaryCurrency = false,
      this.dayEntries,
      this.iconData}) {
    this.dayEntries ??= [];
  }
}
