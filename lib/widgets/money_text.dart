import 'package:flutter/material.dart';
import 'package:flutter_stash/flutter_stash.dart';
import 'package:money_tracker/model/static_currency.dart';

class MoneyText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double amount;
  final bool isSecondary;
  final TextAlign textAlign;

  const MoneyText({@required this.amount, this.text = '', this.isSecondary = false, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    String currentAmount = StaticCurrency.format(amount: amount, isSecondary: isSecondary);
    String calculatedAmount = StaticCurrency.format(amount: amount, isSecondary: !isSecondary);

    return TooltipText(
      text: '$text $currentAmount',
      tooltip: '$currentAmount = $calculatedAmount',
      style: style,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
