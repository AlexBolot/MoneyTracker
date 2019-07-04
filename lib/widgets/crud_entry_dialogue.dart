import 'package:flutter/material.dart';
import 'package:money_tracker/model/entry.dart';
import 'package:money_tracker/services/wallet_service.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class CrudEntryDialogue extends StatefulWidget {
  final Entry entry;

  const CrudEntryDialogue({this.entry});

  @override
  _CrudEntryDialogueState createState() => _CrudEntryDialogueState();
}

class _CrudEntryDialogueState extends State<CrudEntryDialogue> {
  DateTime entryDate;
  String name = "";
  double amount = 0;
  bool isIncome = false;
  bool modif = false;

  DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = new DateFormat.yMd('fr');
  }

  final TextEditingController entryDateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final FocusNode nameNode = new FocusNode();
  final FocusNode amountNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    if (widget.entry != null && !modif) {
      nameController.text = widget.entry.name;
      amountController.text = widget.entry.amount.toStringAsFixed(2);
      entryDateController.text = dateFormat.format(widget.entry.dateTime);
      isIncome = widget.entry.isIncome;
      modif = true;
    }
    if (entryDateController.text.isEmpty) {
      entryDateController.text = dateFormat.format(WalletService.lastEntryDate);
    }
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Opacity(
                    opacity: modif ? 0.0:1.0,
                    child: RaisedButton(
                        color: Colors.blue,
                        child: Icon(Icons.calendar_today, size: 32),
                        onPressed: () {
                          _selectDate(
                              entryDateController); // Call Function that has showDatePicker()

                          FocusScope.of(context).requestFocus(nameNode);
                        }),
                  ),
                  VerticalDivider(),
                  Expanded(
                    child: TextField(
                      autofocus: false,
                      enabled: false,
                      textAlign: TextAlign.center,
                      controller: entryDateController,
                      decoration: InputDecoration(
                        labelText: 'Jour',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                focusNode: nameNode,
                autofocus: true,
                controller: nameController,
                textCapitalization: TextCapitalization.sentences,
                onSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(amountNode),
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
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true, signed: true),
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
                Checkbox(
                    value: isIncome,
                    onChanged: (bool value) =>
                        setState(() => this.isIncome = value)),
                Text("Apport"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buttons(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buttons() {
    List<Widget> items = [];

    if (modif) {
      items.add(RaisedButton(
        color: Colors.orangeAccent,
        child: Icon(
          Icons.delete,
          size: 32,
        ),
        onPressed: () {
          Navigator.of(context).pop(
              Entry(name: "", amount: 0)); // si nom vide et 0 > suppression
        },
      ));
    }

    items.add(RaisedButton(
      color: Colors.greenAccent,
      child: Icon(Icons.check_circle, size: 32),
      onPressed: () {
        double amount =
            double.parse(amountController.text.trim().replaceAll(",", "."));
        String name = nameController.text.trim();
        DateTime entryDate = convertToDate(entryDateController.text);
        Navigator.of(context).pop(
          Entry(
              amount: amount,
              name: name,
              isIncome: isIncome,
              dateTime: entryDate),
        );
      },
    ));

    return items;
  }

  Future _selectDate(TextEditingController textDate) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate:
            convertToDate(textDate.text) ?? WalletService.lastEntryDate,
        firstDate: trip.start,
        lastDate: new DateTime.now().add(Duration(days: 1)));
    if (picked != null)
      setState(() {
        WalletService.lastEntryDate = picked;
        return textDate.text = dateFormat.format(picked);
      });
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
