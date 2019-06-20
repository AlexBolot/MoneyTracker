import 'package:flutter/material.dart';

class Currency {
  String primary;
  String secondary;
  double changeRate;

  Currency(this.primary, this.secondary, this.changeRate);

  Currency.fromMap(Map map) {
    this.primary = map['primary'];
    this.secondary = map['secondary'];
    this.changeRate = map['changeRate'];
  }

  bool isPrincipal(String currency) => currency == primary;

  bool isSecondary(String currency) => currency == secondary;

  double toCurrency({@required double amount, bool isSecondary = false})
  {
    double rate = isSecondary ? changeRate : 1;
    return (amount * rate);
  }

  double toPrimary({@required double amount, bool isSecondary = false})
  {
    double rate = isSecondary ? changeRate : 1;
    return (amount / rate);
  }

  String format({@required double amount, bool isSecondary = false}) {
    String amountString = (toCurrency(amount: amount, isSecondary: isSecondary )).toStringAsFixed(2);
    return isSecondary ? '$amountString $secondary' : '$amountString $primary';
  }

  Map toMap() {
    return {
      'primary': primary,
      'secondary': secondary,
      'changeRate': changeRate,
    };
  }
}
