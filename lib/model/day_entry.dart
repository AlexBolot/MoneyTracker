import 'package:money_tracker/model/entry.dart';

class DayEntry {
  List<Entry> entries;
  DateTime dateTime;

  double get totalSpent {
    return entries.where((entry) => entry.isSpending).map((entry) => entry.amount).reduce((a, b) => a + b);
  }

  double get totalIncome {
    return entries.where((entry) => entry.isIncome).map((entry) => entry.amount).reduce((a, b) => a + b);
  }

  DayEntry({this.entries, this.dateTime}) {
    this.entries ??= [];
  }
}
