import 'package:flutter/material.dart';
import 'package:money_tracker/main.dart';
import 'package:money_tracker/model/static_currency.dart';
import 'package:money_tracker/model/entry.dart';
import 'package:intl/intl.dart';

class CurrencySettingView extends StatefulWidget {
  static const String routeName = "/CurrencySettingView";

  @override
  _CurrencySettingViewState createState() => _CurrencySettingViewState();
}

class _CurrencySettingViewState extends State<CurrencySettingView> {
  String primary;
  String secondary;
  double changeRate;

  @override
  void initState() {
    super.initState();

    primary   = StaticCurrency.primary;
    secondary = StaticCurrency.secondary;
    changeRate = StaticCurrency.changeRate;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
                decoration: InputDecoration(
                    labelText: "Devise principale"),
                initialValue: primary),
            TextFormField(
                decoration: new InputDecoration(
                    labelText: "Devise secondaire"),
                initialValue: secondary),
          ],
        ),
      ),
    );
  }
}