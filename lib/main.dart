import 'package:flutter/material.dart';
import 'package:money_tracker/model/day_entry.dart';
import 'package:money_tracker/model/entry.dart';
import 'package:money_tracker/model/static_currency.dart';
import 'package:money_tracker/model/wallet.dart';
import 'package:money_tracker/views/global_view.dart';
import 'package:money_tracker/views/splash_screen.dart';

void main() {
  StaticCurrency.primary="\$";
  StaticCurrency.secondary="€";
  StaticCurrency.changeRate=0.6666;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        GlobalView.routeName: (context) => GlobalView()
      },
    );
  }
}

Color contrastOf(Color background) {
  var brightness = ThemeData.estimateBrightnessForColor(background);
  return brightness == Brightness.light ? Colors.black : Colors.white;
}

String toFirstUpper(String string) {
  return string[0].toUpperCase() + string.substring(1).toLowerCase();
}

double sum(double a, double b) => a + b;

List<Wallet> wallets = [
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
];