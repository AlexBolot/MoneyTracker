import 'package:flutter/material.dart';

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
          child: ListView(
            children: <Widget>[
              ListTile(
                  title: Text("Mes porte-monnaie"),
                  onTap: () {
                    print("Mes porte-monnaie");
                  }),
              ListTile(
                  title: Text("Devises"),
                  onTap: () {
                    print("Devises");
                  }),
              SwitchListTile(
                  value: true,
                  title: Text("Affichage dans la devise secondaire"),
                  onChanged: (value) {
                    setState(() {
                      value == !value;
                      print ( "Affichage en devise secondaire : " + value.toString()  );
                    });
                  })
            ],
          )),
    );
  }
}

/*
 *               title: 
              trailing: DisplaySecondCurrencyState(),
 */
