import 'package:flutter/material.dart';

class DescriptionTab extends StatefulWidget {
  final String text;
  final IconData iconData;

  const DescriptionTab({Key key, this.text, this.iconData}) : super(key: key);

  @override
  _DescriptionTabState createState() => _DescriptionTabState();
}

class _DescriptionTabState extends State<DescriptionTab> {
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(widget.iconData),
          ),
          Text(widget.text),
        ],
      ),
    );
  }
}
