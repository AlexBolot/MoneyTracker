import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/settings.dart';
import 'package:money_tracker/widgets/description_tab.dart';

class Home extends StatefulWidget {
  static const String routeName = "/Home";

  final String title;

  const Home({this.title = 'Home page'});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: [
              DescriptionTab(text: "Accueuil", iconData: Icons.home),
              DescriptionTab(text: "Liquide", iconData: Icons.account_balance_wallet),
              DescriptionTab(text: "N26", iconData: Icons.account_balance_wallet),
            ],
          ),
        ),
        drawer: Settings(),
        body: Container(
          child: Center(
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}
