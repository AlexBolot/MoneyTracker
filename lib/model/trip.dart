import 'package:flutter/material.dart';
import 'package:money_tracker/model/wallet.dart';
import 'package:money_tracker/model/currency.dart';
import 'package:flutter_stash/flutter_stash.dart';

class Trip {
  String name;
  DateTime start;
  Currency currency;
  List<Wallet> wallets;

  Trip({@required this.name, @required this.start, this.currency, this.wallets}) {
    this.currency ??= Currency("", "", 1);
    this.wallets ??= [];
  }

  Trip.fromMap(Map map) {
    name = map['name'];
    currency = Currency.fromMap(map['currency']);
    start = DateTime.parse(map['start']);
    wallets = map['wallets'].map((sub) => Wallet.fromMap(sub)).toList().cast<Wallet>();
  }

  double get totalSpent {
    //List<DayEntry> =
      var tt = wallets.map((dayEntry) => dayEntry.totalSpent); //.reduce(sum);
      var ttt = tt.reduce(sum);
      return ttt;
  }

  double get balance {
    return wallets.map((wallet) => wallet.balance).reduce(sum);
  }

  void addWallet(Wallet wallet) {
    this.wallets.add(wallet);
  }

  double averageSpending() {
    int nbDays = 1 + DateTime.now().difference(start).inDays;
    double total =  wallets.map((wallet) => wallet.totalSpent).reduce(sum);
    return total / nbDays;
  }

  Map toMap() {
    return {
      'name': name,
      'start': start.toIso8601String(),
      'currency': currency.toMap(),
      'wallets': wallets.map((wallet) => wallet.toMap()).toList(),
    };
  }
}
