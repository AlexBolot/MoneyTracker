import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:money_tracker/services/wallet_service.dart';

class SettingsCurrency extends StatefulWidget {
  @override
  _SettingsCurrencyState createState() => _SettingsCurrencyState();
}

class _SettingsCurrencyState extends State<SettingsCurrency> {
  final tripnameController = TextEditingController(text: trip.name);
  final primaryController = TextEditingController(text: trip.currency.primary);
  final secondaryController =
      TextEditingController(text: trip.currency.secondary);
  final changeRateController =
      TextEditingController(text: trip.currency.changeRate.toString());

//  final TextEditingController _controller = new TextEditingController(
//      text: new DateFormat.yMd().format(trip.start ?? DateTime.now()));
  final TextEditingController _controller = new TextEditingController();

  DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = new DateFormat.yMd('fr');
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    tripnameController.dispose();
    primaryController.dispose();
    secondaryController.dispose();
    changeRateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.text.isEmpty)
      {
        _controller.text = dateFormat.format(trip.start ?? DateTime.now());
      }
    return Scaffold(
      appBar: AppBar(title: Text("Devises")),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Intitulé du voyage"),
              controller: tripnameController,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: new InputDecoration(
                labelText: 'Début du voyage',
              ),
              controller: _controller,
              keyboardType: TextInputType.datetime,
              validator: (val) => isValidDate(val) ? null : 'Date invalide',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Devise principale"),
              controller: primaryController,
              style: TextStyle(fontSize: 20.0),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Devise secondaire"),
              controller: secondaryController,
              style: TextStyle(fontSize: 20.0),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Taux de conversion"),
              controller: changeRateController,
              style: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            RaisedButton(
              child: Text("Valider",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0)),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                trip.name = tripnameController.text;
                trip.start = convertToDate(_controller.text);
                trip.currency.primary = primaryController.text;
                trip.currency.secondary = secondaryController.text;
                trip.currency.changeRate = double.parse(
                    (changeRateController.text).replaceAll(",", "."));
                WalletService.saveWallets();
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
            ),
          ],
        ),
      ),
    );
  }

  bool isValidDate(String dateToCheck) {
    return dateToCheck.isNotEmpty && convertToDate(dateToCheck) != null;
  }

  DateTime convertToDate(String input) {
    try {
      var d = dateFormat.parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }
}
