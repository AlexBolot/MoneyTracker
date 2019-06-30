import 'package:money_tracker/model/entry.dart';
import 'package:flutter_stash/flutter_stash.dart';

class DayEntry extends Comparable<DayEntry> {
  List<Entry> entries;
  DateTime dateTime;

  double get totalSpent {
    List<Entry> spendings = entries.where((entry) => entry.isSpending).toList();
    if (spendings.isEmpty) return 0;
    return spendings.map((entry) => entry.amount).reduce(sum);
  }

  double get totalIncome {
    List<Entry> incomes = entries.where((entry) => entry.isIncome).toList();
    if (incomes.isEmpty) return 0;
    return incomes.map((entry) => entry.amount).reduce(sum);
  }

  DayEntry({this.entries, this.dateTime}) {
    this.entries ??= [];
  }

  DayEntry.fromMap(Map map) {
    dateTime = DateTime.parse(map['dateTime']);
    entries = map['entries']
        .map((entry) => Entry.fromMap(entry))
        .toList()
        .cast<Entry>();
  }

  bool get isToday => dateTime.day == DateTime.now().day;

  Map toMap() {
    return {
      'dateTime': dateTime.toIso8601String(),
      'entries': entries.map((entry) => entry.toMap()).toList()
    };
  }

  @override
  int compareTo(DayEntry other) => -dateTime.compareTo(other.dateTime);

  @override
  String toString() {
    return '$dateTime';
  }
}
