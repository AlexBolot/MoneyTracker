import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/settings_currency.dart';

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

                  title: Text("Mes porte-monnaie", style: new TextStyle(fontSize: 20 ),),
                  onTap: () {
                    print("Mes porte-monnaie");
                  }),
              ListTile(
                  title: Text("Devises", style: new TextStyle(fontSize: 20 ),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsCurrency()),
                    );
                  }),
            ],
          )),
    );
  }
}
