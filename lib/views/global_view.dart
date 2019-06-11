import 'package:flutter/material.dart';
import 'package:money_tracker/model/day_entry.dart';
import 'package:money_tracker/model/entry.dart';
import 'package:money_tracker/model/wallet.dart';
import 'package:money_tracker/views/recap_view.dart';
import 'package:money_tracker/views/wallet_view.dart';
import 'package:money_tracker/widgets/settings.dart';
import 'package:money_tracker/widgets/description_tab.dart';

class GlobalView extends StatefulWidget {
  static const String routeName = "/GlobalView";

  final String title;

  const GlobalView({this.title = 'Money Tracker'});

  @override
  _GlobalViewState createState() => _GlobalViewState();
}

class _GlobalViewState extends State<GlobalView> with SingleTickerProviderStateMixin {
  TabController tabController;

  List<Wallet> wallets = [
    Wallet(
      name: 'N26',
      iconData: Icons.account_balance_wallet,
      isSecondaryCurrency: false,
      hasBalance: true,
      start: DateTime.now(),
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
        ]),
      ],
    ),
    Wallet(
      name: 'Cash',
      iconData: Icons.account_balance_wallet,
      isSecondaryCurrency: true,
      hasBalance: false,
      start: DateTime.now(),
      dayEntries: [
        DayEntry(dateTime: DateTime.now(), entries: [
          Entry(name: 'Glaces', amount: 2.3),
          Entry(name: 'Escence', amount: 35.75),
        ]),
        DayEntry(dateTime: DateTime.now().add(Duration(days: -1)), entries: [
          Entry(name: 'Courses', amount: 43.2),
        ]),
        DayEntry(dateTime: DateTime.now().add(Duration(days: -2)), entries: [
          Entry(name: 'Cinéma', amount: 12.3),
        ]),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: wallets.length + 1, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          isScrollable: true,
          controller: tabController,
          tabs: tabs(),
        ),
      ),
      drawer: Settings(),
      body: TabBarView(
        controller: tabController,
        children: tabViews(),
      ),
    );
  }

  List<Widget> tabs() {
    List<Widget> tabs = [];

    tabs.add(DescriptionTab(text: '', iconData: Icons.home));

    for (Wallet wallet in wallets) {
      tabs.add(DescriptionTab(text: wallet.name, iconData: wallet.iconData));
    }

    return tabs;
  }

  List<Widget> tabViews() {
    List<Widget> views = [];

    views.add(HomeView());

    for (Wallet wallet in wallets) {
      views.add(WalletView(wallet: wallet));
    }

    return views;
  }
}
