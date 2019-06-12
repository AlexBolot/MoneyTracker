import 'package:money_tracker/model/entry.dart';
import 'package:money_tracker/main.dart';

class DayEntry extends Comparable<DayEntry> {
  List<Entry> entries;
  DateTime dateTime;

  double get totalSpent {
    return entries.where((entry) => entry.isSpending).map((entry) => entry.amount).reduce(sum);
  }

  double get totalIncome {
    List<Entry> incomes = entries.where((entry) => entry.isIncome).toList();

    if(incomes.isEmpty) return 0;

    return incomes.map((entry) => entry.amount).reduce(sum);
  }

  DayEntry({this.entries, this.dateTime}) {
    this.entries ??= [];
  }

  bool get isToday => dateTime.day == DateTime.now().day;

  @override
  int compareTo(DayEntry other) => -dateTime.compareTo(other.dateTime);
}
