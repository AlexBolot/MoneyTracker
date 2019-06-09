import 'package:flutter/material.dart';
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
    Wallet(name: 'Liquide', start: DateTime.now()),
    Wallet(name: 'N26', start: DateTime.now()),
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

    tabs.add(DescriptionTab(text: 'Accueuil', iconData: Icons.home));

    for (Wallet wallet in wallets) {
      tabs.add(DescriptionTab(text: wallet.name, iconData: Icons.account_balance_wallet));
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
