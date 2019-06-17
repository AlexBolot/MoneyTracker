import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:money_tracker/model/day_entry.dart';
import 'package:money_tracker/model/entry.dart';
import 'package:money_tracker/model/wallet.dart';

class WalletService {
  static String documentsPath;

  static List<Wallet> wallets = [
    Wallet(
    name: 'N26',
    iconData: Icons.account_balance_wallet,
    isSecondaryCurrency: true,
    hasBalance: false,
    dayEntries: [
      DayEntry(dateTime: DateTime.now(), entries: [
        Entry(name: 'Glaces', amount: 2.3),
        Entry(name: 'Escence', amount: 35.75),
      ]),
      DayEntry(dateTime: DateTime.now().add(Duration(days: -1)), entries: [
        Entry(name: 'Courses', amount: 43.2),
        Entry(name: 'Retrait', amount: 50, isIncome: true),
      ]),
      DayEntry(dateTime: DateTime.now().add(Duration(days: -2)), entries: [
        Entry(name: 'Cinéma', amount: 12.3),
        Entry(name: 'Change Nice', amount: 300, isIncome: true),
      ]),
    ],
  ),
    Wallet(
      name: 'Cash',
      iconData: Icons.account_balance_wallet,
      isSecondaryCurrency: false,
      hasBalance: true,
      dayEntries: [
        DayEntry(dateTime: DateTime.now().add(Duration(days: -1)), entries: [
          Entry(name: 'Glaces', amount: 2.3),
          Entry(name: 'Escence', amount: 35.75),
        ]),
        DayEntry(dateTime: DateTime.now().add(Duration(days: -2)), entries: [
          Entry(name: 'Courses', amount: 43.2),
          Entry(name: 'Retrait', amount: 50),
        ]),
        DayEntry(dateTime: DateTime.now().add(Duration(days: -3)), entries: [
          Entry(name: 'Cinéma', amount: 12.3),
          Entry(name: 'Virement', amount: 500, isIncome: true),
        ]),
      ],
    ),
  ];

  static saveWallets() {
    File file = File('$documentsPath/wallets.json');

    Map<String, String> walletMap = {};

    for (Wallet wallet in wallets) {
      walletMap.putIfAbsent(wallet.name, () => json.encode(wallet.toMap()));
    }

    print('encoding : ${json.encode(walletMap)}');

    file.writeAsString(json.encode(walletMap));
  }

  static readWallets() async {
    File file = File('$documentsPath/wallets.json');

    print('');

    print(file.readAsStringSync());
    print(json.decode(await file.readAsString()));

    print('');

    Map map = json.decode(await file.readAsString());

    wallets.clear();

    for (String key in map.keys) {
      wallets.add(Wallet.fromMap(json.decode(map[key])));
    }
  }
}
