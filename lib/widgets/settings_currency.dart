import 'package:flutter/material.dart';
import 'package:money_tracker/services/wallet_service.dart';

class SettingsCurrency extends StatefulWidget {
  @override
  _SettingsCurrencyState createState() => _SettingsCurrencyState();
}

class _SettingsCurrencyState extends State<SettingsCurrency> {
  final primaryController = TextEditingController(text: trip.currency.primary);
  final secondaryController =
      TextEditingController(text: trip.currency.secondary);
  final changeRateController =
      TextEditingController(text: trip.currency.changeRate.toString());

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    primaryController.dispose();
    secondaryController.dispose();
    changeRateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Devises"),
      ),
      body: Container(
          margin: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Devise principale"),
                controller: primaryController,
                style: new TextStyle(fontSize: 20.0),
              ),
              TextFormField(
                  decoration:
                      new InputDecoration(labelText: "Devise secondaire"),
                  controller: secondaryController,
                  style: new TextStyle(fontSize: 20.0)),
              TextFormField(
                decoration:
                    new InputDecoration(labelText: "Taux de conversion"),
                controller: changeRateController,
                style: new TextStyle(fontSize: 20.0),
                keyboardType: new TextInputType.numberWithOptions(decimal: true),
              ),
              RaisedButton(
                  child: Text("Valider",
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontSize: 20.0)),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    trip.currency.primary = primaryController.text;
                    trip.currency.secondary = secondaryController.text;
                    trip.currency.changeRate = double.parse((changeRateController.text).replaceAll(",", "."));
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  })
            ],
          )),
    );
  }
}
