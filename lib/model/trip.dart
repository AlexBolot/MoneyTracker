import 'package:flutter/material.dart';
import 'package:money_tracker/model/wallet.dart';
import 'package:money_tracker/model/currency.dart';
import 'package:flutter_stash/flutter_stash.dart';

class Trip {
  String name;
  DateTime start;
  Currency currency;
  List<Wallet> wallets;

  Trip(
      {@required this.name,
      @required this.start,
      this.currency,
      this.wallets}) {
    this.currency ??= Currency("", "", 1);
    this.wallets ??= [];
  }

  double get totalSpent {
    return wallets.map((entry) => entry.totalSpent).reduce(sum);
  }

  double get balance {
    return wallets.map((wallet) => wallet.balance).reduce(sum);
  }

  void addWallet(Wallet wallet) {
    this.wallets.add(wallet);
  }

  double averageSpending() {
    int nbDays = 1 + DateTime.now().difference(start).inDays;
    double total = wallets.map((wallet) => wallet.totalSpent).reduce(sum);
    return total / nbDays;
  }
}
