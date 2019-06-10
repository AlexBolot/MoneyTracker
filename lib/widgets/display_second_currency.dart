import 'package:flutter/material.dart';

class DisplaySecondCurrencyState extends StatefulWidget {

  @override
  _DisplaySecondCurrencyState createState() {
    return new _DisplaySecondCurrencyState();
  }
}

class _DisplaySecondCurrencyState extends State<DisplaySecondCurrencyState> {
  bool _v = false;
  _DisplaySecondCurrencyState();
  @override
  Widget build(BuildContext context) {
    return  SwitchListTile(
      value:_v,
      title : Text("Essai"),
      onChanged: (value)=>setState((){
        _v=value;
      }),

    );
  }
}