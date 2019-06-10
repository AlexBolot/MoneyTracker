import 'package:flutter/material.dart';

import 'display_second_currency.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paramètres"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: RaisedButton(
                  child: Text("Mes porte-monnaie"),
                  onPressed: () {
                    print("Mes porte-monnaie");
                  }),
            ),
            Container(
              child: RaisedButton(
                  child: Text("Devise secondaire"),
                  onPressed: () {
                    print("Devise secondaire");
                  }),
            ),
            Container(
              child: Text("Afficher dans la devise secondaire"),
            ),
            Container(
              child: DisplaySecondCurrencyState(),
            )
          ],
        ),
      ),
    );
  }
}

/*
 *               title: 
              trailing: DisplaySecondCurrencyState(),
 */
