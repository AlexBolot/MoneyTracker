import 'package:flutter/material.dart';
import 'package:money_tracker/main.dart';
import 'package:flutter_stash/flutter_stash.dart';

class MoneyText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double amount;
  final bool isSecondary;
  final TextAlign textAlign;

  const MoneyText({@required this.amount, this.text = '', this.isSecondary = false, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {

    String currentAmount = trip.currency.format(amount: amount, isSecondary: isSecondary);
    String calculatedAmount = trip.currency.format(amount: amount, isSecondary: !isSecondary);

    return TooltipText(
      text: '$text $currentAmount',
      tooltip: '$currentAmount = $calculatedAmount',
      style: style,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
