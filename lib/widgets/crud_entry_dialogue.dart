import 'package:flutter/material.dart';
import 'package:money_tracker/model/entry.dart';
import 'package:money_tracker/services/wallet_service.dart';
import 'package:flutter_stash/flutter_stash.dart';

class CrudEntryDialogue extends StatefulWidget {
  final Entry entry;

  const CrudEntryDialogue({this.entry});

  @override
  _CrudEntryDialogueState createState() => _CrudEntryDialogueState();
}

class _CrudEntryDialogueState extends State<CrudEntryDialogue> {
  String name = "";
  double amount = 0;
  bool isIncome = false;
  bool modif = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final FocusNode amountNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    if (widget.entry != null && !modif) {
      nameController.text = widget.entry.name;
      amountController.text = widget.entry.amount.toStringAsFixed(2);
      isIncome = widget.entry.isIncome;
      modif = true;
    }
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                autofocus: true,
                controller: nameController,
                textCapitalization: TextCapitalization.sentences,
                onSubmitted: (_) => FocusScope.of(context).requestFocus(amountNode),
                decoration: InputDecoration(
                  labelText: 'Intitulé',
                  border: OutlineInputBorder(),
                  hintText: 'exemple : "cinéma"',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                focusNode: amountNode,
                keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Montant en ' + trip.currency.primary,
                  border: OutlineInputBorder(),
                  hintText: 'exemple : "3.25"',
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Checkbox(value: isIncome, onChanged: (bool value) => setState(() => this.isIncome = value)),
                Text("Apport"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: buildButtons(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildButtons() {
    List<Widget> items = [];

    if (modif) {
      items.add(RaisedButton(
        padding: EdgeInsets.all(4),
        color: Colors.red,
        child: Icon(Icons.delete, size: 32, color: contrastOf(Colors.red)),
        onPressed: () => Navigator.of(context).pop(Entry(name: '', amount: 0)), // si nom vide et 0 -> suppression
      ));
    }

    items.add(RaisedButton(
      padding: EdgeInsets.all(4),
      color: Colors.green,
      child: Icon(Icons.check, size: 32, color: contrastOf(Colors.green)),
      onPressed: () {
        double amount = double.parse(amountController.text.trim().replaceAll(',', '.'));
        String name = nameController.text.trim();
        Navigator.of(context).pop(Entry(amount: amount, name: name, isIncome: isIncome));
      },
    ));

    return items;
  }
}
