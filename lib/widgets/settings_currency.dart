import 'package:flutter/material.dart';
import 'package:money_tracker/model/static_currency.dart';

class SettingsCurrency extends StatefulWidget {
  @override
  _SettingsCurrencyState createState() => _SettingsCurrencyState();
}

class _SettingsCurrencyState extends State<SettingsCurrency> {
  final primaryController = TextEditingController(text: StaticCurrency.primary);
  final secondaryController =
      TextEditingController(text: StaticCurrency.secondary);
  final changeRateController =
      TextEditingController(text: StaticCurrency.changeRate.toString());

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
                    StaticCurrency.primary = primaryController.text;
                    StaticCurrency.secondary = secondaryController.text;
                    StaticCurrency.changeRate = double.parse((changeRateController.text).replaceAll(",", "."));
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  })
            ],
          )),
    );
  }
}
