import 'package:flutter/material.dart';

class DisplaySecondCurrencyState extends StatefulWidget {

  @override
  _DisplaySecondCurrencyState createState() => new _DisplaySecondCurrencyState();
}

class _DisplaySecondCurrencyState extends State<DisplaySecondCurrencyState> {
  bool _v = false;
  @override
  Widget build(BuildContext context) {
    return  SwitchListTile(
      value:_v,
      onChanged: (value)=>setState((){
        _v=value;
      }),

    );
  }
}