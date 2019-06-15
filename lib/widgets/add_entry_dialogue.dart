import 'package:flutter/material.dart';
import 'package:money_tracker/model/entry.dart';

class AddEntryDialogue extends StatefulWidget {
  @override
  _AddEntryDialogueState createState() => _AddEntryDialogueState();
}

class _AddEntryDialogueState extends State<AddEntryDialogue> {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  bool isIncome = false;

  FocusNode amountNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
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
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                focusNode: amountNode,
                keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Montant',
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
            RaisedButton(
              child: Text('save'),
              onPressed: () {
                double amount = double.parse(amountController.text.trim().replaceAll(",", "."));
                String name = nameController.text.trim();

                Navigator.of(context).pop(
                  Entry(
                    amount: amount,
                    name: name,
                    isIncome: isIncome,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
