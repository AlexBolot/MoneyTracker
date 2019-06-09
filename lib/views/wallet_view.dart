import 'package:flutter/material.dart';
import 'package:money_tracker/model/wallet.dart';

class WalletView extends StatefulWidget {
  static const String routeName = "/WalletView";

  final Wallet wallet;

  const WalletView({this.wallet});

  @override
  _WalletViewState createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(widget.wallet.name),
      ),
    );
  }
}
