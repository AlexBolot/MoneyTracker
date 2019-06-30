import 'package:flutter/material.dart';
import 'package:money_tracker/model/wallet.dart';

class CrudWalletDialogue extends StatefulWidget {
  final Wallet wallet;

  const CrudWalletDialogue({this.wallet});

  @override
  _CrudWalletDialogueState createState() => _CrudWalletDialogueState();
}

class _CrudWalletDialogueState extends State<CrudWalletDialogue> {
  String name = "";
  bool isSecondaryCurrency = false;
  bool hasBalance = true;
  bool modif = false;

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.wallet != null && !modif) {
      nameController.text = widget.wallet.name;
      isSecondaryCurrency = widget.wallet.isSecondaryCurrency;
      hasBalance = widget.wallet.hasBalance;
      modif = true;
    }
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
                decoration: InputDecoration(
                  labelText: 'Intitulé',
                  border: OutlineInputBorder(),
                  hintText: 'exemple : "Ma carte bleue"',
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Checkbox(
                    value: isSecondaryCurrency,
                    onChanged: (bool value) =>
                        setState(() => this.isSecondaryCurrency = value)),
                Text("En devise secondaire"),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                    value: hasBalance,
                    onChanged: (bool value) =>
                        setState(() => this.hasBalance = value)),
                Text("Suivi de solde"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buttons(context, modif, isSecondaryCurrency, hasBalance,
                  nameController),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> buttons(
  BuildContext context,
  bool modif,
  bool isSecondaryCurrency,
  bool hasBalance,
  TextEditingController nameController,
) {
  List<Widget> items = [];

/*  if (modif) {
    items.add(RaisedButton(
      color: Colors.orangeAccent,
      child: Icon(
        Icons.delete,
        size: 32,
      ),
      onPressed: () {
        Navigator.of(context)
            .pop(Wallet(name: "")); // si nom vide et 0 > suppression
      },
    ));
  }
*/

  items.add(RaisedButton(
    color: Colors.greenAccent,
    child: Icon(Icons.check_circle, size: 32),
    onPressed: () {
      String name = nameController.text.trim();

      Navigator.of(context).pop(
        Wallet(
          name: name,
          isSecondaryCurrency: isSecondaryCurrency,
          hasBalance: hasBalance,
          iconData: Icons.account_balance_wallet,
        ),
      );
    },
  ));

  return items;
}
