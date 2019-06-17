import 'package:flutter/material.dart';

class Currency {
  String primary;
  String secondary;
  double changeRate;

  Currency(this.primary, this.secondary, this.changeRate);

  bool isPrincipal(String currency) => currency == primary;
  bool isSecondary(String currency) => currency == secondary;

  String format({@required double amount, bool isSecondary = false}) {
    double rate = isSecondary ? changeRate : 1;
    String amountString = (amount * rate).toStringAsFixed(2);
    return isSecondary ? '$amountString $secondary' : '$amountString $primary';
  }

}
