import 'package:flutter/material.dart';

class Wallet{

  String currency;
  String name;
  DateTime start;
  bool hasBalance;

  Wallet( {@required this.name, @required this.start, this.currency, this.hasBalance = false});

}