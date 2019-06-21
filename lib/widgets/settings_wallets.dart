import 'package:flutter/material.dart';
import 'package:money_tracker/model/wallet.dart';
import 'package:money_tracker/services/wallet_service.dart';
import 'package:money_tracker/widgets/wallet_card.dart';

class SettingsWallets extends StatefulWidget {
  @override
  _SettingsWalletsState createState() => _SettingsWalletsState();
}

class _SettingsWalletsState extends State<SettingsWallets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mes porte-monnaie")),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView(children: buildItems()),
      ),
    );
  }
}

List<Widget> buildItems() {
  List<Widget> items = [];
  for (Wallet wallet in trip.wallets) {
    items.add(WalletCard(wallet: wallet));
  }
  return items;
}
