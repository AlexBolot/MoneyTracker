import 'package:flutter/material.dart';
import 'package:flutter_stash/flutter_stash.dart';
import 'package:money_tracker/model/day_entry.dart';
import 'package:money_tracker/model/entry.dart';
import 'package:money_tracker/model/wallet.dart';
//import 'package:money_tracker/services/wallet_service.dart';
import 'package:money_tracker/model/trip.dart';
import 'package:money_tracker/model/currency.dart';
import 'package:money_tracker/views/global_view.dart';
import 'package:intl/date_symbol_data_local.dart' as intl;
//import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

Trip trip;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    trip = initTrip();
    String applicationName = 'Money Tracker';

    buildSplashScreen() => SplashScreen(title: applicationName,
        nextRouteName: GlobalView.routeName,
        loadFunctions: [
          () async => await intl.initializeDateFormatting("fr", null),
          /*() async => WalletService.documentsPath = (await getApplicationDocumentsDirectory()).path,
          () async => WalletService.readWallets(),*/
        ]);

    return MaterialApp(
      title: applicationName,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => buildSplashScreen(),
        SplashScreen.routeName: (context) => buildSplashScreen(),
        GlobalView.routeName: (context) => GlobalView(),
      },
    );
  }
}

Trip initTrip() {
  Trip cTrip = Trip(
    name: 'Canada 2019',
    start: DateTime.now().add(Duration(days: -5)),
    currency: Currency("\$", "€", 0.69869657),
  );
  cTrip.addWallet(Wallet(
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
  ));
  cTrip.addWallet(Wallet(
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
  ));
  return cTrip;
}

/*

wallets: [
      Wallet(
        name: 'N26',
        iconData: Icons.account_balance_wallet,
        isSecondaryCurrency: true,
        hasBalance: false,
        start: DateTime.now().add(Duration(days: -5)),
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
        start: DateTime.now().add(Duration(days: -3)),
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
    ]


*/
