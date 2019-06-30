import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/settings_currency.dart';
import 'package:money_tracker/widgets/settings_wallets.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Paramètres")),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Mon voyage", style: TextStyle(fontSize: 20)),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsCurrency())),
            ),
            ListTile(
              title: Text("Mes porte-monnaie", style: TextStyle(fontSize: 20)),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsWallets())),
            ),
          ],
        ),
      ),
    );
  }
}
