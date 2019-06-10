import 'package:flutter/material.dart';

class Currency {
  String principal;
  String secondary;
  double principalToSecondaryRate;

  bool isPrincipal(String currency) => currency == principal;

  bool isSecondary(String currency) => currency == secondary;

  Currency({@required this.principal, secondary = "", this.principalToSecondaryRate = 1}) {
    if (this.principal == secondary || this.principalToSecondaryRate <= 0) this.principalToSecondaryRate = 1;
  }
}
