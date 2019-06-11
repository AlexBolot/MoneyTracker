import 'package:flutter/material.dart';

class Currency {
  String primary;
  String secondary;
  double changeRate;

  bool isPrimary(String currency) => currency == primary;

  bool isSecondary(String currency) => currency == secondary;

  Currency({@required this.primary, this.secondary = "", this.changeRate = 1}) {
    if (this.primary == secondary || this.changeRate <= 0) this.changeRate = 1;
  }

  String format({@required double amount, bool secondary = false}) {
    double rate = secondary ? changeRate : 1;
    String amountString = (amount * rate).toStringAsFixed(2);
    return secondary ? '$amountString ${this.secondary}' : '$amountString ${this.primary}';
  }
}
