import 'package:flutter/material.dart';

class StaticCurrency {
  static String primary;
  static String secondary;
  static double changeRate;
  static bool isPrincipal(String currency) => currency == primary;
  static bool isSecondary(String currency) => currency == secondary;
  static String format({@required double amount, bool isSecondary = false}) {
    double rate = isSecondary ? changeRate : 1;
    String amountString = (amount * rate).toStringAsFixed(2);
    return isSecondary ? '$amountString ${secondary}' : '$amountString ${primary}';
  }

}
