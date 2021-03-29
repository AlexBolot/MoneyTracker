import 'package:flutter/material.dart';
import 'package:money_tracker/model/wallet.dart';
import 'package:money_tracker/services/wallet_service.dart';
import 'package:money_tracker/widgets/wallet_card.dart';

import 'crud_wallet_dialog.dart';

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
        child: Stack(
          alignment: Alignment(1, 1),
          children: <Widget>[
            Container(child: ListView(children: buildItems())),
            /*Padding(
              padding: const EdgeInsets.all(32.0),
              child: FloatingActionButton(
                tooltip: "Ajouter un porte-monnaie",
                child: Icon(Icons.add, size: 32),
                onPressed: () async {
                  Wallet res = await showDialog(
                      context: context,
                      builder: (context) => CrudWalletDialogue());

                  if (res == null) return;

                  trip.wallets.add(res);
                  WalletService.saveWallets();
                  //setState(() {});
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  List<Widget> buildItems() {
    List<Widget> items = [];
    for (Wallet wallet in trip.wallets) {
      items.add(walletLine(wallet));
    }
    return items;
  }

  Widget walletLine(Wallet wallet) {
    return InkWell(
        onTap: () async {
          Wallet res = await showDialog(context: context, builder: (context) => CrudWalletDialogue(wallet: wallet));

          if (res != null) {
            wallet.name = res.name;
            wallet.isSecondaryCurrency = res.isSecondaryCurrency;
            wallet.hasBalance = res.hasBalance;
            wallet.iconData = res.iconData;
          }
          WalletService.saveWallets();
          //setState(() {});
        },
        child: WalletCard(wallet: wallet));
  }
/*
      return Scaffold(
      appBar: AppBar(title: Text("Mes porte-monnaie")),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView(children: buildItems()),
      ),
    );
*/
}
