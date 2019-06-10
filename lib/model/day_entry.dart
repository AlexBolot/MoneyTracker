import 'package:money_tracker/model/entry.dart';

class DayEntry {
  List<Entry> entries;
  DateTime dateTime;

  double get totalSpent {
    return entries.where((entry) => entry.isSpending).map((entry) => entry.amount).reduce((val1, val2) => val1 + val2);
  }

  DayEntry({this.entries, this.dateTime}) {
    this.entries ??= [];
  }
}
