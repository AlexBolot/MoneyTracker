import 'package:flutter/material.dart';
import 'package:money_tracker/model/day_entry.dart';
import 'package:money_tracker/model/entry.dart';
import 'package:money_tracker/services/wallet_service.dart';
import 'package:flutter_stash/flutter_stash.dart';

class Wallet {
  String name;
  bool hasBalance;
  bool isSecondaryCurrency;
  List<DayEntry> dayEntries;
  IconData iconData;

  Wallet(
      {@required this.name,
      this.hasBalance = false,
      this.isSecondaryCurrency = false,
      this.dayEntries,
      this.iconData}) {
    this.dayEntries ??= [];
    this.dayEntries.sort();
  }

  double get totalSpent {
    return dayEntries.map((entry) => entry.totalSpent).reduce(sum);
  }

  Wallet.fromMap(Map map) {
    name = map['name'];
    hasBalance = map['hasBalance'] as bool;
    isSecondaryCurrency = map['isSecondaryCurrency'] as bool;
    iconData = IconData(map['iconData']);
    dayEntries = map['dayEntries'].map((dayEntry) => DayEntry.fromMap(dayEntry)).toList().cast<DayEntry>();
    dayEntries.sort();
  }

  double get balance {
    return dayEntries.map((entry) => entry.totalIncome - entry.totalSpent).reduce(sum);
  }

  void addEntry(Entry entry) {
    if (dayEntries.first.isToday)
      dayEntries.first.entries.add(entry);
    else
      dayEntries.add(DayEntry(dateTime: DateTime.now(), entries: [entry]));

    dayEntries.sort();
  }

  double averageSpending() {
    int nbDays = 1 + DateTime.now().difference(trip.start).inDays;
    double total = dayEntries.map((entry) => entry.totalSpent).reduce(sum);
    return total / nbDays;
  }

  Map toMap() {
    return {
      'name': name,
      'hasBalance': hasBalance,
      'isSecondaryCurrency': isSecondaryCurrency,
      'iconData': iconData.codePoint,
      'dayEntries': dayEntries.map((dayEntry) => dayEntry.toMap()).toList()
    };
  }

  @override
  String toString() {
    return 'Wallet{name: $name, hasBalance: $hasBalance, isSecondaryCurrency: $isSecondaryCurrency, dayEntries: $dayEntries, iconData: $iconData}';
  }
}
